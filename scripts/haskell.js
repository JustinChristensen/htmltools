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
    'main',
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

const genDataType = (type, constrs, deriving = []) => `data ${type} = \n${constrs}`
    + (deriving.length ? `\n${indent}deriving (${deriving.join(', ')})` : '');

const genList = (...items) => `[${items.flat().join(', ')}]`

const genType = (vars = [], type, varsep = ' ') => `${vars.join(`,${varsep}`)} :: ${type}`

const genFnType = (...types) => types.flat().join(' -> ');
const genConstraints = (...trains) => {
    trains = trains.flat();
    return (trains.length === 1 ? trains[0] : `(${trains.join(', ')})`) + ' => ';
}

const genSaDeriving = (trains = '', clas, type, paren = false) => 
    `deriving instance ${trains}${clas} ${genParen(type, paren)}`;

const genBinding = (x, y) => `${x} = ${y}`

const genFunLHS = (name, ...pats) => `${name} ${pats.flat().join(' ')}`;

const genParPat = (constr, ...fields) => `(${constr} ${fields.flat().join(' ')})`;

const genExtensions = (...exts) => `{-# LANGUAGE ${exts.flat().join(', ')} #-}\n`;

const genStr = (s = '') => `"${s}"`;
const genParen = (s = '', p = true) => `${p ? '(' + s + ')' : s}`;

const genError = s => `error ${genStr(s)}`;

const genImport = (modName, ...imports) => `import ${modName}` + 
    (imports.length ? ` (${imports.flat().join(', ')})` : '');

const defaultDeriving = ['Eq', 'Ord'];

const newline = '';

const genElementsModule = elements => {
    elements = elements.map(({ name }) => name).sort();

    const elemConstr = genConstr('Element', 't', 'a');
    const attrList = genConstr('t', genParen(genConstr('Attribute', 'a'))),
        elemList = genConstr('t', genParen(elemConstr));

    const extensions = genExtensions(
        'OverloadedStrings', 
        'StandaloneDeriving', 
        'FlexibleInstances');

    return extensions + genModule(config.elemsModName, null, [

        genImport(config.attrsModName, 'Attribute'),
        genImport('Data.String', 'IsString'),
        newline,

        // data Element a
        genDataType(
            elemConstr, 
            genConstrs(
                elements.map(name => 
                    genConstr(pascalCase(name), genParen(attrList), genParen(elemList)))
                    .concat(genConstr('Text', 'a'))
            )
        ),
        newline,

        genSaDeriving(genConstraints('Show a'), 'Show', genConstr('Element', '[]', 'a'), true),
        newline,

        // a, abbr, address, ... :: t (Attribute a) -> t (Element t a) -> Element t a
        genType(undrKWs(elements), genFnType(attrList, elemList, elemConstr)),
        ...elements.map(name => genBinding(undr(camelCase(name)), pascalCase(name))),
        newline,

        // text :: a -> Element a
        genType(['text'], genFnType('a', elemConstr)),
        genBinding('text', 'Text'),
        newline,

        // elemName :: IsString a => Element t a -> a
        genType(['elemName'], genConstraints('IsString a') + genFnType(elemConstr, 'a')),
        ...elements.map(name => genBinding(
            genFunLHS('elemName', genParPat(pascalCase(name), '_', '_')),
            genStr(name)
        )),
        genBinding(genFunLHS('elemName', genParPat('Text', '_')), genStr()),
        newline,

        // attrs :: IsString a => Element t a -> t (Attribute a)
        genType(['attrs'], genConstraints('IsString a') + genFnType(elemConstr, attrList)),
        ...elements.map(name => genBinding(
            genFunLHS('attrs', genParPat(pascalCase(name), 'as', '_')),
            'as'
        )),
        genBinding(genFunLHS('attrs', genParPat('Text', '_')), genError('text nodes cannot have attributes')),
        newline,

        // elems :: IsString a => Element t a -> t (Element t a)
        genType(['elems'], genConstraints('IsString a') + genFnType(elemConstr, elemList)),
        ...elements.map(name => genBinding(
            genFunLHS('elems', genParPat(pascalCase(name), '_', 'es')),
            'es'
        )),
        genBinding(genFunLHS('elems', genParPat('Text', '_')), genError('text nodes cannot have child elements')),
        newline
    ]);
};

const genAttributesModule = attributes => {
    attributes = attributes.map(({ name }) => name);

    const attrConstr = genConstr('Attribute', 'a');

    const extensions = genExtensions('OverloadedStrings');

    return extensions + genModule(config.attrsModName, null, [

        genImport('Data.String', 'IsString'),
        newline,

        genDataType(
            attrConstr, 
            genConstrs(attributes.map(name => genConstr(pascalCase(name), 'a')).sort()),
            defaultDeriving.concat('Show')
        ),
        newline,

        genType(undrKWs(attributes.map(camelCase)), genFnType('a', attrConstr)),
        ...attributes.map(name => genBinding(undr(camelCase(name)), pascalCase(name))),
        newline,

        // attrName :: IsString a => Attribute a -> a
        genType(['attrName'], genConstraints('IsString a') + genFnType(attrConstr, 'a')),
        ...attributes.map(name => genBinding(
            genFunLHS('attrName', genParPat(pascalCase(name), '_')),
            genStr(name)
        )),
        newline,

        // attrVal :: IsString a => Attribute a -> a
        genType(['attrVal'], genConstraints('IsString a') + genFnType(attrConstr, 'a')),
        ...attributes.map(name => genBinding(
            genFunLHS('attrVal', genParPat(pascalCase(name), 'v')),
            'v'
        )),
        newline,
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
