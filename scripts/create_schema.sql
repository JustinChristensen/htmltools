/* TODO: move this into a migrations directory */

/* elements */
CREATE TABLE IF NOT EXISTS elements (
    name TEXT PRIMARY KEY           /* element name */
);

/* attributes */
/* as of right now, there are no constraints on membership for a set, and 
   the only set is global, and so we'll skip the join table */
CREATE TABLE IF NOT EXISTS attributes (
    name TEXT PRIMARY KEY,          /* attribute or category name (for now, just global) */
    attributes TEXT NOT NULL        /* space-delimited set of attributes (as of now, just the 
                                       attribute itself with global being the only set)*/
) WITHOUT ROWID;                                  

/* element categories (phrasing, flow, a, h1, etc) */
CREATE TABLE IF NOT EXISTS categories (
    name TEXT PRIMARY KEY           /* category name */
) WITHOUT ROWID;

/* unique identifier mapped to a description of the constraint */
CREATE TABLE IF NOT EXISTS constraints (
    "constraint" TEXT PRIMARY KEY,  /* constraint id, such as descendant-of-video-or-audio */
    locations TEXT NOT NULL          /* URLs where the spec mentions the constraint */
) WITHOUT ROWID;

/* element content model, with potential constraints */
CREATE TABLE IF NOT EXISTS elements_categories (
    element TEXT NOT NULL REFERENCES elements(name),
    category TEXT NOT NULL REFERENCES categories(name),
    "constraint" TEXT REFERENCES constraints("constraint"),
    PRIMARY KEY (element, category) 
) WITHOUT ROWID;

/* element attributes, with potential constraints */
CREATE TABLE IF NOT EXISTS elements_attributes (
    element TEXT NOT NULL REFERENCES elements(name),
    attribute TEXT NOT NULL REFERENCES attributes(name),
    "constraint" TEXT REFERENCES constraints("constraint"),
    PRIMARY KEY (element, attribute) 
) WITHOUT ROWID;

/* elements in a category, with potential constraints, such as has-href-attribute */
CREATE TABLE IF NOT EXISTS categories_elements (
    category TEXT NOT NULL REFERENCES categories(name),
    element TEXT NOT NULL REFERENCES elements(name),
    "constraint" TEXT REFERENCES constraints("constraint"),
    PRIMARY KEY (category, element) 
) WITHOUT ROWID;
