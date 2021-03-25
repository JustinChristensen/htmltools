#!/usr/bin/env bash

sqlite3 html.db < create_schema.sql
sqlite3 html.db < data/elements.sql
sqlite3 html.db < data/attributes.sql
 