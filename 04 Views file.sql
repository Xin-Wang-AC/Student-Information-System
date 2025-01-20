
-- Filename: Views file

-- Author: Janani Krishnaveni Gokeda

-- Group members: Janani Krishnaveni Gokeda
-- & Xin Wang

-- Short description: The views shown below are used to
-- abstract complex queries and hide data structuers.
-- Every view is supposed to execute successfully.


-- 1. A dynamic view for query 4 in the previous task
-- (retrieve columns of name, gender and birthdate from
-- the student table that have gender of male as well as
-- birthdate later than 1995-01-01, this query is saved as
-- a dynamic view)

CREATE VIEW male_students_born_later_than_1995 AS
SELECT name, gender, birthdate
FROM student
WHERE gender = 'M'
AND   birthdate > '1995-01-01';

SELECT * FROM male_students_born_later_than_1995;

-- 2. A materialized view for query 9 in the previous task
-- (count how many students are in the student table, 
-- which is grouped by their birthdate and only shows 
-- the students whose birthdate is later than 1995-01-01,
-- this query is saved as a materialized view)

CREATE MATERIALIZED VIEW 
	   count_students_born_later_than_1995 AS
SELECT birthdate, COUNT(id) AS NumberOFStudents
FROM student
GROUP BY birthdate
HAVING birthdate > '1995-01-01';

SELECT * FROM count_students_born_later_than_1995;