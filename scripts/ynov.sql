
DROP DATABASE YNOV;
CREATE DATABASE YNOV;


CREATE TABLE students (
student_id serial PRIMARY KEY,
firstname VARCHAR NOT NULL,
lastname VARCHAR NOT NULL
);





CREATE TABLE classes(
classe_id serial PRIMARY KEY,
name_classe VARCHAR,
name_prof VARCHAR
);





CREATE TABLE notes(

note_id serial PRIMARY KEY,
student_id INTEGER REFERENCES students(student_id),
classe_id INTEGER REFERENCES classes(classe_id),
coefficient INTEGER

);
