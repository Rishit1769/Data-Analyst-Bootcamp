-- ============================================================
-- JOINS
-- ============================================================
-- JOIN is used to combine rows from two or more tables based on
-- a related column between them.
-- Types: INNER, LEFT, RIGHT, FULL OUTER, CROSS

-- INNER JOIN: Returns only matching rows from both tables
-- Here we match EmployeeID from both tables
SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.JobTitle, es.Salary
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es
ON ed.EmployeeID = es.EmployeeID;

-- LEFT JOIN: Returns ALL rows from left table + matching rows from right
-- If no match, right side shows NULL
SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.JobTitle, es.Salary
FROM EmployeeDemographics ed
LEFT JOIN EmployeeSalary es
ON ed.EmployeeID = es.EmployeeID;

-- RIGHT JOIN: Returns ALL rows from right table + matching rows from left
-- If no match, left side shows NULL
SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.JobTitle, es.Salary
FROM EmployeeDemographics ed
RIGHT JOIN EmployeeSalary es
ON ed.EmployeeID = es.EmployeeID;

-- FULL OUTER JOIN: Returns all rows from both tables
-- Matching rows combined, non-matching show NULL on the other side
-- MySQL doesn't support FULL OUTER JOIN directly, use UNION
SELECT ed.EmployeeID, ed.FirstName, es.JobTitle, es.Salary
FROM EmployeeDemographics ed
LEFT JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
UNION
SELECT ed.EmployeeID, ed.FirstName, es.JobTitle, es.Salary
FROM EmployeeDemographics ed
RIGHT JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- CROSS JOIN: Returns Cartesian product (every row from first table
-- paired with every row from second table)
SELECT ed.FirstName, es.JobTitle
FROM EmployeeDemographics ed
CROSS JOIN EmployeeSalary es;
