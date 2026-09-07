-- ============================================================
-- UNIONS
-- ============================================================
-- UNION combines the result sets of two or more SELECT statements.
-- UNION removes duplicate rows; UNION ALL keeps all rows including duplicates.
-- Important: Both SELECT statements must have the same number of columns
-- and compatible data types.

-- UNION: Combines results and REMOVES duplicates
-- Example: Get all unique first names from both tables
SELECT FirstName FROM EmployeeDemographics
UNION
SELECT JobTitle FROM EmployeeSalary;

-- UNION ALL: Combines results and KEEPS all duplicates
-- Useful when you want to see every row
SELECT FirstName FROM EmployeeDemographics
UNION ALL
SELECT JobTitle FROM EmployeeSalary;

-- UNION with WHERE clause on individual queries
-- Get employees from Demographics OR employees with salary > 80000
SELECT EmployeeID, FirstName AS Name, 'Demographics' AS Source
FROM EmployeeDemographics
WHERE Age > 30
UNION
SELECT EmployeeID, JobTitle AS Name, 'Salary' AS Source
FROM EmployeeSalary
WHERE Salary > 80000;
