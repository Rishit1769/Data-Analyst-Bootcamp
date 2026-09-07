-- ============================================================
-- HAVING vs GROUP BY STATEMENT
-- ============================================================
-- GROUP BY: Groups rows with same values into summary rows.
-- HAVING: Filters groups AFTER aggregation (WHERE filters BEFORE).

-- GROUP BY: Basic grouping
-- Count employees by gender
SELECT Gender, COUNT(*) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender;

-- GROUP BY with multiple columns
-- Count employees by gender and age
SELECT Gender, Age, COUNT(*) AS Count
FROM EmployeeDemographics
GROUP BY Gender, Age;

-- HAVING: Filter groups after aggregation
-- Find genders with more than 4 employees
SELECT Gender, COUNT(*) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender
HAVING COUNT(*) > 4;

-- HAVING with aggregate functions
-- Find job titles where average salary is above 80000
SELECT JobTitle, AVG(Salary) AS AvgSalary
FROM EmployeeSalary
GROUP BY JobTitle
HAVING AVG(Salary) > 80000;

-- WHERE vs HAVING comparison
-- WHERE filters rows BEFORE grouping
-- HAVING filters groups AFTER grouping

-- Example: WHERE filters individual rows, then GROUP BY groups them
SELECT Gender, AVG(Age) AS AvgAge
FROM EmployeeDemographics
WHERE Age > 25          -- Filters rows first
GROUP BY Gender
HAVING AVG(Age) > 28;  -- Then filters groups

-- Practical example: Departments with high average salary
-- First filter employees (WHERE), then group, then filter groups (HAVING)
SELECT JobTitle, COUNT(*) AS EmpCount, AVG(Salary) AS AvgSalary
FROM EmployeeSalary
WHERE Salary > 70000        -- Only consider employees earning > 70k
GROUP BY JobTitle
HAVING AVG(Salary) > 80000  -- Only show jobs with avg salary > 80k
ORDER BY AvgSalary DESC;

-- KEY DIFFERENCE:
-- WHERE cannot use aggregate functions (COUNT, SUM, AVG, etc.)
-- HAVING can use aggregate functions
-- SELECT Gender, COUNT(*) FROM EmployeeDemographics WHERE COUNT(*) > 5 GROUP BY Gender; -- ERROR!
-- SELECT Gender, COUNT(*) FROM EmployeeDemographics GROUP BY Gender HAVING COUNT(*) > 5; -- CORRECT
