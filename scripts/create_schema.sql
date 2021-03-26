/* elements */
CREATE TABLE IF NOT EXISTS elements (
    name TEXT PRIMARY KEY
);

/* attributes */
/* as of right now, there are no constraints on membership for a set, and 
   the only set is global, and so we'll skip the join table */
CREATE TABLE IF NOT EXISTS attributes (
    name TEXT PRIMARY KEY,          /* attribute or category name (for now, just global) */
    attributes TEXT NOT NULL        /* space-delimited set of attributes (as of know, */
);                                  /* just the attribute itself with global being the only set) */ 

/* element categories (phrasing, flow, a, h1, etc) */
CREATE TABLE IF NOT EXISTS categories (
    name TEXT PRIMARY KEY           /* category name */
);

/* unique identifier mapped to a description of the constraint */
CREATE TABLE IF NOT EXISTS constraints (
    constraint TEXT PRIMARY KEY,    /* constraint id, such as descendant-of-video-or-audio */
    description TEXT                /* plain text description of the constraint */
);

/* element content model, with potential constraints */
CREATE TABLE IF NOT EXISTS elements_categories (
    element TEXT NOT NULL,
    attribute TEXT NOT NULL,
    constraint TEXT,
    FOREIGN KEY (element) REFERENCES elements(name),
    FOREIGN KEY (attribute) REFERENCES attributes(name),
    FOREIGN KEY (constraint) REFERENCES constraints(constraint)
);

/* element attributes, with potential constraints */
CREATE TABLE IF NOT EXISTS elements_attributes (
    element TEXT NOT NULL,
    attribute TEXT NOT NULL,
    constraint TEXT,
    FOREIGN KEY (element) REFERENCES elements(name),
    FOREIGN KEY (attribute) REFERENCES attributes(name),
    FOREIGN KEY (constraint) REFERENCES constraints(constraint)
);

/* elements in a category, with potential constraints, such as has-href-attribute */
CREATE TABLE IF NOT EXISTS categories_elements (
    category TEXT NOT NULL,
    element TEXT NOT NULL,
    constraint TEXT,
    FOREIGN KEY (category) REFERENCES categories(name),
    FOREIGN KEY (element) REFERENCES elements(name),
    FOREIGN KEY (constraint) REFERENCES constraints(constraint)
);
