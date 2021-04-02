const { basename } = require('path');
const { mkdirSync } = require('fs');

const config = {
    indexUrl: 'https://html.spec.whatwg.org/multipage/indices.html',
    migrationsDir: 'migrations',
    tmpDir: 'tmp',
    dropList: [
        'MathML',
        'SVG',
        'autonomous custom elements',
        'Text',
        'form-associated custom elements'
    ],

    // db tables 
    elementsTable: 'elements',
    attributesTable: 'attributes',
    categoriesTable: 'categories',
    categoriesElementsTable: 'categories_elements',

    globalAttrsName: 'global-attributes',

    // haskell file names and module strings
    elemsHs: 'Elements.hs',
    attrsHs: 'Attributes.hs',
    htmlModName: 'Html',
};    

config.dataDir = `${config.migrationsDir}/data`;
config.tmpIndexHtmlFile = `${config.tmpDir}/${basename(config.indexUrl)}`;

config.elementsSqlFile = `${config.dataDir}/elements.sql`;
config.categoriesSqlFile = `${config.dataDir}/categories.sql`;
config.attributesSqlFile = `${config.dataDir}/attributes.sql`;
config.categoriesElementsSqlFile = `${config.dataDir}/categories_elements.sql`;

config.elemsModName = `${config.htmlModName}.Elements`;
config.attrsModName = `${config.htmlModName}.Attributes`;

const inDir = (path, fn) => x => (mkdirSync(path, { recursive: true }), fn(x));

module.exports = {
    config,
    inDir
};