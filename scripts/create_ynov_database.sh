#!/usr/bin/env bash


psql --username=admin -c "DROP DATABASE ynov;" ;
psql --username=admin -c "CREATE DATABASE ynov;" ;
psql --username=admin ynov -f ynov.sql;
