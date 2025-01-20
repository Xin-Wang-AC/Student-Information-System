
-- Filename: Test Data file

-- Author: Janani Krishnaveni Gokeda

-- Group members: Janani Krishnaveni Gokeda
-- & Xin Wang

-- Short description: The commands below are used to
-- populate the database created by DDL command file.
-- The functional insert statements are supposed to
-- cover all of the tables.


-- Insert 6 records into the homeroom_teacher table
INSERT INTO homeroom_teacher (name, grading_period)
VALUES
('John Valley', 'Spring 2024'),
('Amal Ibrahim', 'Spring 2024'),
('Malek El-Kouzi', 'Fall 2024'),
('Natalie Gluzman', 'Fall 2024'),
('Vardaan Sangar', 'Winter 2025'),
('Yasser Jafer', 'Winter 2025');

-- Insert 6 records into the class table
INSERT INTO class (name, academic_year, homeroom_location, homeroom_teacher_id)
VALUES
('Group 1', '2024', 'CA400', (SELECT id FROM homeroom_teacher WHERE name = 'John Valley')),
('Group 2', '2024', 'WP216B', (SELECT id FROM homeroom_teacher WHERE name = 'Amal Ibrahim')),
('Group 3', '2024', 'WB342', (SELECT id FROM homeroom_teacher WHERE name = 'Malek El-Kouzi')),
('Group 4', '2024', 'WA212', (SELECT id FROM homeroom_teacher WHERE name = 'Natalie Gluzman')),
('Group 5', '2025', 'WT123', (SELECT id FROM homeroom_teacher WHERE name = 'Vardaan Sangar')),
('Group 6', '2025', 'WT207', (SELECT id FROM homeroom_teacher WHERE name = 'Yasser Jafer'));

-- Insert 6 records into the enrollment table
INSERT INTO enrollment (enrolled_date, unenrolled_date, class_id, homeroom_teacher_id)
VALUES
('2024-05-06', '2026-06-28', (SELECT id FROM class WHERE name = 'Group 1'), (SELECT id FROM homeroom_teacher WHERE name = 'John Valley')),
('2024-05-06', '2026-06-28', (SELECT id FROM class WHERE name = 'Group 2'), (SELECT id FROM homeroom_teacher WHERE name = 'Amal Ibrahim')),
('2024-09-03', '2026-10-25', (SELECT id FROM class WHERE name = 'Group 3'), (SELECT id FROM homeroom_teacher WHERE name = 'Malek El-Kouzi')),
('2024-09-03', '2026-10-25', (SELECT id FROM class WHERE name = 'Group 4'), (SELECT id FROM homeroom_teacher WHERE name = 'Natalie Gluzman')),
('2025-01-06', '2027-02-20', (SELECT id FROM class WHERE name = 'Group 5'), (SELECT id FROM homeroom_teacher WHERE name = 'Vardaan Sangar')),
('2025-01-06', '2027-02-20', (SELECT id FROM class WHERE name = 'Group 6'), (SELECT id FROM homeroom_teacher WHERE name = 'Yasser Jafer'));

-- Insert 6 records into the whole_transcript table
INSERT INTO whole_transcript (gpa)
VALUES
('4.0'),
('3.9'),
('3.8'),
('3.5'),
('3.0'),
('2.5');

-- Insert 6 records into the student table
INSERT INTO student (name, address, birthdate, gender, whole_transcript_id, enrollment_id)
VALUES
('Cyrus Walters', '6796 Ullamcorper Street', '1993-03-02', 'M', (SELECT id FROM whole_transcript WHERE gpa = '2.5'), (SELECT id FROM enrollment WHERE class_id = '1')),
('Rafael Mercado', '8514 Sit Avenue', '1995-04-01', 'M', (SELECT id FROM whole_transcript WHERE gpa = '3.0'), (SELECT id FROM enrollment WHERE class_id = '2')),
('Irma Dyer', '7254 Dapibus St.', '1997-04-13', 'F', (SELECT id FROM whole_transcript WHERE gpa = '3.5'), (SELECT id FROM enrollment WHERE class_id = '3')),
('Isaac Reyes', '915-5955 Dignissim Street', '1998-01-22', 'M', (SELECT id FROM whole_transcript WHERE gpa = '3.8'), (SELECT id FROM enrollment WHERE class_id = '4')),
('Mabel Lyons', 'P.O. Box 689, 928 Elit. Avenue', '1998-01-22', 'F', (SELECT id FROM whole_transcript WHERE gpa = '3.9'), (SELECT id FROM enrollment WHERE class_id = '5')),
('Rachel Huber', '425-3669 Integer Rd.', '1993-10-13', 'F', (SELECT id FROM whole_transcript WHERE gpa = '4.0'), (SELECT id FROM enrollment WHERE class_id = '6'));