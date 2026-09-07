-- ============================================================
-- ALIASING
-- ============================================================
-- Aliasing gives temporary names to tables or columns for readability.
-- Uses AS keyword (AS is optional in most databases).
-- Aliases only exist for the duration of the query.

-- COLUMN ALIASING: Rename columns in output
SELECT
    FirstName AS First_Name,
    LastName AS Last_Name,
    Age AS Employee_Age
FROM EmployeeDemographics;

-- Column alias with expression
SELECT
    FirstName,
    Salary AS Annual_Salary,
    Salary / 12 AS Monthly_Salary,
    Salary * 0.1 AS Bonus
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Aliasing without AS keyword (works in most databases)
SELECT
    FirstName First_Name,
    LastName Last_Name,
    Salary Salary_Amount
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- TABLE ALIASING: Give short names to tables
-- Especially useful in JOINs to avoid repeating table names
SELECT e.FirstName, e.LastName, s.JobTitle, s.Salary
FROM EmployeeDemographics e
INNER JOIN EmployeeSalary s ON e.EmployeeID = s.EmployeeID;

-- Multiple table aliases
SELECT
    ed.FirstName,
    ed.LastName,
    es.JobTitle,
    es.Salary
FROM EmployeeDemographics AS ed
INNER JOIN EmployeeSalary AS es ON ed.EmployeeID = es.EmployeeID;

-- Aliasing with aggregate functions
SELECT
    Gender,
    COUNT(*) AS Total_Count,
    AVG(Age) AS Average_Age
FROM EmployeeDemographics
GROUP BY Gender;
