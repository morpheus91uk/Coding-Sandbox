-- ASSIGNMENT -----------------------------------------------------------
/*
Create two tables named (Student and Courses) with below columns:
Student -
StudentID INT
StudentName - VARCHAR(10)
StudentAge -  INT
Course -
courseID INT(10)
courseName VARCHAR(12)
studentID INT

Constraint for student table :
student id should be PK and AUTOINC
studentName NOT NULL
StudentAge cant be null , DEFAULT 18

Constraint for course table :
courseName should only take HTML, CSS< JAVASCRIPT, DATAbase,Python values
StudentID should refer to Student ID in Student Table

Insert at least 10 records to each table
Update single columns and Multiple colums to practice both.
Upload into the Database 7&8 Assignment Folder
*/
-- Task -----------------------------------------------------------------
-- Create and Use DataBase;
CREATE DATABASE TaskOne;
USE TaskOne;
-- Incase i need to reset the database by deleting it;
DROP DATABASE TaskOne;
-- Create Students table with Student ID column containing values of Integer
-- which will auto increment for each new record added, it is set as Primary Key to link
-- with the next table. Has column StudentName with a VARCHAR limit of 10, StudentAge column
-- has value of INT, NOT NULL constraint to make sure the value is added, and incase the user
-- doesnt add it, it has a default set to 18;
CREATE TABLE Students(studentID INT AUTO_INCREMENT PRIMARY KEY, studentName VARCHAR(10), studentAge INT NOT NULL DEFAULT ('18'));
-- Create Course table with CourseID, value INT. CourseName column has value of VARCHAR limit to 12
-- Has studentID column, value of INT, set to FOREIGN KEY to link with Student Table;
CREATE TABLE Course(courseID INT, courseName VARCHAR(12), studentID INT, FOREIGN KEY(studentID) REFERENCES Students(studentID));
-- Code to add CONSTRAINTS to the courseName column. Only accepts certain values; 
ALTER TABLE Course
ADD CONSTRAINT chk_val CHECK (courseName IN ('HTML','CSS','JAVASCRIPT','DATABASE','PYTHON'));
-- Code to check the current status of the two tables (describe the tables);
DESC Students;
DESC Course;
-- To add one record to the Students table;
INSERT INTO Students(studentID, studentName, studentAge) VALUES (1, 'Richard', 21);
-- to add multiple records to the Students table;
INSERT INTO Students(studentID, studentName, studentAge) VALUES
(2,'Jethro', 69),
(3,'Tony', 44),
(4,'Kate', 33),
(5,'Timothy', 42),
(6,'Abbie',39),
(7,'Max',32),
(8,'Jonas',41),
(9,'Ziva', 31),
(10,'Alexis', 21);
 -- to see all the records in the Students Table;
SELECT * FROM Students;
-- to add one record to the Course table;
INSERT INTO Course(courseID, courseName, studentID) VALUES (1, 'HTML', 2); 
-- to add multiple records to the Course table;
INSERT INTO Course(courseID, courseName, studentID) VALUES
(2, 'CSS', 2),
(1, 'HTML', 1),
(1, 'HTML', 3),
(3, 'JAVASCRIPT', 4),
(2, 'CSS', 5),
(4, 'DATABASE',5),
(5, 'PYTHON', 6),
(5, 'PYTHON', 7),
(2, 'CSS', 7),
(1, 'HTML', 8),
(3, 'JAVASCRIPT', 9),
(4, 'DATABASE', 10),
(1, 'HTML', 10);
-- to view the records in the Course table;
SELECT * FROM Course;
-- to turn off safe mode allowing DELETE etc to work;
SET SQL_SAFE_UPDATES=0;
-- to delete from the Course Table:
DELETE FROM Course WHERE courseName='Python';
-- to delete all the data from Course Table by not specifying WHERE condition;
DELETE FROM Course;
-- to delete all available data from the Course Table whilst keeping the structure of the table;
TRUNCATE Course;
-- to delete the whole table, data and structure at the same time;
DROP TABLE Course;

-- -------------------------------------------------------------------------------------
-- Assignment --------
-- Write a query to delete a course where CourseName is CSS and the CourseID is 12
-- Write a query to delete course where courseName is not database or courseID is 11
-- write a query which will delete all the data from the course table;

DELETE FROM Course WHERE courseName='CSS' AND courseID='12';
DELETE FROM Course WHERE courseName<>'DATABASE' AND courseID<>'11';
TRUNCATE Course;

-- --------------------------------------------------------------------------------------
-- ALTER A TABLE---------------------
-- to ADD a new column to the end of the table Course;
ALTER TABLE Course
ADD startDate DATE;
-- to ADD a new column in a specific place in the table, in this case after courseID column;
ALTER TABLE Course
ADD startTime TIME AFTER courseID;
-- to ADD a new column at the start of a table, rather than the end or in the middle somewhere
-- CHAR(2) Value is a datatype that restricts the number of characters that can be included;
ALTER TABLE Course
ADD sessions CHAR(2) FIRST; 
-- to Delete a column from the Course table;
ALTER TABLE Course 
DROP COLUMN sessions;
-- to change the datatype that a column accepts, in this case, changing courseID from INT to DECIMAL;
ALTER TABLE Course
MODIFY COLUMN courseID DECIMAL(20,10);

-- to view all the records in the Course Table to make sure above codes work;
DESC Course;
SELECT * FROM Course;

-- -------------------------------------------------------------------------------------
-- ASSIGNMENT -------------------------------------------
-- Write a query which will change the length of courseSubject from 10 characters to 20.
-- Add location column to the Course table
-- Remove the location column back from course table
-- Add location column again, as the first column in the table
-- Add newLocation column after the location column in the Course table;
-- ---------------------------------------------------------------------------------------
-- TO add the courseSubject column to the Course table;
ALTER TABLE Course
ADD COLUMN courseSubject CHAR(10);
-- TO alter the length from CHAR(10) to CHAR(20);
ALTER TABLE Course 
MODIFY COLUMN courseSubject CHAR(20);
-- TO add a location column to the Course table;
ALTER TABLE Course
ADD COLUMN location CHAR(30);
-- TO Remove the location column from the Course table;
ALTER TABLE Course
DROP COLUMN location;
-- TO add location column again, in the first position on the table;
ALTER TABLE Course
ADD COLUMN location CHAR(20) FIRST;
-- TO add the newLocation column, after the location column in the Course table;
ALTER TABLE Course
ADD COLUMN newLocation CHAR(20) AFTER location;

-- to view all the records in the Course Table to make sure above codes work;
DESC Course;
SELECT * FROM Course;

-- ---------------------------------------------------------------------------------------
-- To Rename the students table to learners table;
ALTER TABLE students
RENAME TO learners;
-- To Remove the AUTO_INCREMENT feature from the learners table to allow removal of the PRIMARY KEY;
ALTER TABLE learners
MODIFY COLUMN studentID INT;
-- To Rename the column studentName into studentFullName;
ALTER TABLE learners
RENAME COLUMN studentName TO studentFullName;
-- To remove a PRIMARY KEY from the learners table;
ALTER TABLE learners
DROP PRIMARY KEY;
-- To ADD a PRIMARY KEY to the learners table on the studentID column;
ALTER TABLE learners ADD PRIMARY KEY(studentID);
-- Adding another column to Course table;
ALTER TABLE Course ADD learnersID INT;
-- To ADD a FOREIGN KEY to a table , in this case the Course table,
-- referencing the learners table, studentID column;
ALTER TABLE Course
ADD FOREIGN KEY(learnersID) REFERENCES learners(studentID);
-- ----------------------------------------------------------------------------------------
-- ASSIGNMENT ----------------------------
-- Figure out how to delete the FOREIGN KEY from a column
-- ---------------------------------------
-- to find the constraints in the table Course, so we can find and then remove the foregin key
SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
FROM information_schema.table_constraints
WHERE table_name='Course';
-- to remove the FOREIGN KEY
ALTER TABLE Course
DROP FOREIGN KEY course_ibfk_1, DROP KEY studentID;


SELECT * FROM Course;
DESC learners;
DESC Course;