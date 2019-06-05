DROP TABLE IF EXISTS fakultet CASCADE;
DROP TABLE IF EXISTS status CASCADE;
DROP TABLE IF EXISTS departman CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP SEQUENCE IF EXISTS fakultet_seq CASCADE;
DROP SEQUENCE IF EXISTS departman_seq CASCADE;
DROP SEQUENCE IF EXISTS student_seq CASCADE;
DROP SEQUENCE IF EXISTS status_seq CASCADE;

CREATE TABLE fakultet(
	id integer NOT NULL,
    naziv character varying(100) NOT NULL,
    sediste character varying(50)
);



CREATE TABLE departman(
	id integer NOT NULL,
    naziv character varying(100) NOT NULL,
    oznaka character varying(10) NOT NULL,
    fakultet integer NOT NULL

);

CREATE TABLE student(
	id integer NOT NULL,
    ime character varying(50) NOT NULL,
    prezime character varying(50) NOT NULL,
    broj_indeksa character varying(20) NOT NULL,
    status integer NOT NULL,
    departman integer NOT NULL
);

CREATE TABLE status(
	id integer NOT NULL,
    naziv character varying(100) NOT NULL,
    oznaka character varying(10) NOT NULL
);

ALTER TABLE fakultet ADD CONSTRAINT PK_Fakultet
	PRIMARY KEY(id);
ALTER TABLE departman ADD CONSTRAINT PK_Departman
	PRIMARY KEY(id);
ALTER TABLE student ADD CONSTRAINT PK_Student
	PRIMARY KEY(id);
ALTER TABLE status ADD CONSTRAINT PK_Status
	PRIMARY KEY(id);

ALTER TABLE departman ADD CONSTRAINT FK_Departman_fakultet
	FOREIGN KEY (fakultet) REFERENCES fakultet (id);
ALTER TABLE student ADD CONSTRAINT FK_Student_Departman
	FOREIGN KEY (departman) REFERENCES departman (id);
ALTER TABLE student ADD CONSTRAINT FK_Student_Status
	FOREIGN KEY (status) REFERENCES status (id);

CREATE INDEX IDXFK_Departman_fakultet
	ON departman (fakultet);
CREATE INDEX IDXFK_Student_Departman
	ON student (departman);
CREATE INDEX IDXFK_Student_Status
	ON student (status);

CREATE SEQUENCE fakultet_seq
INCREMENT 1;
CREATE SEQUENCE departman_seq
INCREMENT 1;
CREATE SEQUENCE student_seq
INCREMENT 1;
CREATE SEQUENCE status_seq
INCREMENT 1;
