PRAGMA foreign_keys = ON;

/* https://html.spec.whatwg.org/multipage/syntax.html#elements-2 */

INSERT INTO categories (name) VALUES
    ('void-elements'),
    ('raw-text-elements'),
    ('escapable-raw-text-elements')
ON CONFLICT DO NOTHING;

INSERT INTO categories_elements (category, element) VALUES
    ('void-elements', 'area'),
    ('void-elements', 'base'),
    ('void-elements', 'br'),
    ('void-elements', 'col'),
    ('void-elements', 'embed'),
    ('void-elements', 'hr'),
    ('void-elements', 'img'),
    ('void-elements', 'input'),
    ('void-elements', 'link'),
    ('void-elements', 'meta'),
    ('void-elements', 'param'),
    ('void-elements', 'source'),
    ('void-elements', 'track'),
    ('void-elements', 'wbr'),

    ('raw-text-elements', 'script'),
    ('raw-text-elements', 'style'),

    ('escapable-raw-text-elements', 'textarea'),
    ('escapable-raw-text-elements', 'title')
ON CONFLICT DO NOTHING;
