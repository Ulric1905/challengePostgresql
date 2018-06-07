


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

COPY students(student_id,firstname,lastname)
FROM '/home/Ulric/student.csv' DELIMITER ',' CSV HEADER;
COPY classes(classe_id,name_classe,name_prof)
FROM '/home/Ulric/classes.csv' DELIMITER ',' CSV HEADER;
COPY notes(note_id,student_id,classe_id,coefficient)
FROM '/home/Ulric/notes.csv' DELIMITER ',' CSV HEADER;


DROP VIEW ynov_view;


CREATE VIEW ynov_view AS
	SELECT no.student_id AS id,
	u.firstname,
	u.lastname,
	c.name_classe,
	c.name_prof,
	no.coefficient
	FROM notes no
		INNER JOIN students u USING (student_id)
		INNER JOIN classes c USING (classe_id);
