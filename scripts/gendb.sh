#!/usr/bin/env bash

db=html.db
[[ ! -f $db ]] && echo "creating $db..."
sqlite3 $db < create_schema.sql

echo "elements..."
sqlite3 $db < data/elements.sql
echo "attributes..."
sqlite3 $db < data/attributes.sql
echo "categories..."
sqlite3 $db < data/categories.sql
echo "categories_elements..."
sqlite3 $db < data/categories_elements.sql
 