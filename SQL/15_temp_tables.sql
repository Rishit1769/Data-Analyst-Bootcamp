-- ============================================================
-- TEMP TABLES (Temporary Tables)
-- ============================================================
-- Temp tables exist only for the duration of a session.
-- They are useful for intermediate calculations and data processing.
-- Different databases have different syntax.

-- MySQL: Create temporary table
CREATE TEMPORARY TABLE TempEmployeeSummary (
    Gender VARCHAR(10),
    EmployeeCount INT,
    TotalSalary DECIMAL(12,2),
    AvgSalary DECIMAL(10,2)
);

-- Insert aggregated data into temp table
INSERT INTO TempEmployeeSummary
SELECT
    ed.Gender,
    COUNT(*) AS EmployeeCount,
    SUM(es.Salary) AS TotalSalary,
    AVG(es.Salary) AS AvgSalary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
GROUP BY ed.Gender;

-- Query the temp table like a regular table
SELECT * FROM TempEmployeeSummary;

-- Temp table with SELECT INTO (SQL Server syntax, commented for MySQL)
-- SELECT Gender, COUNT(*) AS EmployeeCount
-- INTO #TempTable
-- FROM EmployeeDemographics
-- GROUP BY Gender;

-- Create another temp table for analysis
CREATE TEMPORARY TABLE TempSalaryBands (
    EmployeeID INT,
    FirstName VARCHAR(50),
    Salary INT,
    SalaryBand VARCHAR(20)
);

-- Populate using CASE statement
INSERT INTO TempSalaryBanks
SELECT
    ed.EmployeeID,
    ed.FirstName,
    es.Salary,
    CASE
        WHEN es.Salary >= 90000 THEN 'High'
        WHEN es.Salary >= 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryBand
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Use temp table for further analysis
SELECT SalaryBand, COUNT(*) AS Count
FROM TempSalaryBands
GROUP BY SalaryBand;

-- Check if temp table exists (MySQL)
-- SHOW TEMPORARY TABLES;

-- Drop temp table (optional, auto-dropped when session ends)
DROP TEMPORARY TABLE IF EXISTS TempEmployeeSummary;
DROP TEMPORARY TABLE IF EXISTS TempSalaryBands;

-- SQL Server: # prefix for local temp tables, ## for global
-- CREATE TABLE #TempTable (id INT, name VARCHAR(50));
-- CREATE TABLE ##GlobalTempTable (id INT, name VARCHAR(50));

-- PostgreSQL: CREATE TEMP TABLE
-- CREATE TEMP TABLE temp_table AS SELECT * FROM employees;
