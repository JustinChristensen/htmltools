PRAGMA foreign_keys = ON;

/* extra constraints on category elements */
INSERT INTO categories_elements (category, element, "constraint") VALUES
    ('flow-content', 'area', 'is-descendant-of-map'),
    ('flow-content', 'link', 'is-allowed-in-body'),
    ('flow-content', 'main', 'is-hierarchically-correct-main'),
    ('flow-content', 'meta', 'has-itemprop-attribute'),

    ('interactive-content', 'a', 'has-href-attribute'),
    ('interactive-content', 'audio', 'has-controls-attribute'),
    ('interactive-content', 'img', 'has-usemap-attribute'),
    ('interactive-content', 'input', 'type-attribute-not-hidden'),
    ('interactive-content', 'video', 'has-controls-attribute'),

    ('palpable-content', 'audio', 'has-controls-attribute'),
    ('palpable-content', 'dl', 'has-name-value-child'),
    ('palpable-content', 'input', 'type-attribute-not-hidden'),
    ('palpable-content', 'menu', 'has-li-child'),
    ('palpable-content', 'ol', 'has-li-child'),
    ('palpable-content', 'ul', 'has-li-child')
ON CONFLICT DO NOTHING;

UPDATE categories_elements
SET "constraint" = CASE (category, element)
    WHEN ('labelable-elements', 'input') THEN 'type-attribute-not-hidden'
    ELSE "constraint"    
END;
