#!/usr/bin/env bash

# Suprime la bdd shows
psql --usernam=admin -c "DROP DATABASE shows;"
# Creation de la bdd shows
psql --username=admin -c "CREATE DATABASE shows;"
#Creation des tables de la bdd shows
psql --username=admin shows -f create_shows_db.sql;
#Chargement data depuis psv vers les tables + affiche premiere ligne de chaque tables
psql --username=admin -d shows -f load_data.sql;
#Cryptage des password + affiche un résultat avec une recherche en claire
psql --username=admin -d shows -f crypt_password.sql;
#Creation user avec seul droit de lecture (problème de fonctionnement pour la connection comme vue ensemble en cour)
psql --username=admin -d shows -f read_only.sql;
