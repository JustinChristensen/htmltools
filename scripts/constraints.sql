INSERT INTO constraints ("constraint", locations) VALUES
    ('has-src-attribute',       'https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-embed-element'),
    ('child-of-ol',             'https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element'),
    ('child-of-video-or-audio', 'https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element'),
    ('child-of-picture',        'https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element')
ON CONFLICT DO NOTHING;
