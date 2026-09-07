CREATE DATABASE SQLTutorials;
USE SQLTutorials;

CREATE TABLE EmployeeDemographics(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(50)
);

CREATE TABLE EmployeeSalary(
    EmployeeID INT,
    JobTitle VARCHAR(50),
    Salary INT
);

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

INSERT INTO EmployeeSalary VALUES
(1001,'Software Engineer',80000),
(1002,'Data Analyst',75000),
(1003,'Project Manager',90000),
(1004,'HR Manager',85000),
(1005,'Business Analyst',78000),
(1006,'UX Designer',72000),
(1007,'DevOps Engineer',95000),
(1008,'QA Engineer',70000),
(1009,'Product Manager',88000),
(1010,'Marketing Specialist',65000);

SELECT * FROM EmployeeDemographics;
SELECT * FROM EmployeeSalary; 
SELECT COUNT(LastName) AS LastNameCount FROM EmployeeDemographics;
SELECT MAX(Salary) AS MaxSalary FROM EmployeeSalary;
SELECT MIN(Salary) AS MinSalary FROM EmployeeSalary;
SELECT AVG(Salary) AS AverageSalary FROM EmployeeSalary;

SELECT * FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Female'; 

SELECT * FROM EmployeeDemographics
WHERE LastName LIKE 'S%';

SELECT Gender, Age, COUNT(Gender) FROM EmployeeDemographics GROUP BY Gender, Age;

SELECT Gender, COUNT(Gender) AS CountGender 
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender;