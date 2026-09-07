CREATE DATABASE SQLTutorials;
USE SQLTutorials;

CREATE TABLE EmployeeDemographics(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(50)
)

CREATE TABLE EmployeeSalary(
    EmployeeID INT,
    JobTitle VARCHAR(50),
    Salary INT
)

INSERT INTO EmployeeDemographics VALUES
(1001,'Rishit','Shah',25,'Male'),
(1002,'Aarav','Patel',30,'Male'),
(1003,'Ananya','Shah',28,'Female'),
(1004,'Ishita','Mehta',32,'Female'),
(1005,'Karan','Shah',29,'Male'),
(1006,'Riya','Patel',27,'Female'),
(1007,'Vivaan','Shah',31,'Male'),
(1008,'Aanya','Mehta',26,'Female'),
(1009,'Siddharth','Patel',33,'Male'),
(1010,'Anika','Shah',24,'Female');