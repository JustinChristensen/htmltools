#!/usr/bin/env bash

db=html.db
[[ ! -f $db ]] && echo "creating $db..."
sqlite3 $db < create_schema.sql
sqlite3 $db < data/elements.sql
sqlite3 $db < data/attributes.sql
sqlite3 $db < data/categories.sql
 