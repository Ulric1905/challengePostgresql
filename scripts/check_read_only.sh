#!/usr/bin/env bash


sudo psql --username=admin -d shows -f read_only.sql;
