const sqlite3 = require('sqlite3');
const { open } = require('sqlite');
const { resolve } = require('path');
const { writeFileSync } = require('fs');
const { config, capLookup, capRE, inDir } = require('./config');
    
const keywords = new Set([
    'data', 
    'class', 
    'default',
    'type',
    'pattern'
]);

const undr = s => keywords.has(s) ? `${s}_` : s;
const undrKWs = arr => arr.map(undr);

const toUpper = s => s.toUpperCase();
const toLower = s => s.toLowerCase();
const capitalize = str => str.replaceAll(capRE, s => capLookup[s] ? capLookup[s] : s);
const dedash = str => str.replaceAll(/-[a-zA-Z]/g, s => toUpper(s[1]));
const caseize = (to, str) => to(str.charAt(0)) + str.slice(1);
const camelCase = str => caseize(toLower, capitalize(dedash(str)));
const pascalCase = str =>  caseize(toUpper, capitalize(dedash(str)));

const neQ = (x, y) => `${x} != ${y}`;
const selectQ = (cols = [], table, where) => 
    `SELECT ${cols.join(', ')} FROM ${table}` + (where ? ` WHERE ${where}` : '');
const semi = x => `${x};`

const openDb = file => open({
    filename: file,
    driver: sqlite3.Database
});

const selectElements = db => db.all(selectQ(['*'], 'elements'));
const selectAttributes = db => db.all(selectQ(['*'], 'attributes', neQ('name', `'${config.globalAttrsName}'`)));

const indent = '    ';

const genExports = exports => exports ? `(${exports.join(',\n')}) ` : '';
const genModule = (name = '', exports, decls = []) => 
    `module ${name} ${genExports(exports)}where\n\n${decls.join('\n')}`;

const genConstr = (constr = '', ...vars) => 
    `${constr}` + (vars.length ? ` ${vars.flat().join(' ')}` : '');

const genConstrs = constrs => `${indent}  ${constrs.join(`\n${indent}| `)}`

const genDataType = (type, constrs, deriving = []) => `data ${type} = \n${constrs}\n`
    + (deriving.length ? `${indent}deriving (${deriving.join(', ')})\n` : '');

const genList = (...items) => `[${items.flat().join(', ')}]`

const genType = (vars = [], type, varsep = ' ') => `${vars.join(`,${varsep}`)} :: ${type}`

const genFn = (...types) => types.flat().join(' -> ');

const genBinding = (x, y) => `${x} = ${y}`

const genImport = (modName, ...imports) => `import ${modName}` + 
    (imports.length ? ` (${imports.flat().join(', ')})` : '');

const genElementsModule = elements => {
    elements = elements.map(({ name }) => name);

    const elemConstr = genConstr('Element', 'a');
    const attrList = genList(genConstr('Attribute', 'a')),
        elemList = genList(genConstr('Element', 'a'));

    return genModule(config.elemsModName, null, [

        genImport(config.attrsModName, 'Attribute'),

        '',

        genDataType(
            elemConstr, 
            genConstrs(elements.map(name => 
                genConstr(pascalCase(name), attrList, elemList))),
            ['Show']
        ),

        genType(undrKWs(elements), genFn(attrList, elemList, elemConstr)),
        ...elements.map(name => genBinding(undr(camelCase(name)), pascalCase(name)))
    ]);
};

const genAttributesModule = attributes => {
    attributes = attributes.map(({ name }) => name);

    const attrConstr = genConstr('Attribute', 'a');

    return genModule(config.attrsModName, null, [

        genDataType(
            attrConstr, 
            genConstrs(attributes.map(name => genConstr(pascalCase(name), 'a'))),
            ['Show']
        ),

        genType(undrKWs(attributes.map(camelCase)), genFn('a', attrConstr)),
        ...attributes.map(name => genBinding(undr(camelCase(name)), pascalCase(name)))
    ]);
};


module.exports = argv => openDb(argv.db).then(inDir(argv.outDir, async db => {
    const elementsModule = genElementsModule(await selectElements(db));
    const attributesModule = genAttributesModule(await selectAttributes(db));

    const header = `-- Generated. See ${argv['$0']}.\n`
    writeFileSync(resolve(argv.outDir, config.elemsHs), header + elementsModule);
    writeFileSync(resolve(argv.outDir, config.attrsHs), header + attributesModule);

    db.close();
})).catch(console.error);
