const { get } = require('https');
const { existsSync, readFileSync, writeFileSync, mkdirSync } = require('fs');
const { basename } = require('path');
const { parse: parseHtml } = require('parse5');

const indexUrl = 'https://html.spec.whatwg.org/multipage/indices.html';

const tmpDir = 'tmp';
const tmpIndexHtmlFile = `${tmpDir}/${basename(indexUrl)}`;

const dataDir = 'data';
const elementsDataFile = `${dataDir}/elements.txt`;
const attributesDataFile = `${dataDir}/attributes.txt`;

const dropRE = new RegExp([
    'MathML',
    'SVG',
    'autonomous custom elements'
].join('|'));

const mkdirp = path => mkdirSync(path, { recursive: true });

const uniq = arr => arr.filter((v, i) => arr.indexOf(v) === i);
const dropStrings = arr => arr.map(v => v.replace(dropRE, '').trim());

const cleanUp = arr => {
    arr = uniq(arr);
    arr = dropStrings(arr);
    arr = arr.filter(v => v !== '');
    return arr;
};

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

const saveIndexHtmlFile = body => writeFileSync(tmpIndexHtmlFile, body);

const readIndexDoc = () => {
    const indexHtml = readFileSync(tmpIndexHtmlFile, { encoding: 'utf8' });
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

const colText = (table, i) => {
    const textNodes = [];

    eachRow(table, row => {
        const colTextNodes = selectText(row.childNodes[i]);
        text(colTextNodes).join('').split(',').forEach(n => textNodes.push(n.trim()));
    });

    return textNodes;
}

const saveElementsDataFile = elementsTable => {
    const ELEMENT = 0;
    writeFileSync(elementsDataFile, cleanUp(colText(elementsTable, ELEMENT)).join('\n'));
};

const saveAttributesDataFile = attributesTable => {
    const ATTRIBUTE = 0;
    writeFileSync(attributesDataFile, cleanUp(colText(attributesTable, ATTRIBUTE)).join('\n'));
};

const unlessFileExists = (file, fn = noop) => new Promise((resolve, reject) => {
    if (existsSync(file)) {
        console.log(`${file} exists, skipping...`);
        return resolve();
    }

    const r = fn();
    if (!r || !r.finally) return resolve();
    r.finally(resolve);
});

const doIndex = () => 
    unlessFileExists(tmpIndexHtmlFile, () => {
        console.log(`creating ${tmpIndexHtmlFile}`)
        mkdirp(tmpDir);
        return getUrl(indexUrl).then(saveIndexHtmlFile, console.error)
            .then(() => console.log(`saved ${tmpIndexHtmlFile}`));
    }).then(() => {
        const doc = readIndexDoc();
        const [elementsTable, _, attributesTable] = selectTables(doc);

        unlessFileExists(elementsDataFile, () => {
            console.log(`creating ${elementsDataFile}`)
            mkdirp(dataDir); saveElementsDataFile(elementsTable);
        });

        unlessFileExists(attributesDataFile, () => {
            console.log(`creating ${attributesDataFile}`)
            mkdirp(dataDir); saveAttributesDataFile(attributesTable);
        });
    });

doIndex();

module.exports = {
    getUrl,
    saveIndexHtmlFile,
    readIndexDoc,
    selectNodes,
    selectTables,
    selectText,
    eachRow,
    text,
    colText,
    saveElementsDataFile,
    saveAttributesDataFile,
    unlessFileExists,
    doIndex
};
