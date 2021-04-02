PRAGMA foreign_keys = ON;
INSERT INTO elements_attributes (element, attribute, "constraint") VALUES
    ('a', 'global-attributes', NULL),
    ('a', 'href', NULL),
    ('a', 'target', NULL),
    ('a', 'download', NULL),
    ('a', 'ping', NULL),
    ('a', 'rel', NULL),
    ('a', 'hreflang', NULL),
    ('a', 'type', NULL),
    ('a', 'referrerpolicy', NULL),

    ('abbr', 'global-attributes', NULL),

    ('address', 'global-attributes', NULL),

    ('area', 'global-attributes', NULL),
    ('area', 'alt', NULL),
    ('area', 'coords', NULL),
    ('area', 'shape', NULL),
    ('area', 'href', NULL),
    ('area', 'target', NULL),
    ('area', 'download', NULL),
    ('area', 'ping', NULL),
    ('area', 'rel', NULL),
    ('area', 'referrerpolicy', NULL),

    ('article', 'global-attributes', NULL),

    ('aside', 'global-attributes', NULL),

    ('audio', 'global-attributes', NULL),
    ('audio', 'src', NULL),
    ('audio', 'crossorigin', NULL),
    ('audio', 'preload', NULL),
    ('audio', 'autoplay', NULL),
    ('audio', 'loop', NULL),
    ('audio', 'muted', NULL),
    ('audio', 'controls', NULL),

    ('b', 'global-attributes', NULL),

    ('base', 'global-attributes', NULL),
    ('base', 'href', NULL),
    ('base', 'target', NULL),

    ('bdi', 'global-attributes', NULL),

    ('bdo', 'global-attributes', NULL),

    ('blockquote', 'global-attributes', NULL),
    ('blockquote', 'cite', NULL),

    /* TODO: event listeners */
    ('body', 'global-attributes', NULL),
    ('body', 'onafterprint', NULL),
    ('body', 'onbeforeprint', NULL),
    ('body', 'onbeforeunload', NULL),
    ('body', 'onhashchange', NULL),
    ('body', 'onlanguagechange', NULL),
    ('body', 'onmessage', NULL),
    ('body', 'onmessageerror', NULL),
    ('body', 'onoffline', NULL),
    ('body', 'ononline', NULL),
    ('body', 'onpagehide', NULL),
    ('body', 'onpageshow', NULL),
    ('body', 'onpopstate', NULL),
    ('body', 'onrejectionhandled', NULL),
    ('body', 'onstorage', NULL),
    ('body', 'onunhandledrejection', NULL),
    ('body', 'onunload', NULL),

    ('br', 'global-attributes', NULL),

    ('button', 'global-attributes', NULL),
    ('button', 'disabled', NULL),
    ('button', 'form', NULL),
    ('button', 'formaction', NULL),
    ('button', 'formenctype', NULL),
    ('button', 'formmethod', NULL),
    ('button', 'formnovalidate', NULL),
    ('button', 'formtarget', NULL),
    ('button', 'name', NULL),
    ('button', 'type', NULL),
    ('button', 'value', NULL),

    ('canvas', 'global-attributes', NULL),
    ('canvas', 'width', NULL),
    ('canvas', 'height', NULL),

    ('caption', 'global-attributes', NULL),

    ('cite', 'global-attributes', NULL),

    ('code', 'global-attributes', NULL),

    ('col', 'global-attributes', NULL),
    ('col', 'span', NULL),

    ('colgroup', 'global-attributes', NULL),
    ('colgroup', 'span', NULL),

    ('data', 'global-attributes', NULL),
    ('data', 'value', NULL),

    ('datalist', 'global-attributes', NULL),

    ('dd', 'global-attributes', NULL),

    ('del', 'global-attributes', NULL),
    ('del', 'cite', NULL),
    ('del', 'datetime', NULL),

    ('details', 'global-attributes', NULL),
    ('details', 'open', NULL),

    ('dfn', 'global-attributes', NULL),
   
    ('dialog', 'global-attributes', NULL),
    ('dialog', 'open', NULL),
    
    ('div', 'global-attributes', NULL),

    ('dl', 'global-attributes', NULL),

    ('dt', 'global-attributes', NULL),

    ('em', 'global-attributes', NULL),

    /* TODO: namespace-less attributes for pass-through */
    ('embed', 'global-attributes', NULL),
    ('embed', 'src', NULL),    
    ('embed', 'type', NULL),
    ('embed', 'width', NULL),
    ('embed', 'height', NULL),
    ('embed', 'itemprop', 'has-src-attribute'),

    ('fieldset', 'global-attributes', NULL),
    ('fieldset', 'disabled', NULL),
    ('fieldset', 'form', NULL),
    ('fieldset', 'name', NULL),

    ('figcaption', 'global-attributes', NULL),

    ('figure', 'global-attributes', NULL),

    ('footer', 'global-attributes', NULL),

    ('form', 'global-attributes', NULL),
    ('form', 'accept-charset', NULL),
    ('form', 'action', NULL),
    ('form', 'autocomplete', NULL),
    ('form', 'enctype', NULL),
    ('form', 'method', NULL),
    ('form', 'name', NULL),
    ('form', 'novalidate', NULL),
    ('form', 'target', NULL),
    ('form', 'rel', NULL),

    ('h1', 'global-attributes', NULL),
    ('h2', 'global-attributes', NULL),
    ('h3', 'global-attributes', NULL),
    ('h4', 'global-attributes', NULL),
    ('h5', 'global-attributes', NULL),
    ('h6', 'global-attributes', NULL),

    ('head', 'global-attributes', NULL),

    ('header', 'global-attributes', NULL),

    ('hgroup', 'global-attributes', NULL),

    ('hr', 'global-attributes', NULL),

    /* TODO: obsolete attributes https://html.spec.whatwg.org/multipage/obsolete.html#attr-html-manifest */
    ('html', 'global-attributes', NULL),

    ('i', 'global-attributes', NULL),

    ('iframe', 'global-attributes', NULL),
    ('iframe', 'src', NULL),
    ('iframe', 'srcdoc', NULL),
    ('iframe', 'name', NULL),
    ('iframe', 'sandbox', NULL),
    ('iframe', 'allow', NULL),
    ('iframe', 'allowfullscreen', NULL),
    ('iframe', 'width', NULL),
    ('iframe', 'height', NULL),
    ('iframe', 'referrerpolicy', NULL),
    ('iframe', 'loading', NULL),
    ('iframe', 'itemprop', 'has-src-attribute'),

    ('img', 'global-attributes', NULL),
    ('img', 'alt', NULL),
    ('img', 'src', NULL),
    ('img', 'srcset', NULL),
    ('img', 'sizes', NULL),
    ('img', 'crossorigin', NULL),
    ('img', 'usemap', NULL),
    ('img', 'ismap', NULL),
    ('img', 'width', NULL),
    ('img', 'height', NULL),
    ('img', 'referrerpolicy', NULL),
    ('img', 'decoding', NULL),
    ('img', 'loading', NULL),

    ('input', 'global-attributes', NULL),
    ('input', 'accept', NULL),
    ('input', 'alt', NULL),
    ('input', 'autocomplete', NULL),
    ('input', 'checked', NULL),
    ('input', 'dirname', NULL),
    ('input', 'disabled', NULL),
    ('input', 'form', NULL),
    ('input', 'formaction', NULL),
    ('input', 'formenctype', NULL),
    ('input', 'formmethod', NULL),
    ('input', 'formnovalidate', NULL),
    ('input', 'formtarget', NULL),
    ('input', 'height', NULL),
    ('input', 'list', NULL),
    ('input', 'max', NULL),
    ('input', 'maxlength', NULL),
    ('input', 'min', NULL),
    ('input', 'minlength', NULL),
    ('input', 'multiple', NULL),
    ('input', 'name', NULL),
    ('input', 'pattern', NULL),
    ('input', 'placeholder', NULL),
    ('input', 'readonly', NULL),
    ('input', 'required', NULL),
    ('input', 'size', NULL),
    ('input', 'src', NULL),
    ('input', 'step', NULL),
    ('input', 'type', NULL),        /* TODO: enumerated attributes */
    ('input', 'value', NULL),
    ('input', 'width', NULL),

    ('ins', 'global-attributes', NULL),
    ('ins', 'cite', NULL),
    ('ins', 'datetime', NULL),

    ('kbd', 'global-attributes', NULL),

    ('label', 'global-attributes', NULL),
    ('label', 'for', NULL),

    ('legend', 'global-attributes', NULL),

    ('li', 'global-attributes', NULL),
    ('li', 'value', 'child-of-ol'),

    ('link', 'global-attributes', NULL),
    ('link', 'href', NULL),
    ('link', 'crossorigin', NULL),
    ('link', 'rel', NULL),
    ('link', 'media', NULL),
    ('link', 'integrity', NULL),
    ('link', 'hreflang', NULL),
    ('link', 'type', NULL),
    ('link', 'referrerpolicy', NULL),
    ('link', 'sizes', NULL),
    ('link', 'imagesrcset', NULL),
    ('link', 'imagesizes', NULL),
    ('link', 'as', NULL),
    ('link', 'color', NULL),
    ('link', 'disabled', NULL),

    ('main', 'global-attributes', NULL),

    ('map', 'global-attributes', NULL),
    ('map', 'name', NULL),

    ('mark', 'global-attributes', NULL),

    ('math', 'global-attributes', NULL),    /* TODO: math elements */

    ('menu', 'global-attributes', NULL),

    ('meta', 'global-attributes', NULL),
    ('meta', 'name', NULL),
    ('meta', 'http-equiv', NULL),
    ('meta', 'content', NULL),
    ('meta', 'charset', NULL),

    ('meter', 'global-attributes', NULL),
    ('meter', 'value', NULL),
    ('meter', 'min', NULL),
    ('meter', 'max', NULL),
    ('meter', 'low', NULL),
    ('meter', 'high', NULL),
    ('meter', 'optimum', NULL),

    ('nav', 'global-attributes', NULL),

    ('noscript', 'global-attributes', NULL),

    ('object', 'global-attributes', NULL),
    ('object', 'data', NULL),
    ('object', 'type', NULL),
    ('object', 'name', NULL),
    ('object', 'form', NULL),
    ('object', 'width', NULL),
    ('object', 'height', NULL),

    ('ol', 'global-attributes', NULL),
    ('ol', 'reversed', NULL),
    ('ol', 'start', NULL),
    ('ol', 'type', NULL),

    ('optgroup', 'global-attributes', NULL),
    ('optgroup', 'disabled', NULL),
    ('optgroup', 'label', NULL),

    ('option', 'global-attributes', NULL),
    ('option', 'disabled', NULL),
    ('option', 'label', NULL),
    ('option', 'selected', NULL),
    ('option', 'value', NULL),

    ('output', 'global-attributes', NULL),
    ('output', 'for', NULL),
    ('output', 'form', NULL),
    ('output', 'name', NULL),

    ('p', 'global-attributes', NULL),

    ('param', 'global-attributes', NULL),
    ('param', 'name', NULL),
    ('param', 'value', NULL),

    ('picture', 'global-attributes', NULL),

    ('pre', 'global-attributes', NULL),

    ('progress', 'global-attributes', NULL),
    ('progress', 'value', NULL),
    ('progress', 'max', NULL),

    ('q', 'global-attributes', NULL),
    ('q', 'cite', NULL),

    ('rp', 'global-attributes', NULL),

    ('rt', 'global-attributes', NULL),

    ('ruby', 'global-attributes', NULL),

    ('s', 'global-attributes', NULL),

    ('samp', 'global-attributes', NULL),

    ('script', 'global-attributes', NULL),
    ('script', 'src', NULL),
    ('script', 'type', NULL),
    ('script', 'nomodule', NULL),
    ('script', 'async', NULL),
    ('script', 'defer', NULL),
    ('script', 'crossorigin', NULL),
    ('script', 'integrity', NULL),
    ('script', 'referrerpolicy', NULL),

    ('section', 'global-attributes', NULL),

    ('select', 'global-attributes', NULL),
    ('select', 'autocomplete', NULL),
    ('select', 'disabled', NULL),
    ('select', 'form', NULL),
    ('select', 'multiple', NULL),
    ('select', 'name', NULL),
    ('select', 'required', NULL),
    ('select', 'size', NULL),

    ('slot', 'global-attributes', NULL),
    ('slot', 'name', NULL),

    ('small', 'global-attributes', NULL),

    ('source', 'global-attributes', NULL),
    ('source', 'type', NULL),
    ('source', 'src', 'child-of-video-or-audio'),
    ('source', 'srcset', 'child-of-picture'),
    ('source', 'sizes', 'child-of-picture'),
    ('source', 'media', 'child-of-picture'),
    ('source', 'width', 'child-of-picture'),
    ('source', 'height', 'child-of-picture'),

    ('span', 'global-attributes', NULL),

    ('strong', 'global-attributes', NULL),

    ('style', 'global-attributes', NULL),
    ('style', 'media', NULL),

    ('sub', 'global-attributes', NULL),

    ('summary', 'global-attributes', NULL),

    ('sup', 'global-attributes', NULL),

    ('svg', 'global-attributes', NULL),         /* TODO: SVG */

    ('table', 'global-attributes', NULL),

    ('tbody', 'global-attributes', NULL),

    ('td', 'global-attributes', NULL),
    ('td', 'colspan', NULL),
    ('td', 'rowspan', NULL),
    ('td', 'headers', NULL),

    ('template', 'global-attributes', NULL),

    ('textarea', 'global-attributes', NULL),
    ('textarea', 'autocomplete', NULL),
    ('textarea', 'cols', NULL),
    ('textarea', 'dirname', NULL),
    ('textarea', 'disabled', NULL),
    ('textarea', 'form', NULL),
    ('textarea', 'maxlength', NULL),
    ('textarea', 'minlength', NULL),
    ('textarea', 'name', NULL),
    ('textarea', 'placeholder', NULL),
    ('textarea', 'readonly', NULL),
    ('textarea', 'required', NULL),
    ('textarea', 'rows', NULL),
    ('textarea', 'wrap', NULL),

    ('tfoot', 'global-attributes', NULL),

    ('th', 'global-attributes', NULL),
    ('th', 'colspan', NULL),
    ('th', 'rowspan', NULL),
    ('th', 'headers', NULL),
    ('th', 'scope', NULL),
    ('th', 'abbr', NULL),

    ('thead', 'global-attributes', NULL),

    ('time', 'global-attributes', NULL),
    ('time', 'datetime', NULL),

    ('title', 'global-attributes', NULL),

    ('tr', 'global-attributes', NULL),

    ('track', 'global-attributes', NULL),
    ('track', 'kind', NULL),
    ('track', 'src', NULL),
    ('track', 'srclang', NULL),
    ('track', 'label', NULL),
    ('track', 'default', NULL),

    ('u', 'global-attributes', NULL),

    ('ul', 'global-attributes', NULL),

    ('var', 'global-attributes', NULL),

    ('video', 'global-attributes', NULL),
    ('video', 'src', NULL),
    ('video', 'crossorigin', NULL),
    ('video', 'poster', NULL),
    ('video', 'preload', NULL),
    ('video', 'autoplay', NULL),
    ('video', 'playsinline', NULL),
    ('video', 'loop', NULL),
    ('video', 'muted', NULL),
    ('video', 'controls', NULL),
    ('video', 'width', NULL),
    ('video', 'height', NULL),

    ('wbr', 'global-attributes', NULL)

ON CONFLICT DO NOTHING;
