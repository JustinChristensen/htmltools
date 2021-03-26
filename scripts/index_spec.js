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
    ]
};    

config.tmpIndexHtmlFile = `${config.tmpDir}/${basename(config.indexUrl)}`;
config.elementsDataFile = `${config.dataDir}/elements.txt`;
config.attributesDataFile = `${config.dataDir}/attributes.txt`;

config.elementsSqlFile = `${config.dataDir}/elements.sql`;
config.attributesSqlFile = `${config.dataDir}/attributes.sql`;

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

const text = textNodes => textNodes.map(node => node.value);

const getColData = (table, i) => {
    const data = [];

    eachRow(table, row => {
        const colTextNodes = selectText(row.childNodes[i]);
        text(colTextNodes).join('').split(',').forEach(n => data.push(n.trim()));
    });

    return cleanUp(data); // FIXME: only drop strings from the dropList from the html table
}

const unlessFileExists = (file, fn = noop) => new Promise((resolve, reject) => {
    if (existsSync(file)) {
        console.log(`${file} exists, skipping...`);
        return resolve();
    }

    const r = fn();
    if (!r || !r.finally) return resolve();
    r.finally(resolve);
});

const upsertClause = 'ON CONFLICT DO NOTHING';

const genElementsInsert = elementsData => {
    const vals = elementsData.reduce((vals, elem) => (vals.push(`  ('${elem}')`), vals), []);
    return `INSERT INTO elements (name) VALUES\n${vals.join(',\n')}\n${upsertClause};\n`;
};

const genAttributesInsert = attributesData => {
    const vals = attributesData.reduce((vals, attr) => (vals.push(`  ('${attr}')`), vals), []);
    return `INSERT INTO attributes (name) VALUES\n${vals.join(',\n')}\n${upsertClause};\n`;
};

// elements table columns
const ET_COLS = {
    ELEMENT: 0
};

// attributes table columns
const AT_COLS = {
    ATTRIBUTE: 0
};

const main = argv => {
    const { 
        tmpIndexHtmlFile,
        indexUrl,
        tmpDir, dataDir, 
        elementsDataFile, attributesDataFile, 
        elementsSqlFile, attributesSqlFile 
    } = config;

    unlessFileExists(tmpIndexHtmlFile, inDir(tmpDir, () => {
        console.log(`creating ${tmpIndexHtmlFile}`)
        return getUrl(indexUrl).then(
            body => writeFileSync(config.tmpIndexHtmlFile, body), 
            console.error);
    })).then(() => {
        const doc = readIndexDoc();
        const [elementsTable, _, attributesTable] = selectTables(doc);

        const elementsData = getColData(elementsTable, ET_COLS.ELEMENT);
        const attributesData = getColData(attributesTable, AT_COLS.ATTRIBUTE);

        if (argv.output === 'text') {
            unlessFileExists(elementsDataFile, inDir(dataDir, () => {
                console.log(`creating ${elementsDataFile}`)
                writeFileSync(elementsDataFile, elementsData.join('\n') + '\n');
            }));

            unlessFileExists(attributesDataFile, inDir(dataDir, () => {
                console.log(`creating ${attributesDataFile}`)
                writeFileSync(attributesDataFile, attributesData.join('\n') + '\n');
            }));
        } else {
            unlessFileExists(elementsSqlFile, inDir(dataDir, () => {
                console.log(`creating ${elementsSqlFile}`)
                writeFileSync(elementsSqlFile, genElementsInsert(elementsData));
            }));

            unlessFileExists(attributesSqlFile, inDir(dataDir, () => {
                console.log(`creating ${attributesSqlFile}`)
                writeFileSync(attributesSqlFile, genAttributesInsert(attributesData));
            }));
        }
    });
}

main(yargs(hideBin(process.argv))
    .usage('Usage: $0 [options]')
    .option('output', {
        describe: 'Output format',
        default: 'sql',
        choices: ['sql', 'text']
    })
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
