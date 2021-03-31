#!/usr/bin/env bash

DB=html.db
[[ ! -f $DB ]] && echo "creating $DB..."

SQLFILES=(
    create_schema.sql
    data/elements.sql
    data/attributes.sql
    data/categories.sql
    data/categories_elements.sql
    constraints.sql
    elements_attributes.sql
    element_contents.sql
)

for F in ${SQLFILES[@]}; do
    echo "$F..."
    sqlite3 $DB < "$F"
done