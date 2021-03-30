PRAGMA foreign_keys = ON;

/* TODO: think about whether or not it makes sense to let insertion order 
        indicate content order or not (probably need ROWID) */

/* TODO: use constraints only */

/* content model */
INSERT INTO elements_categories (element, category, "constraint") VALUES
    ('a', 'Transparent', 'no-interactive-content-a-or-tabindex-attribute-descendants'),

    ('abbr', 'Phrasing content', NULL),

    ('address', 'Flow content', 'no-heading-content-sectioning-content-header-footer-or-address-descendants'),

    /* area */

    ('article', 'Flow content', NULL),

    ('aside', 'Flow content', NULL),

    ('audio', 'source', 'no-src-attribute'),
    ('audio', 'track', NULL),
    ('audio', 'transparent', 'no-media-element-descendants'),

    ('b', 'Phrasing content', NULL),

    /* base */

    ('bdi', 'Phrasing content', NULL),

    ('bdo', 'Phrasing content', NULL),

    ('blockquote', 'Flow content', NULL),

    ('body', 'Flow content', NULL),

    /* br */

    ('button', 'Phrasing content', 'no-interactive-content-or-tabindex-attribute-descendants'),

    ('canvas', 'Transparent', 'no-interactive-content-with-canvas-exceptions'),

    ('caption', 'Flow content', 'no-table-descendants'),

    ('cite', 'Phrasing content', NULL),

    ('code', 'Phrasing content', NULL),

    /* col */

    ('colgroup', '', NULL),

    ('data', '', NULL),
    ('datalist', '', NULL),
    ('dd', '', NULL),
    ('del', '', NULL),
    ('details', '', NULL),
    ('dfn', '', NULL),
    ('dialog', '', NULL),
    ('div', '', NULL),
    ('dl', '', NULL),
    ('dt', '', NULL),
    ('em', '', NULL),
    ('embed', '', NULL),
    ('fieldset', '', NULL),
    ('figcaption', '', NULL),
    ('figure', '', NULL),
    ('footer', '', NULL),
    ('form', '', NULL),
    ('h1', '', NULL),
    ('h2', '', NULL),
    ('h3', '', NULL),
    ('h4', '', NULL),
    ('h5', '', NULL),
    ('h6', '', NULL),
    ('head', '', NULL),
    ('header', '', NULL),
    ('hgroup', '', NULL),
    ('hr', '', NULL),
    ('html', '', NULL),
    ('i', '', NULL),
    ('iframe', '', NULL),
    ('img', '', NULL),
    ('input', '', NULL),
    ('ins', '', NULL),
    ('kbd', '', NULL),
    ('label', '', NULL),
    ('legend', '', NULL),
    ('li', '', NULL),
    ('link', '', NULL),
    ('main', '', NULL),
    ('map', '', NULL),
    ('mark', '', NULL),
    ('math', '', NULL),
    ('menu', '', NULL),
    ('meta', '', NULL),
    ('meter', '', NULL),
    ('nav', '', NULL),
    ('noscript', '', NULL),
    ('object', '', NULL),
    ('ol', '', NULL),
    ('optgroup', '', NULL),
    ('option', '', NULL),
    ('output', '', NULL),
    ('p', '', NULL),
    ('param', '', NULL),
    ('picture', '', NULL),
    ('pre', '', NULL),
    ('progress', '', NULL),
    ('q', '', NULL),
    ('rp', '', NULL),
    ('rt', '', NULL),
    ('ruby', '', NULL),
    ('s', '', NULL),
    ('samp', '', NULL),
    ('script', '', NULL),
    ('section', '', NULL),
    ('select', '', NULL),
    ('slot', '', NULL),
    ('small', '', NULL),
    ('source', '', NULL),
    ('span', '', NULL),
    ('strong', '', NULL),
    ('style', '', NULL),
    ('sub', '', NULL),
    ('summary', '', NULL),
    ('sup', '', NULL),
    ('svg', '', NULL),
    ('table', '', NULL),
    ('tbody', '', NULL),
    ('td', '', NULL),
    ('template', '', NULL),
    ('textarea', '', NULL),
    ('tfoot', '', NULL),
    ('th', '', NULL),
    ('thead', '', NULL),
    ('time', '', NULL),
    ('title', '', NULL),
    ('tr', '', NULL),
    ('track', '', NULL),
    ('u', '', NULL),
    ('ul', '', NULL),
    ('var', '', NULL),
    ('video', '', NULL),
    ('wbr', '', NULL)
ON CONFLICT DO NOTHING;
