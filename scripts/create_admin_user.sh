#!/usr/bin/env bash

echo 'script setup bdd'

sudo -u postgres psql -c "CREATE ROLE admin LOGIN PASSWORD 'admin42' SUPERUSER; "
sudo -u postgres psql -c "CREATE DATABASE admin; "
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE admin TO admin;"
sudo -u postgres psql -c "\q"



