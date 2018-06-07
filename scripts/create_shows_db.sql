
DROP DATABASE shows;
CREATE DATABASE shows;
CREATE TABLE users (
user_id serial PRIMARY KEY,
registration_date TIMESTAMP CHECK (registration_date < now()) NOT NULL,
firstname VARCHAR NOT NULL,
lastname VARCHAR NOT NULL,
email VARCHAR CHECK (email like '%@%') UNIQUE NOT NULL,
password VARCHAR NOT NULL
);



CREATE TABLE shows (
show_id serial PRIMARY KEY,
name VARCHAR,
description VARCHAR,
release_year INTEGER CHECK (1000 < release_year AND release_year < 9999),
genres VARCHAR,
network VARCHAR
);



CREATE TABLE episodes (
episode_id serial PRIMARY KEY,
show_id  INTEGER REFERENCES shows(show_id),
season INTEGER,
number INTEGER,
date DATE 
);


CREATE TABLE user_follow_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES shows(show_id),
follow_date DATE 
);


CREATE TABLE user_rate_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES shows(show_id),
rating INTEGER NOT NULL,
rating_date DATE 
);


CREATE TABLE user_watch_episode (
user_id INTEGER REFERENCES users(user_id),
episode_id INTEGER REFERENCES episodes(episode_id),
watch_date DATE
);
