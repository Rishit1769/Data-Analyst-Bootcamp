-- ============================================================
-- UPDATING / DELETING DATA
-- ============================================================
-- UPDATE modifies existing records in a table.
-- DELETE removes records from a table.
-- WARNING: Always use WHERE clause to avoid updating/deleting ALL rows!

-- UPDATE: Change a single employee's salary
UPDATE EmployeeSalary
SET Salary = 85000
WHERE EmployeeID = 1001;

-- UPDATE multiple columns at once
UPDATE EmployeeDemographics
SET Age = 26, Gender = 'Male'
WHERE EmployeeID = 1010;

-- UPDATE with condition from another column
-- Give a raise to all employees earning below 75000
UPDATE EmployeeSalary
SET Salary = Salary + 5000
WHERE Salary < 75000;

-- DELETE: Remove a specific employee
DELETE FROM EmployeeSalary
WHERE EmployeeID = 1010;

DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1010;

-- DELETE with condition
-- Remove all employees below age 26
DELETE FROM EmployeeDemographics
WHERE Age < 26;

-- TRUNCATE: Removes ALL rows from a table (faster than DELETE)
-- Does not log individual row deletions
-- Cannot be rolled back in some databases
-- TRUNCATE TABLE EmployeeDemographics;

-- INSERT for testing: Add employee back
INSERT INTO EmployeeDemographics VALUES
(1010, 'Anika', 'Shah', 24, 'Female');

INSERT INTO EmployeeSalary VALUES
(1010, 'Marketing Specialist', 65000);
