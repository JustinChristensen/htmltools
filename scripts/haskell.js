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

const quotQ = s => `'${s}'`
const eqQ = (x, y) => `${x} == ${y}`;
const neQ = (x, y) => `${x} != ${y}`;
const selectQ = (cols = [], table, where) => 
    `SELECT ${cols.join(', ')} FROM ${table}` + (where ? ` WHERE ${where}` : '');
const semi = x => `${x};`

const openDb = file => open({
    filename: file,
    driver: sqlite3.Database
});

const selectElements = db => 
    db.all(selectQ(['*'], 'elements'));
const selectAttributes = db => 
    db.all(selectQ(['*'], 'attributes', neQ('name', quotQ(config.globalAttrsName))));
const selectCategory = (cat, db) => 
    db.all(selectQ(['element'], 'categories_elements', eqQ('category', quotQ(cat))));

const indent = '    ';

const genExports = exports => exports ? `(${exports.join(',\n')}) ` : '';
const genModule = (name = '', exports, decls = []) => 
    `module ${name} ${genExports(exports)}where\n\n${decls.join('\n')}`;

// short for "apply", like f x y z
// but since many syntactical constructs in Haskell fit that pattern
// this is more of a general purpose token concatenator
const ap = (...tokens) => `${tokens.flat().join(' ')}`;

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

const genSaDeriving = (trains = '', clas, type) => 
    `deriving instance ${trains}${clas} ${type}`;

const genBinding = (x, y) => `${x} = ${y}`

const genExtensions = (...exts) => `{-# LANGUAGE ${exts.flat().join(', ')} #-}\n`;

const tick = (s = '') => `${s}'`;
const str = (s = '') => `"${s}"`;
const paren = (s = '', p = true) => `${p ? '(' + s + ')' : s}`;
const forall = (...vars) => `forall ${ap(vars)}. `

const genError = s => `error ${str(s)}`;

const genImport = (modName, ...imports) => `import ${modName}` + 
    (imports.length ? ` (${imports.flat().join(', ')})` : '');

const defaultDeriving = ['Eq', 'Ord'];
const showRead = ['Show', 'Read'];

const newline = '';

const genElementsModule = (elements, voidEls) => {
    elements = elements.map(({ name }) => name).sort();
    voidEls = voidEls.map(({ element }) => element).sort();

    const genHtmlDerivings = (...classes) => classes.flat()
        .map(clas => genSaDeriving(
            genConstraints(`${clas} a`, forall('b') + genConstraints(`${clas} b`) + `${clas} (t b)`), 
            clas, 
            paren(htmlConstr)
        ));

    const htmlConstr = ap('Html', 't', 'a'),
        tagConstr = 'Tag', 
        elemConstr = 'Element';
    const attrList = ap('t', paren(ap('Attribute', 'a'))),
        elemList = ap('t', paren(htmlConstr));

    const extensions = genExtensions(
        'OverloadedStrings', 
        'StandaloneDeriving', 
        'FlexibleInstances',
        'QuantifiedConstraints');

    return extensions + genModule(config.elemsModName, null, [

        genImport(config.attrsModName, 'Attribute'),
        genImport('Data.String', 'IsString'),
        newline,

        genDataType(
            tagConstr,
            genConstrs(elements.map(name => pascalCase(name))),
            defaultDeriving.concat(showRead)
        ),
        newline,

        // data Html t a
        genDataType(
            htmlConstr, 
            genConstrs([
                ap(elemConstr, tagConstr, paren(attrList), paren(elemList)),
                ap('Doctype'),
                ap('Text', 'a'),
                ap('Comment', 'a')
            ])
        ),
        newline,

        // TODO: Could not deduce (Ord b) arising from the superclasses of an instance declaration
        //      which I think is https://gitlab.haskell.org/ghc/ghc/-/issues/15974
        // ...genHtmlDerivings('Eq', 'Ord', 'Show', 'Read'),
        ...genHtmlDerivings('Eq', 'Show', 'Read'),
        newline,

        // a, abbr, address, ... :: IsString a => t (Attribute a) -> t (Html t a) -> Html t a
        genType(undrKWs(elements), genConstraints('IsString a') + genFnType(attrList, elemList, htmlConstr)),
        ...elements.map(name => 
            genBinding(
                undr(camelCase(name)), 
                ap(elemConstr, pascalCase(name))
            )
        ),
        newline,

        // meta, link, ... :: (IsString a, forall b. Monoid (t b)) => t (Attribute a) -> Html t a
        genType(undrKWs(voidEls).map(tick), genConstraints('IsString a', forall('b') + 'Monoid (t b)') + genFnType(attrList, htmlConstr)),
        ...voidEls.map(name => 
            genBinding(
                ap(tick(undr(camelCase(name))), 'as'), 
                ap(elemConstr, pascalCase(name), 'as', 'mempty')
            )
        ),
        newline,


        // tagName :: IsString a => Tag -> a
        genType(['tagName'], genConstraints('IsString a') + genFnType(tagConstr, 'a')),
        ...elements.map(name => genBinding(
            ap('tagName', pascalCase(name)),
            str(name)
        )),
        newline,

        // voidElement :: Tag -> Bool
        genType(['voidElement'], genFnType(tagConstr, 'Bool')),
        ...elements.map(name => genBinding(
            ap('voidElement', pascalCase(name)),
            voidEls.includes(name) ? 'True' : 'False'
        )),
        newline
    ]);
};

const genAttributesModule = attributes => {
    attributes = attributes.map(({ name }) => name);

    const attrConstr = ap('Attribute', 'a');

    const extensions = genExtensions('OverloadedStrings');

    return extensions + genModule(config.attrsModName, null, [

        genImport('Data.String', 'IsString'),
        newline,

        genDataType(
            attrConstr, 
            genConstrs(attributes.map(name => ap(pascalCase(name), 'a')).sort()),
            defaultDeriving.concat(showRead)
        ),
        newline,

        genType(undrKWs(attributes.map(camelCase)), genFnType('a', attrConstr)),
        ...attributes.map(name => genBinding(undr(camelCase(name)), pascalCase(name))),
        newline,

        // attrName :: IsString a => Attribute a -> a
        genType(['attrName'], genConstraints('IsString a') + genFnType(attrConstr, 'a')),
        ...attributes.map(name => genBinding(
            ap('attrName', paren(ap(pascalCase(name), '_'))),
            str(name)
        )),
        newline,

        // attrVal :: IsString a => Attribute a -> a
        genType(['attrVal'], genConstraints('IsString a') + genFnType(attrConstr, 'a')),
        ...attributes.map(name => genBinding(
            ap('attrVal', paren(ap(pascalCase(name), 'v'))),
            'v'
        )),
        newline,
    ]);
};


module.exports = argv => openDb(argv.db).then(inDir(argv.outDir, async db => {
    const elementsModule = genElementsModule(
        await selectElements(db), 
        await selectCategory('void-elements', db)
    );
    const attributesModule = genAttributesModule(await selectAttributes(db));

    const header = `-- Generated. See ${argv['$0']}.\n`
    writeFileSync(resolve(argv.outDir, config.elemsHs), header + elementsModule);
    writeFileSync(resolve(argv.outDir, config.attrsHs), header + attributesModule);

    db.close();
})).catch(console.error);
