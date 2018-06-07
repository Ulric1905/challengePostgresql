#!/usr/bin/env bash

psql --username=admin -d shows -c "COPY users TO '/mnt/c/postgr/scripts/backup.csv' DELIMITER ',' CSV HEADER;"
