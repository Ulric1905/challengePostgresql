#!/usr/bin/env bash


psql --username=admin -d shows -f read_only.sql;
