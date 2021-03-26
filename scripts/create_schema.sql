CREATE TABLE IF NOT EXISTS elements (
    name TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS attributes (
    name TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS elements_attributes (
    element TEXT NOT NULL,
    attribute TEXT NOT NULL,
    constraint TEXT,
    FOREIGN KEY (element) REFERENCES elements(name),
    FOREIGN KEY (attribute) REFERENCES attributes(name)
);

CREATE TABLE IF NOT EXISTS categories (
    name TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS categories_elements (
    category TEXT NOT NULL,
    element TEXT NOT NULL,
    FOREIGN KEY (category) REFERENCES categories(name),
    FOREIGN KEY (element) REFERENCES elements(name)
);