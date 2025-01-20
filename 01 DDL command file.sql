
-- Filename: DDL command file

-- Author: Xin Wang

-- Group members: Janani Krishnaveni Gokeda
-- & Xin Wang

-- Short description: The DDL command is used to create
-- an essential database based on Assignment 1.
-- This database includes five tables related to
-- students who finish their studying
-- from registration to graduation.


-- Create the table of homeroom_teacher
CREATE TABLE homeroom_teacher(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	grading_period VARCHAR(20)
);

-- Create the table of class
-- and add column homeroom_teacher_id as foreign key
CREATE TABLE class(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	academic_year VARCHAR(4),
	homeroom_location VARCHAR(30),
	homeroom_teacher_id INT,
	CONSTRAINT fk_homeroom_teacher
		FOREIGN KEY (homeroom_teacher_id)
			REFERENCES homeroom_teacher(id)
);

-- Create the table of enrollment
-- and add columns class_id and homeroom_teacher_id
-- as foreign key. Plus, the column unenrolled_date should
-- be later than column enrolled_date.
CREATE TABLE enrollment(
	id SERIAL PRIMARY KEY,
	enrolled_date DATE,
	unenrolled_date DATE,
	class_id INT,
	homeroom_teacher_id INT,
	CONSTRAINT fk_class
		FOREIGN KEY (class_id)
			REFERENCES class(id),
	CONSTRAINT fk_homeroom_teacher
		FOREIGN KEY (homeroom_teacher_id)
			REFERENCES homeroom_teacher(id),
	CONSTRAINT DateValuesCheck 
		CHECK (unenrolled_date > enrolled_date)
);

-- Create the table of whole_transcript
CREATE TABLE whole_transcript(
	id SERIAL PRIMARY KEY,
	gpa FLOAT NOT NULL
);

-- Create the table of student
CREATE TABLE student(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	address VARCHAR(100),
	birthdate DATE,
	gender CHAR(1),
	whole_transcript_id INT,
	enrollment_id INT,
	CONSTRAINT fk_whole_transcript
		FOREIGN KEY (whole_transcript_id)
			REFERENCES whole_transcript(id),
	CONSTRAINT fk_enrollment
		FOREIGN KEY (enrollment_id)
			REFERENCES enrollment(id)
);