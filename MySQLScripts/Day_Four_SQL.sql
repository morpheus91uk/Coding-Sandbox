-- Write a query which makes ID column of Book table as Primary key 
ALTER TABLE Book ADD PRIMARY KEY (ID);

-- Write a query which will change the data type of Salary column to INT in Trainer table 
ALTER TABLE Trainer
Modify COLUMN Salary INT;

-- Write a query which will make trainerID colum as Foreign Key in location table which is referening
	-- to the ID colum of Trainer table 
 ALTER TABLE Location ADD FOREIGN KEY (trainerID) REFERENCES Trainer(ID);  
 
-- Write a query which will delete all the data from Trainer tabler
TRUNCATE Trainer;

-- Write a query which will delete the schema and the data of Trainer table 
DROP TABLE Trainer;

-- Write a query which will rename Trainer table to Teacher table 
ALTER TABLE Trainer
RENAME TO Teacher;

-- Write a query which will add a column after salary column in Trainer table 
ALTER TABLE Trainer
ADD COLUMN mystery VARCHAR(20) AFTER salary;

-- -------------------------------------------------------------------------------------------------------
-- Select Database company to use;
USE company;
-- Select all from each of the tables, to check records and schema etc. 
DESC department;
select * FROM department;
-- ------------------------
DESC dependent;
select * FROM dependent;
-- ------------------------
DESC dept_locations;
select * FROM dept_locations;
-- ------------------------
DESC employee;
select * FROM employee;
-- ------------------------
DESC project;
select * FROM project;
-- ------------------------
DESC works_on;
select * FROM works_on;
-- -----------------------------------------------------------------------------------------
-- to Display only First and Last name from the Employee table;
SELECT FNAME, LNAME FROM Employee;

-- to display only First, last name, Salaray and Birthday columns;
SELECT FNAME, LNAME, SALARY, BDATE FROM Employee;

-- to display a specific employees details using WHERE condition;
SELECT * FROM Employee
WHERE FNAME='Franklin';

-- to display the full name of an employee, as a concatonated string rather
-- than in seperate columns, and have the resulting column be name Full Name
-- This creates a result-set with the 'ALIAS' name FullName;
SELECT CONCAT(FNAME, ' ', LNAME) AS 'Full Name' FROM Employee;

-- to select a column with an Alias Name, to add spaces etc to column name
-- or make the column title easier to understand;
SELECT FNAME AS 'First Name', LNAME AS 'Last Name' FROM Employee;

-- ---------------------------------------------------------------------------------------------
-- To Sort data in SQL -------------

-- TO select all from employee table unsorted;
SELECT * FROM Employee;

-- To select all from employee table, sorted  in ascending order;
SELECT * FROM Employee ORDER BY FNAME ASC;

-- To select all from employee table, sorted in descending order;
SELECT * FROM Employee ORDER BY FNAME DESC;

-- To select all from employee table, sorting in ascending order by firstname, 
-- and then sorting in ascending order by lastname, if the firstnames are the same;
SELECT * FROM Employee ORDER BY FNAME ASC, LNAME ASC;

-- To select a certain number of records, or limit the number of records shown at once;
-- in this case, only showing the top 3 records;
SELECT * FROM Employee LIMIT 3;

-- To select a certain number of records, from the 4th record onwards, ignoring the first 3;
SELECT * FROM Employee LIMIT 3 OFFSET 3;

-- -------------------------------------------------------------------------------------
/* ASSIGNMENT --------------------------
1-find all the employees ordered by sex and then by first name
2- find the first two employees
3- find the first name and last name for all employees
4- find the employee which recieves the lowest salary
5- find the employee which recieves the highest salary
6- find the top five employees who are reveiving highest salary
*/
-- -------------------------------------------------------------------------------------
-- to find all employees ordered by sex and then first name;
SELECT * FROM Employee 
ORDER BY Sex ASC, FNAME ASC;

-- to find the first two employees;
SELECT * FROM Employee
LIMIT 2;

-- to find first and last name of each employee;
SELECT FNAME AS 'First Name', LNAME AS 'Last Name' FROM Employee;

-- to find the employee with the lowest salary;
SELECT * FROM Employee
WHERE Salary IS NOT NULL
ORDER BY Salary ASC
LIMIT 1;

-- to find all employees on the lowest salary;
SELECT * FROM Employee
WHERE Salary IS NOT NULL
ORDER BY Salary ASC
LIMIT 1;

SELECT * FROM Employee
WHERE Salary = '25000.00'
ORDER BY FNAME;

-- to find the employee with the highest salary;
SELECT * FROM Employee
ORDER BY Salary DESC
LIMIT 1;

-- to find the top 5 highest paid employees;
SELECT * FROM Employee
ORDER BY Salary DESC
LIMIT 5;

-- to display records whose FNAME is 'John' or "Ramesh' or 'Alicia';
SELECT * FROM Employee
WHERE FNAME = 'John' OR FNAME = 'Ramesh' OR FNAME = 'Alicia';

SELECT * FROM Employee
WHERE FNAME IN('John', 'Ramesh', 'Alicia');
-- ---------------------------------------------------------------------------------
-- AGGREGATE FUNCTIONS -----------
-- SUM(), AVG(), MIN(), MAX(), COUNT() ----
-- ASSIGNMENT -----------------

-- Write a query to find the Maximum Salary an employee is recieving in Employee Table
-- and name it with the alias Maximum Salary in the result-set;
SELECT MAX(Salary) AS 'Maximum Salary' FROM Employee;

-- Write a query to find the Minimum Salary an employee is recieving in Employee Table;
SELECT MIN(Salary) AS 'Minimum Salary' FROM Employee;

-- Write a query to find the total amouont of Salariies paid out to employees in Employee Table;
SELECT SUM(Salary) AS 'Total of ALL Employee Salaries' FROM Employee;

-- Write a query to find the average Salary of employees in the Employee Table;
SELECT AVG(Salary) AS 'Average Salary' FROM Employee;

-- Write a query to find how many records are available in the employee table;
SELECT COUNT(*) FROM Employee;

-- ASSIGNMENT -------------------------------------------------------------------
-- 1- Find the minimum salary an employee is recieving
-- 2- find the average of all salaries in Employee table.
-- 3- find the total of salary for those employees whos sex is male
-- 4- find the min and max salary in employee table
-- --------------------------------------------------------------------
-- To find the Minimum salary an employee is recieving in the employee table;
SELECT MIN(Salary) AS 'Minimum Salary' FROM Employee;

-- To find the average of all salaries in the employee table;
SELECT AVG(Salary) AS 'Average Salary' FROM Employee;

-- To find the total salary paid out to all male employees in employee table;
SELECT SUM(Salary) FROM Employee 
WHERE Sex = 'M';

-- To find the min and max salary in employee table;
SELECT Min(Salary) AS 'Minimum Salary', Max(Salary) AS 'Maximum Salary' FROM Employee;

-- ----------------------------------------------------------------------------------------------------
-- THE LIKE OPERATOR---------------

-- To select all employees whose name starts with the letter 'J';
SELECT * FROM Employee WHERE FNAME LIKE'J%';

-- To select all employees whose name ends with the letter 'N';
SELECT * FROM Employee WHERE FNAME LIKE '%N';

-- To select all employees whose name first name can be anything, but should have
-- the letters 'OH' after the first character;
SELECT * FROM Employee WHERE FNAME LIKE '_OH%';

-- --------------------------------------------------------------------------------------------
-- ASSIGNMENT ----------------------
-- 1- Write a query to select record of an employee who is born in 1965
-- 2- Write a query to display employees whose name starts with 'J' and should be at least 4 charactser long
-- 3- Write a query to display an employee whose first name starts and ends with 'A'
-- 4- Write a query to display an employee whose first name starts with 'J' but does not end with 'R'

-- -----------------------------------------------------------------------------------------
-- To select a record of an employee who was born in 1965;
SELECT * FROM Employee
WHERE BDATE LIKE '1965%';

-- To display records for employees whose first name starts with 'J' and has at least 4 char length;
SELECT * FROM Employee
WHERE FNAME LIKE 'J___%';

-- To display records for employees whose first and last name begins with 'A';
SELECT * FROM Employee
WHERE FNAME LIKE 'A%' AND LNAME LIKE 'A%'; 

-- To display records for employees whose first name begins and ends with 'A';
SELECT * FROM Employee
WHERE FNAME LIKE 'A%A';

-- To display records for employees whose first name starts with 'J' but also does not end with 'R';
SELECT * FROM Employee
WHERE FNAME LIKE 'J%' AND FNAME NOT LIKE '%R';

SELECT * FROM Employee;
-- -----------------------------------------------------------------------------------------------------------
-- HOMEWORK ASSIGNMENT ------------------------








