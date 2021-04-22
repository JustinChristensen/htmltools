#!/usr/bin/env bash

DB=html.db
[[ ! -f $DB ]] && echo "creating $DB..."

SQLFILES=(
    schema.sql
    data/elements.sql
    data/attributes.sql
    data/categories.sql
    data/categories_elements.sql
    constraints.sql
    elements_attributes.sql
    element_contents.sql
    category_constraints.sql
    element_kinds.sql
)

for F in ${SQLFILES[@]}; do
    echo "migrations/$F..."
    sqlite3 $DB < "migrations/$F"
done