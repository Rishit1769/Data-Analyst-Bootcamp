-- ============================================================
-- CREATING VIEWS
-- ============================================================
-- A VIEW is a virtual table based on a SQL query.
-- It stores the query definition, NOT the actual data.
-- Views simplify complex queries and provide security by restricting column access.

-- Create a view combining employee demographics and salary
CREATE VIEW vw_EmployeeDetails AS
SELECT
    ed.EmployeeID,
    ed.FirstName,
    ed.LastName,
    ed.Age,
    ed.Gender,
    es.JobTitle,
    es.Salary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Use the view like a regular table
SELECT * FROM vw_EmployeeDetails;

-- Query specific columns from the view
SELECT FirstName, LastName, Salary FROM vw_EmployeeDetails
WHERE Salary > 80000;

-- Create a view for salary summary by gender
CREATE VIEW vw_SalaryByGender AS
SELECT
    Gender,
    COUNT(*) AS EmployeeCount,
    AVG(Salary) AS AverageSalary,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
GROUP BY Gender;

-- Use the summary view
SELECT * FROM vw_SalaryByGender;

-- Create a view for high earners
CREATE VIEW vw_HighEarners AS
SELECT
    ed.FirstName,
    ed.LastName,
    es.JobTitle,
    es.Salary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
WHERE es.Salary >= 85000;

-- Use the high earners view
SELECT * FROM vw_HighEarners;

-- Modify an existing view (MySQL syntax)
-- ALTER VIEW vw_EmployeeDetails AS SELECT ...;

-- Drop a view
-- DROP VIEW IF EXISTS vw_HighEarners;

-- List all views in current database (MySQL)
SHOW FULL TABLES WHERE Table_type = 'VIEW';
