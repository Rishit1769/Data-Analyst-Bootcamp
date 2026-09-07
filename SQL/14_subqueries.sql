-- ============================================================
-- SUBQUERIES
-- ============================================================
-- A subquery is a query nested inside another query.
-- Also called inner query or nested query.
-- Can be used in SELECT, FROM, WHERE, and HAVING clauses.

-- SCALAR SUBQUERY: Returns a single value
-- Find employees earning above average salary
SELECT FirstName, LastName, Salary
FROM EmployeeSalary
WHERE Salary > (SELECT AVG(Salary) FROM EmployeeSalary);

-- Subquery in SELECT: Add a calculated column
SELECT
    FirstName,
    Salary,
    (SELECT AVG(Salary) FROM EmployeeSalary) AS CompanyAvgSalary,
    Salary - (SELECT AVG(Salary) FROM EmployeeSalary) AS DiffFromAvg
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Subquery in FROM clause (Derived Table)
-- Create a temporary table from aggregation
SELECT DepartmentStats.AvgSalary, DepartmentStats.MinSalary
FROM (
    SELECT
        AVG(Salary) AS AvgSalary,
        MIN(Salary) AS MinSalary
    FROM EmployeeSalary
) AS DepartmentStats;

-- CORRELATED SUBQUERY: References outer query
-- Find employees earning more than the company average
SELECT ed.FirstName, ed.LastName, es.Salary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
WHERE es.Salary > (
    SELECT AVG(Salary) FROM EmployeeSalary
);

-- Subquery with IN operator
-- Find employees whose ID exists in salary table
SELECT FirstName, LastName
FROM EmployeeDemographics
WHERE EmployeeID IN (
    SELECT EmployeeID FROM EmployeeSalary
    WHERE Salary > 80000
);

-- Subquery with EXISTS
-- Check if a record exists in related table
SELECT ed.FirstName, ed.LastName
FROM EmployeeDemographics ed
WHERE EXISTS (
    SELECT 1
    FROM EmployeeSalary es
    WHERE es.EmployeeID = ed.EmployeeID
    AND es.Salary > 85000
);

-- Subquery with ALL: Greater than all values
SELECT FirstName, Salary
FROM EmployeeSalary
WHERE Salary > ALL (
    SELECT Salary FROM EmployeeSalary WHERE JobTitle LIKE '%Engineer%'
);

-- Subquery with ANY/SOME: Greater than any value
SELECT FirstName, Salary
FROM EmployeeSalary
WHERE Salary > ANY (
    SELECT Salary FROM EmployeeSalary WHERE JobTitle LIKE '%Analyst%'
);

-- KEY DIFFERENCE:
-- Subquery runs once for each row (correlated) or once (non-correlated)
-- CTE runs once and is referenced multiple times
