-- ============================================================
-- CTEs (Common Table Expressions)
-- ============================================================
-- A CTE is a temporary named result set that exists within
-- the scope of a single statement. Defined using WITH keyword.
-- CTEs make complex queries more readable and maintainable.

-- Basic CTE: Create a temporary result set
WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, LastName, Age
    FROM EmployeeDemographics
    WHERE Age > 28
)
SELECT * FROM EmployeeCTE;

-- CTE with JOIN: Combine data from two tables
WITH EmployeeSalaries AS (
    SELECT
        ed.EmployeeID,
        ed.FirstName,
        ed.LastName,
        ed.Age,
        es.JobTitle,
        es.Salary
    FROM EmployeeDemographics ed
    INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
)
SELECT * FROM EmployeeSalaries
WHERE Salary > 80000;

-- Multiple CTEs: Chain multiple temporary result sets
WITH GenderStats AS (
    SELECT Gender, COUNT(*) AS GenderCount
    FROM EmployeeDemographics
    GROUP BY Gender
),
SalaryStats AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM EmployeeSalary
)
SELECT
    gs.Gender,
    gs.GenderCount,
    ss.AvgSalary
FROM GenderStats gs
CROSS JOIN SalaryStats ss;

-- CTE for ranking: Use window functions
WITH RankedSalaries AS (
    SELECT
        ed.FirstName,
        ed.LastName,
        es.Salary,
        ROW_NUMBER() OVER (ORDER BY es.Salary DESC) AS SalaryRank
    FROM EmployeeDemographics ed
    INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
)
SELECT * FROM RankedSalaries
WHERE SalaryRank <= 3;

-- CTE for aggregation with filter
WITH HighEarners AS (
    SELECT
        ed.EmployeeID,
        ed.FirstName,
        ed.LastName,
        es.Salary,
        CASE
            WHEN es.Salary >= 90000 THEN 'Top Tier'
            WHEN es.Salary >= 80000 THEN 'Mid Tier'
            ELSE 'Entry Tier'
        END AS Tier
    FROM EmployeeDemographics ed
    INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
)
SELECT Tier, COUNT(*) AS Count, AVG(Salary) AS AvgSalary
FROM HighEarners
GROUP BY Tier;

-- Recursive CTE (MySQL 8.0+): Useful for hierarchical data
-- This example generates numbers from 1 to 10
WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS n           -- Base case: start with 1
    UNION ALL
    SELECT n + 1            -- Recursive case: increment by 1
    FROM NumberSeries
    WHERE n < 10            -- Stop condition
)
SELECT * FROM NumberSeries;
