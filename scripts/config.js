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

const wordsToCap = new Set([
    'Charset',
    'Key',
    'Full',
    'Screen',
    'Capitalize',
    'Complete',
    'Form',
    'Focus',
    'Play',
    'Editable',
    'Origin',
    'Time',
    'Hint',
    'Action',
    'Enctype',
    'Method',
    'NoValidate',
    'Target',
    'Lang',
    'Sizes',
    'SrcSet',
    'Mode',
    'Map',
    'ItemId',
    'Prop',
    'Href',
    'Ref',
    'Scope',
    'Type',
    'Length',
    'Module',
    'After',
    'Print',
    'Aux',
    'Click',
    'Before',
    'Print',
    'Unload',
    'Blur',
    'Cancel',
    'OnCan',
    'Through',
    'Change',
    'Close',
    'Context',
    'Menu',
    'Copy',
    'OnCue',
    'OnCut',
    'Dbl',
    'DragEnd',
    'Drag',
    'Enter',
    'Leave',
    'Over',
    'Start',
    'Drop',
    'Duration',
    'Emptied',
    'Ended',
    'Error',
    'Data',
    'Hash',
    'Input',
    'Invalid',
    'Down',
    'Press',
    'KeyUp',
    'Preload',
    'Load',
    'MetaData',
    'Message',
    'MouseUp',
    'Mouse',
    'Move',
    'Out',
    'Offline',
    'Online',
    'Page',
    'Hide',
    'Show',
    'Paste',
    'Pause',
    'Pop',
    'State',
    'Progress',
    'Rate',
    'Rejection',
    'Unhandled',
    'Handle',
    'Reset',
    'Resize',
    'Scroll',
    'Security',
    'Policy',
    'Violation',
    'Seek',
    'Select',
    'Slot',
    'Stall',
    'Storage',
    'Submit',
    'Suspend',
    'Update',
    'Toggle',
    'Volume',
    'Waiting',
    'Wheel',
    'Inline',
    'Check',
    'Index',
    'Abort',
]);

const capRE = new RegExp(Array.from(wordsToCap).map(w => w.toLowerCase()).join('|'), 'g');

const capLookup = {};
wordsToCap.forEach(w => {
    capLookup[w.toLowerCase()] = w;
});

module.exports = {
    config,
    wordsToCap,
    capLookup,
    capRE,
    inDir
};