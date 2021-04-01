PRAGMA foreign_keys = ON;
INSERT INTO elements_attributes (element, attribute, "constraint") VALUES
    ('a', 'Global attributes', NULL),
    ('a', 'href', NULL),
    ('a', 'target', NULL),
    ('a', 'download', NULL),
    ('a', 'ping', NULL),
    ('a', 'rel', NULL),
    ('a', 'hreflang', NULL),
    ('a', 'type', NULL),
    ('a', 'referrerpolicy', NULL),

    ('abbr', 'Global attributes', NULL),

    ('address', 'Global attributes', NULL),

    ('area', 'Global attributes', NULL),
    ('area', 'alt', NULL),
    ('area', 'coords', NULL),
    ('area', 'shape', NULL),
    ('area', 'href', NULL),
    ('area', 'target', NULL),
    ('area', 'download', NULL),
    ('area', 'ping', NULL),
    ('area', 'rel', NULL),
    ('area', 'referrerpolicy', NULL),

    ('article', 'Global attributes', NULL),

    ('aside', 'Global attributes', NULL),

    ('audio', 'Global attributes', NULL),
    ('audio', 'src', NULL),
    ('audio', 'crossorigin', NULL),
    ('audio', 'preload', NULL),
    ('audio', 'autoplay', NULL),
    ('audio', 'loop', NULL),
    ('audio', 'muted', NULL),
    ('audio', 'controls', NULL),

    ('b', 'Global attributes', NULL),

    ('base', 'Global attributes', NULL),
    ('base', 'href', NULL),
    ('base', 'target', NULL),

    ('bdi', 'Global attributes', NULL),

    ('bdo', 'Global attributes', NULL),

    ('blockquote', 'Global attributes', NULL),
    ('blockquote', 'cite', NULL),

    /* TODO: event listeners */
    ('body', 'Global attributes', NULL),
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

    ('br', 'Global attributes', NULL),

    ('button', 'Global attributes', NULL),
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

    ('canvas', 'Global attributes', NULL),
    ('canvas', 'width', NULL),
    ('canvas', 'height', NULL),

    ('caption', 'Global attributes', NULL),

    ('cite', 'Global attributes', NULL),

    ('code', 'Global attributes', NULL),

    ('col', 'Global attributes', NULL),
    ('col', 'span', NULL),

    ('colgroup', 'Global attributes', NULL),
    ('colgroup', 'span', NULL),

    ('data', 'Global attributes', NULL),
    ('data', 'value', NULL),

    ('datalist', 'Global attributes', NULL),

    ('dd', 'Global attributes', NULL),

    ('del', 'Global attributes', NULL),
    ('del', 'cite', NULL),
    ('del', 'datetime', NULL),

    ('details', 'Global attributes', NULL),
    ('details', 'open', NULL),

    ('dfn', 'Global attributes', NULL),
   
    ('dialog', 'Global attributes', NULL),
    ('dialog', 'open', NULL),
    
    ('div', 'Global attributes', NULL),

    ('dl', 'Global attributes', NULL),

    ('dt', 'Global attributes', NULL),

    ('em', 'Global attributes', NULL),

    /* TODO: namespace-less attributes for pass-through */
    ('embed', 'Global attributes', NULL),
    ('embed', 'src', NULL),    
    ('embed', 'type', NULL),
    ('embed', 'width', NULL),
    ('embed', 'height', NULL),
    ('embed', 'itemprop', 'has-src-attribute'),

    ('fieldset', 'Global attributes', NULL),
    ('fieldset', 'disabled', NULL),
    ('fieldset', 'form', NULL),
    ('fieldset', 'name', NULL),

    ('figcaption', 'Global attributes', NULL),

    ('figure', 'Global attributes', NULL),

    ('footer', 'Global attributes', NULL),

    ('form', 'Global attributes', NULL),
    ('form', 'accept-charset', NULL),
    ('form', 'action', NULL),
    ('form', 'autocomplete', NULL),
    ('form', 'enctype', NULL),
    ('form', 'method', NULL),
    ('form', 'name', NULL),
    ('form', 'novalidate', NULL),
    ('form', 'target', NULL),
    ('form', 'rel', NULL),

    ('h1', 'Global attributes', NULL),
    ('h2', 'Global attributes', NULL),
    ('h3', 'Global attributes', NULL),
    ('h4', 'Global attributes', NULL),
    ('h5', 'Global attributes', NULL),
    ('h6', 'Global attributes', NULL),

    ('head', 'Global attributes', NULL),

    ('header', 'Global attributes', NULL),

    ('hgroup', 'Global attributes', NULL),

    ('hr', 'Global attributes', NULL),

    /* TODO: obsolete attributes https://html.spec.whatwg.org/multipage/obsolete.html#attr-html-manifest */
    ('html', 'Global attributes', NULL),

    ('i', 'Global attributes', NULL),

    ('iframe', 'Global attributes', NULL),
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

    ('img', 'Global attributes', NULL),
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

    ('input', 'Global attributes', NULL),
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

    ('ins', 'Global attributes', NULL),
    ('ins', 'cite', NULL),
    ('ins', 'datetime', NULL),

    ('kbd', 'Global attributes', NULL),

    ('label', 'Global attributes', NULL),
    ('label', 'for', NULL),

    ('legend', 'Global attributes', NULL),

    ('li', 'Global attributes', NULL),
    ('li', 'value', 'child-of-ol'),

    ('link', 'Global attributes', NULL),
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

    ('main', 'Global attributes', NULL),

    ('map', 'Global attributes', NULL),
    ('map', 'name', NULL),

    ('mark', 'Global attributes', NULL),

    ('math', 'Global attributes', NULL),    /* TODO: math elements */

    ('menu', 'Global attributes', NULL),

    ('meta', 'Global attributes', NULL),
    ('meta', 'name', NULL),
    ('meta', 'http-equiv', NULL),
    ('meta', 'content', NULL),
    ('meta', 'charset', NULL),

    ('meter', 'Global attributes', NULL),
    ('meter', 'value', NULL),
    ('meter', 'min', NULL),
    ('meter', 'max', NULL),
    ('meter', 'low', NULL),
    ('meter', 'high', NULL),
    ('meter', 'optimum', NULL),

    ('nav', 'Global attributes', NULL),

    ('noscript', 'Global attributes', NULL),

    ('object', 'Global attributes', NULL),
    ('object', 'data', NULL),
    ('object', 'type', NULL),
    ('object', 'name', NULL),
    ('object', 'form', NULL),
    ('object', 'width', NULL),
    ('object', 'height', NULL),

    ('ol', 'Global attributes', NULL),
    ('ol', 'reversed', NULL),
    ('ol', 'start', NULL),
    ('ol', 'type', NULL),

    ('optgroup', 'Global attributes', NULL),
    ('optgroup', 'disabled', NULL),
    ('optgroup', 'label', NULL),

    ('option', 'Global attributes', NULL),
    ('option', 'disabled', NULL),
    ('option', 'label', NULL),
    ('option', 'selected', NULL),
    ('option', 'value', NULL),

    ('output', 'Global attributes', NULL),
    ('output', 'for', NULL),
    ('output', 'form', NULL),
    ('output', 'name', NULL),

    ('p', 'Global attributes', NULL),

    ('param', 'Global attributes', NULL),
    ('param', 'name', NULL),
    ('param', 'value', NULL),

    ('picture', 'Global attributes', NULL),

    ('pre', 'Global attributes', NULL),

    ('progress', 'Global attributes', NULL),
    ('progress', 'value', NULL),
    ('progress', 'max', NULL),

    ('q', 'Global attributes', NULL),
    ('q', 'cite', NULL),

    ('rp', 'Global attributes', NULL),

    ('rt', 'Global attributes', NULL),

    ('ruby', 'Global attributes', NULL),

    ('s', 'Global attributes', NULL),

    ('samp', 'Global attributes', NULL),

    ('script', 'Global attributes', NULL),
    ('script', 'src', NULL),
    ('script', 'type', NULL),
    ('script', 'nomodule', NULL),
    ('script', 'async', NULL),
    ('script', 'defer', NULL),
    ('script', 'crossorigin', NULL),
    ('script', 'integrity', NULL),
    ('script', 'referrerpolicy', NULL),

    ('section', 'Global attributes', NULL),

    ('select', 'Global attributes', NULL),
    ('select', 'autocomplete', NULL),
    ('select', 'disabled', NULL),
    ('select', 'form', NULL),
    ('select', 'multiple', NULL),
    ('select', 'name', NULL),
    ('select', 'required', NULL),
    ('select', 'size', NULL),

    ('slot', 'Global attributes', NULL),
    ('slot', 'name', NULL),

    ('small', 'Global attributes', NULL),

    ('source', 'Global attributes', NULL),
    ('source', 'type', NULL),
    ('source', 'src', 'child-of-video-or-audio'),
    ('source', 'srcset', 'child-of-picture'),
    ('source', 'sizes', 'child-of-picture'),
    ('source', 'media', 'child-of-picture'),
    ('source', 'width', 'child-of-picture'),
    ('source', 'height', 'child-of-picture'),

    ('span', 'Global attributes', NULL),

    ('strong', 'Global attributes', NULL),

    ('style', 'Global attributes', NULL),
    ('style', 'media', NULL),

    ('sub', 'Global attributes', NULL),

    ('summary', 'Global attributes', NULL),

    ('sup', 'Global attributes', NULL),

    ('svg', 'Global attributes', NULL),         /* TODO: SVG */

    ('table', 'Global attributes', NULL),

    ('tbody', 'Global attributes', NULL),

    ('td', 'Global attributes', NULL),
    ('td', 'colspan', NULL),
    ('td', 'rowspan', NULL),
    ('td', 'headers', NULL),

    ('template', 'Global attributes', NULL),

    ('textarea', 'Global attributes', NULL),
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

    ('tfoot', 'Global attributes', NULL),

    ('th', 'Global attributes', NULL),
    ('th', 'colspan', NULL),
    ('th', 'rowspan', NULL),
    ('th', 'headers', NULL),
    ('th', 'scope', NULL),
    ('th', 'abbr', NULL),

    ('thead', 'Global attributes', NULL),

    ('time', 'Global attributes', NULL),
    ('time', 'datetime', NULL),

    ('title', 'Global attributes', NULL),

    ('tr', 'Global attributes', NULL),

    ('track', 'Global attributes', NULL),
    ('track', 'kind', NULL),
    ('track', 'src', NULL),
    ('track', 'srclang', NULL),
    ('track', 'label', NULL),
    ('track', 'default', NULL),

    ('u', 'Global attributes', NULL),

    ('ul', 'Global attributes', NULL),

    ('var', 'Global attributes', NULL),

    ('video', 'Global attributes', NULL),
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

    ('wbr', 'Global attributes', NULL)

ON CONFLICT DO NOTHING;
