#!/usr/bin/env bash

psql --username=admin -d shows -f load_data.sql 
