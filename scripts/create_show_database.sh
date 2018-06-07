#!/usr/bin/env bash

psql --usernam=admin -c "DROP DATABASE shows;"
psql --username=admin -c "CREATE DATABASE shows;"
psql --username=admin shows -f create_shows_db.sql;
