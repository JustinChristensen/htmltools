#!/usr/bin/env node

const yargs = require('yargs')
const { hideBin } = require('yargs/helpers')
const { get } = require('https');
const { existsSync, readFileSync, writeFileSync, mkdirSync } = require('fs');
const { basename } = require('path');
const { parse: parseHtml } = require('parse5');

const config = {
    indexUrl: 'https://html.spec.whatwg.org/multipage/indices.html',
    tmpDir: 'tmp',
    dataDir: 'data',
    dropList: [
        'MathML',
        'SVG',
        'autonomous custom elements'
    ],

    // db tables 
    elementsTable: 'elements',
    attributesTable: 'attributes',
    categoriesTable: 'categories',

    globalAttrsName: 'Global attributes'
};    

config.tmpIndexHtmlFile = `${config.tmpDir}/${basename(config.indexUrl)}`;

config.elementsSqlFile = `${config.dataDir}/elements.sql`;
config.categoriesSqlFile = `${config.dataDir}/categories.sql`;
config.attributesSqlFile = `${config.dataDir}/attributes.sql`;

// spec elements table columns
const ET = {
    ELEMENT: 0
};

// spec attributes table columns
const AT = {
    ATTRIBUTE: 0,
    ELEMENTS: 1
};

// spec categories table columns
const CT = {
    CATEGORY: 0
};

const dropRE = new RegExp(config.dropList.join('|'));
const dropStrings = arr => arr.map(v => v.replace(dropRE, '').trim());

const uniq = arr => arr.filter((v, i) => arr.indexOf(v) === i);

const cleanUp = arr => {
    arr = uniq(arr);
    arr = dropStrings(arr);
    arr = arr.filter(v => v !== '');
    return arr;
};

const inDir = (path, fn) => () => (mkdirSync(path, { recursive: true }), fn());

const getUrl = url => new Promise((resolve, reject) => {
    get(url, res => {
        if (res.statusCode !== 200) {
            res.resume();
            return reject(new Error('Request Failed\n' + 
                `| status code: ${res.statusCode}\n` + 
                `| headers: ${JSON.stringify(res.headers)}\n`))
        }

        res.setEncoding('utf8');
        let body = '';
        res.on('data', chunk => (body += chunk));
        res.on('end', () => resolve(body));
    }).on('error', reject)
});

const readIndexDoc = () => {
    const indexHtml = readFileSync(config.tmpIndexHtmlFile, { encoding: 'utf8' });
    return parseHtml(indexHtml)
}

const constFalse = () => false;
const selectNodes = (node, matches = constFalse) => {
    const nodes = matches(node) ? [node] : [];
    const select = node => 
        node && node.childNodes && 
        node.childNodes.forEach(node => { 
            if (matches(node)) nodes.push(node);
            else select(node);
        });

    select(node);
    return nodes;
};

const selectTables = node => selectNodes(node, node => node.tagName === 'table');
const selectText = node => selectNodes(node, node => node.nodeName === '#text');

const noop = () => {};
const eachRow = (table, fn = noop) => {
    const tbody = table.childNodes[2];
    return tbody.childNodes.forEach(fn);
};

const text = node => selectText(node).map(node => node.value.trim()).join('');

const getColData = (table, i) => {
    const data = [];

    eachRow(table, row => {
        text(row.childNodes[i])
            .split(',') // account for comma-separated lists
            .forEach(d => data.push(d));
    });

    return cleanUp(data); // FIXME: only drop strings from the dropList from the html table
}

const getGlobalAttrs = table => {
    const globals = [];

    eachRow(table, row => {
        const attr = text(row.childNodes[AT.ATTRIBUTE]),
            elems = text(row.childNodes[AT.ELEMENTS]);

        if (elems === 'HTML elements') globals.push(attr);
    });

    return globals;
};

const makeAttrSets = (globals, attrs) => 
    [[config.globalAttrsName, globals]].concat(attrs.map(attr => [attr, [attr]]));

const unlessFileExists = (file, fn = noop) => new Promise((resolve, reject) => {
    if (existsSync(file)) {
        console.log(`${file} exists, skipping...`);
        return resolve();
    }

    const r = fn();
    if (!r || !r.finally) return resolve();
    r.finally(resolve);
});

const semi = ';\n';
const insert = (table, columns, values) => 
    `INSERT INTO ${table} (${columns.join(', ')}) VALUES\n${values.join(',\n')}\n`;
const upsert = (table, columns, values) => insert(table, columns, values) + 'ON CONFLICT DO NOTHING';

const tuple1 = a => `    (${a})`;
const tuple2 = (a, b) => `    (${a}, ${b})`;
const append = (arr, v) => (arr.push(v), arr);
const quot = x => `'${x}'`;

const genElementsInsert = elements => {
    const vals = elements.reduce((vals, name) => append(vals, tuple1(quot(name))), []);
    return upsert(config.elementsTable, ['name'], vals) + semi;
};

const getCategoriesInsert = categories => {
    const vals = categories.reduce((vals, name) => append(vals, tuple1(quot(name))), []);
    return upsert(config.categoriesTable, ['name'], vals) + semi;
};

const genAttributesInsert = attributes => {
    const vals = attributes.reduce((vals, [name, attrs]) => 
        append(vals, tuple2(quot(name), quot(attrs.join(' ')))), []);
    return upsert(config.attributesTable, ['name', 'attributes'], vals) + semi;
};

const main = argv => {
    const { 
        tmpIndexHtmlFile,
        indexUrl,
        tmpDir, dataDir, 
        elementsSqlFile, categoriesSqlFile, attributesSqlFile 
    } = config;

    unlessFileExists(tmpIndexHtmlFile, inDir(tmpDir, () => {
        console.log(`creating ${tmpIndexHtmlFile}`)
        return getUrl(indexUrl).then(
            body => writeFileSync(config.tmpIndexHtmlFile, body), 
            console.error);
    })).then(() => {
        const doc = readIndexDoc();
        const [elementsTable, categoriesTable, attributesTable] = selectTables(doc);

        const elements = getColData(elementsTable, ET.ELEMENT);
        const categories = getColData(categoriesTable, CT.CATEGORY);
        const attributes = getColData(attributesTable, AT.ATTRIBUTE);
        const globalAttrs = getGlobalAttrs(attributesTable);

        unlessFileExists(elementsSqlFile, inDir(dataDir, () => {
            console.log(`creating ${elementsSqlFile}`)
            writeFileSync(elementsSqlFile, genElementsInsert(elements));
        }));

        unlessFileExists(categoriesSqlFile, inDir(dataDir, () => {
            console.log(`creating ${categoriesSqlFile}`)
            writeFileSync(categoriesSqlFile, getCategoriesInsert(categories.concat(elements)));
        }));

        unlessFileExists(attributesSqlFile, inDir(dataDir, () => {
            console.log(`creating ${attributesSqlFile}`)
            writeFileSync(attributesSqlFile, genAttributesInsert(makeAttrSets(globalAttrs, attributes)));
        }));
    });
}

main(yargs(hideBin(process.argv))
    .usage('Usage: $0 [options]')
    .version('1.0.0')
    .help('help')
    .argv);

module.exports = {
    getUrl,
    readIndexDoc,
    selectNodes,
    selectTables,
    selectText,
    eachRow,
    text,
    getColData,
    unlessFileExists,
    main
};
