#!/usr/bin/env bash

./create_show_database.sh;
./load_show_data.sh;
./crypt_password.sh;
./check_read_only.sh;
