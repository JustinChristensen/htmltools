#!/usr/bin/env node

const yargs = require('yargs')
const { hideBin } = require('yargs/helpers')
const { get } = require('https');
const { existsSync, readFileSync, writeFileSync, mkdirSync } = require('fs');
const { parse: parseHtml } = require('parse5');
const genHaskell = require('./haskell');
const { config } = require('./config');

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
    CATEGORY: 0,
    ELEMENTS: 1
};

const fatal = msg => (console.error(msg), process.exit(1));

const dropRE = new RegExp(config.dropList.join('|'));
const dropStrings = arr => arr.map(v => v.replace(dropRE, '').trim()).filter(v => v !== '');

const noop = () => {};
const uniq = arr => Array.from(new Set(arr));
const toKebabCase = s => s.toLowerCase().split(' ').join('-');

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

const eachRow = (table, fn = noop) => {
    const tbody = table.childNodes[2];
    return tbody.childNodes.forEach(fn);
};

const text = node => selectText(node).map(node => node.value.trim()).join('');

const getColData = (table, i, sep = null) => {
    const data = [];

    eachRow(table, row => {
        text(row.childNodes[i])
            .split(sep) 
            .forEach(d => data.push(d));
    });

    return uniq(data); 
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

const getCategories = table => {
    const categories = [];

    eachRow(table, row => {
        const category = text(row.childNodes[CT.CATEGORY]),
            elems = dropStrings(text(row.childNodes[CT.ELEMENTS]).split(';'));
        categories.push([toKebabCase(category), elems]);
    });

    return categories.sort(([c1], [c2]) => c1.localeCompare(c2));
};

const makeCategorySets = (categories, elements) => 
    categories.concat(elements.map(elem => [elem, [elem]]));

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

const generated = '/* Generated. See gentool.js. */'
const foreignKeysOn = 'PRAGMA foreign_keys = ON;';
const sqlFileHeader = `${generated}\n${foreignKeysOn}\n`;
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

const getCategoriesElementsInsert = categories => {
    const vals = categories
        .reduce((vals, [cat, elems]) => {
            elems.forEach(elem => append(vals, tuple2(quot(cat), quot(elem))));
            return vals;
        }, []);
    return upsert(config.categoriesElementsTable, ['category', 'element'], vals) + semi;
};

const genAttributesInsert = attributes => {
    const vals = attributes.reduce((vals, [name, attrs]) => 
        append(vals, tuple2(quot(name), quot(attrs.join(' ')))), []);
    return upsert(config.attributesTable, ['name', 'attributes'], vals) + semi;
};

const writeMigration = (file, data) => {
    console.log(`creating ${file}`)
    return writeFileSync(file, data);
};

const main = argv => {
    const { 
        tmpIndexHtmlFile,
        indexUrl,
        tmpDir, dataDir, 
        elementsSqlFile, categoriesSqlFile, attributesSqlFile,
        categoriesElementsSqlFile
    } = config;

    unlessFileExists(tmpIndexHtmlFile, inDir(tmpDir, () => {
        console.log(`creating ${tmpIndexHtmlFile}`)
        return getUrl(indexUrl).then(
            body => writeFileSync(config.tmpIndexHtmlFile, body), 
            fatal);
    })).then(() => {
        const doc = readIndexDoc();
        const [elementsTable, categoriesTable, attributesTable, eventHandlersTable] = selectTables(doc);

        if (!elementsTable) fatal(`error: ${tmpIndexHtmlFile} missing tables`);

        const elements = dropStrings(getColData(elementsTable, ET.ELEMENT, ','));
        const categories = getCategories(categoriesTable);

        unlessFileExists(elementsSqlFile, inDir(dataDir, () => {
            writeMigration(elementsSqlFile, 
                sqlFileHeader +
                genElementsInsert(elements));
        }));

        unlessFileExists(categoriesSqlFile, inDir(dataDir, () => {
            writeMigration(categoriesSqlFile, 
                sqlFileHeader +
                getCategoriesInsert(categories.map(c => c[0]).concat(elements)));
        }));

        unlessFileExists(categoriesElementsSqlFile, inDir(dataDir, () => {
            writeMigration(categoriesElementsSqlFile, 
                sqlFileHeader + 
                getCategoriesElementsInsert(makeCategorySets(categories, elements)));
        }));

        unlessFileExists(attributesSqlFile, inDir(dataDir, () => {
            const attributes = getColData(attributesTable, AT.ATTRIBUTE);
            const globalAttrs = getGlobalAttrs(attributesTable);
            const eventHandlers = getColData(eventHandlersTable, AT.ATTRIBUTE);
            const globalHandlers = getGlobalAttrs(eventHandlersTable);

            writeMigration(attributesSqlFile, 
                sqlFileHeader + 
                genAttributesInsert(makeAttrSets(
                    globalAttrs.concat(globalHandlers), 
                    attributes.concat(eventHandlers))));
        }));
    });
}

yargs(hideBin(process.argv))
    .usage('Usage: $0 <command> [options]')
    .command('$0', 'Generate the sql data files', noop, main)
    .command('haskell', 'Generate the Haskell library modules', {
        db: {
            default: './html.db',
            desc: 'Sqlite database file'
        },
        'out-dir': {
            alias: 'O',
            default: '../lib/Html'
        }
    }, genHaskell)
    .version('1.0.0')
    .help('help')
    .argv;

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
