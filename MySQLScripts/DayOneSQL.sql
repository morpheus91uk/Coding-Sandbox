-- Single line comment
/* Multi
Line
Comment
*/
-- MySQL is not case sensitive
SHOW DATABASES; -- will list all the available databases
-- CTRL+ENTER will execture the query
-- best practice is to use caps for keywords
CREATE DATABASE MAN7; -- will create a database with the name of MAN7
DROP DATABASE MAN7; -- will delete the database with the name of MAN7
USE MAN7; -- this query will select the MAN7 database

CREATE TABLE Learners(learnerID INT, learnerName VARCHAR(15), learnerDOB DATE);
SHOW TABLES; -- this will list all the available tables in the selected database;
DESCRIBE Learners; -- will show the definition of the table provided
/* Assignment 
Create three databases, test1, test2, test3
delete the test2 database
listall tables in the test1 database
create course table with below columns and datatypes
-courseID INT
-courseSubject VARCHAR
-startDate DATE
-time TIME
*/
CREATE DATABASE test1;
CREATE DATABASE test2;
CREATE DATABASE test3;
DROP DATABASE test2;
USE test1;
SHOW TABLES;
CREATE TABLE Course(CourseID INT, CourseSubject VARCHAR(15), StartDate DATE, StartTime TIME);
DESCRIBE Course;
DROP DATABASE test1;
CREATE DATABASE test1;
-- ---------------------- MYSQL CONSTRAINT -----------------------
USE test3;
CREATE TABLE Country(countryID INT PRIMARY KEY AUTO_INCREMENT, countryName Varchar(15)
NOT NULL);
DESCRIBE Country; 
INSERT INTO Country(countryName) VALUES ('UK');
SELECT * FROM Country;
INSERT INTO Country(countryName) VALUES ('USA');
INSERT INTO Country(countryName) VALUES ('Germnay');
CREATE TABLE Learner(learnerID INT PRIMARY KEY, learnerName VARCHAR(50) DEFAULT 'Mark', learnerAge INT, countryID INT,
CHECK(learnerAge>=18), FOREIGN KEY(countryID) REFERENCES Country(countryID)); 
DESC Learner;
INSERT INTO Learner(learnerID, learnerAge, countryID) VALUES (1,20,1);
INSERT INTO Learner(learnerID, learnerName, learnerAge, countryID) VALUES (2,'Matt',20,1);
INSERT INTO Learner(learnerID, learnerName, learnerAge, countryID) VALUES (3,'Zack',19,1);
SELECT * FROM Learner;

-- Task ---------------------------------------------------------------------------------
/* 
create country table with below columns:
-countryID INT PRIMARYKEY-
-countryName VARCHAR(10) -
-Constraint countryName  should only accept UK USA GERMANY FRANCE values

create City table with below columns:
-cityID INT PRIMARY KEY-
-countryID INT Foreign Key referencing the countryID column in Country table
-constraint city ID should be automatically generated
-if you dont insert city name it should take London as the default
*/
CREATE TABLE Country2(countryID INT PRIMARY KEY, countryName VARCHAR(10) DEFAULT 'London',
CHECK(countryName = 'UK'), 
CHECK(countryName = 'USA'),
CHECK(countryName = 'Germany'),
CHECK(countryName = 'France'));

CREATE TABLE City(cityID INT AUTO_INCREMENT PRIMARY KEY, countryID INT,
FOREIGN KEY(countryID) REFERENCES Country2(countryID ));
DESCRIBE Country2;
DESCRIBE City;

-- TASK -----------------------------------------------------------------------------------

CREATE TABLE Trainer(trainerID INT PRIMARY KEY, trainerName VARCHAR(15) DEFAULT 'Zack');
-- TO ADD ONE ENTRY
INSERT INTO Trainer(trainerID, trainerName) VALUES (1, 'Richard');
-- TO ADD MULTIPLE ENTRIES AT ONCE
INSERT INTO Trainer(trainerID, trainerName) VALUES (2, 'Christian'), (3, 'Tim'), (4, 'Narayan'), (5, 'Waqas');
SELECT * FROM Trainer;

-- TO UPDATE DATA ------------------------------------------
UPDATE Trainer SET trainerName='Abdul' WHERE trainerID=4;
UPDATE Trainer SET trainerName='Ender' WHERE trainerName='Richard';
-- Turns off safe mode so that UPDATE and DELTE Work.
SET SQL_SAFE_UPDATES=0;

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