-- ============================================================
-- CASE STATEMENTS
-- ============================================================
-- CASE is SQL's version of IF-ELSE logic.
-- It evaluates conditions and returns a value based on the first true condition.
-- Syntax: CASE WHEN condition THEN result WHEN ... ELSE default END

-- Basic CASE: Categorize employees by salary range
SELECT EmployeeID, FirstName, LastName, Salary,
    CASE
        WHEN Salary >= 90000 THEN 'High Earner'
        WHEN Salary >= 80000 THEN 'Medium Earner'
        WHEN Salary >= 70000 THEN 'Average Earner'
        ELSE 'Entry Level'
    END AS SalaryCategory
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- CASE with column value matching (like switch statement)
SELECT EmployeeID, FirstName, LastName, Age,
    CASE Age
        WHEN 24 THEN 'Youngest'
        WHEN 25 THEN 'Second Youngest'
        WHEN 33 THEN 'Oldest'
        ELSE 'Mid-range'
    END AS AgeCategory
FROM EmployeeDemographics;

-- CASE in ORDER BY: Custom sort order
SELECT FirstName, LastName, Age
FROM EmployeeDemographics
ORDER BY
    CASE
        WHEN FirstName = 'Rishit' THEN 1
        WHEN FirstName = 'Aarav' THEN 2
        ELSE 3
    END;

-- CASE with aggregation: Count employees in each salary bracket
SELECT
    SUM(CASE WHEN Salary >= 90000 THEN 1 ELSE 0 END) AS HighEarners,
    SUM(CASE WHEN Salary >= 80000 AND Salary < 90000 THEN 1 ELSE 0 END) AS MediumEarners,
    SUM(CASE WHEN Salary < 80000 THEN 1 ELSE 0 END) AS LowEarners
FROM EmployeeSalary;
