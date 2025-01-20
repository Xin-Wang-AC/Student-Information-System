
-- Filename: Queries file

-- Author: Xin Wang

-- Group members: Janani Krishnaveni Gokeda
-- & Xin Wang

-- Short description: The queries shown below are used to
-- retrieve data populated in the tables created by
-- DDL command file. Every query is supposed to be valid
-- and execute successfully.


-- 1. A simple query that pulls all columns 
--    and rows from a table
-- (retrieve all columns and rows from the student table)

SELECT *
FROM student;

-- 2. A query that displays a subset of columns
-- (retrieve columns of name, gender and birthdate from
-- the student table)

SELECT name, gender, birthdate
FROM student;

-- 3. A query that displays a subset of columns 
--    with a single clause (predicate) WHERE statement
-- (retrieve columns of name, gender and birthdate from
-- the student table that have gender of male)

SELECT name, gender, birthdate
FROM student
WHERE gender = 'M';

-- 4. A query that displays a subset of columns 
--    with a multi-clause (predicate) WHERE statement 
--    using AND/OR
-- (retrieve columns of name, gender and birthdate from
-- the student table that have gender of male as well as
-- birthdate later than 1995-01-01)

SELECT name, gender, birthdate
FROM student
WHERE gender = 'M'
AND   birthdate > '1995-01-01';

-- 5. A query that performs a single table join. 
--    In other words, you are joining 2 tables.
-- (retrieve data of name and GPA from the student
-- table as well as the whole_transcript table)

SELECT s.name, w.gpa AS GPA
FROM student s
JOIN whole_transcript w ON s.whole_transcript_id = w.id;

-- 6. A query that performs a multi-table join. 
--    In other words, you are joining 3 or more tables.
-- (retrieve data of name, GPA and unenrolled_date 
-- from the student table, whole_transcript as well as 
-- enrollment table)

SELECT s.name, w.gpa AS GPA, 
	   e.unenrolled_date AS GraduationDate
FROM student s
JOIN whole_transcript w ON s.whole_transcript_id = w.id
JOIN enrollment e ON s.enrollment_id = e.id;

-- 7. A query that performs an aggregate 
--    (count, min, max, sum, avg, etc.).
-- (count how many students are in the student table)

SELECT COUNT(id) AS NumberOFStudents
FROM student;

-- 8. A query that performs an aggregate 
--    (count, min, max, sum, avg, etc.) with a GROUP BY.
-- (count how many students are in the student table, 
-- which is grouped by their gender)

SELECT gender, COUNT(id) AS NumberOFStudents
FROM student
GROUP BY gender;

-- 9. A query that performs an aggregate 
--    (count, min, max, sum, avg, etc.). with a GROUP BY 
-- and a HAVING clause
-- (count how many students are in the student table, 
-- which is grouped by their birthdate and only shows 
-- the students whose birthdate is later than 1995-01-01)

SELECT birthdate, COUNT(id) AS NumberOFStudents
FROM student
GROUP BY birthdate
HAVING birthdate > '1995-01-01';

-- 10. A query that performs a subquery either as part 
--     of the WHERE clause or as a derived/virtual table.
-- (retrieve data of name from the student table 
-- as well as the whole_transcript table, which only 
-- shows the students whose GPA is greater than 3.0)

SELECT s.name, w.gpa AS GPA
FROM student s
JOIN whole_transcript w ON s.whole_transcript_id = w.id
WHERE s.whole_transcript_id IN 
	(SELECT id FROM whole_transcript WHERE gpa > 3.0);

-- 11. A query that performs an aggregate with a join 
--     and a group by.
-- (count how many students are in the student table, 
-- which is grouped by their enrolled date)

SELECT e.enrolled_date, COUNT(s.id) AS NumberOFStudents
FROM student s
JOIN enrollment e ON s.enrollment_id = e.id
GROUP BY e.enrolled_date;