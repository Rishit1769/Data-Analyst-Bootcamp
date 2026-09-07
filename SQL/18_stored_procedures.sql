-- ============================================================
-- STORED PROCEDURES
-- ============================================================
-- Stored procedures are precompiled SQL code stored in the database.
-- They can accept parameters, perform operations, and return results.
-- Benefits: Reusability, security, reduced network traffic.

-- Basic stored procedure: No parameters
DELIMITER //
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM EmployeeDemographics;
END //
DELIMITER ;

-- Call the procedure
CALL GetAllEmployees();

-- Stored procedure with INPUT parameter
DELIMITER //
CREATE PROCEDURE GetEmployeeByID(IN empID INT)
BEGIN
    SELECT ed.FirstName, ed.LastName, es.JobTitle, es.Salary
    FROM EmployeeDemographics ed
    INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
    WHERE ed.EmployeeID = empID;
END //
DELIMITER ;

-- Call with parameter
CALL GetEmployeeByID(1001);

-- Stored procedure with multiple INPUT parameters
DELIMITER //
CREATE PROCEDURE GetEmployeesBySalaryRange(IN minSal INT, IN maxSal INT)
BEGIN
    SELECT ed.FirstName, ed.LastName, es.Salary
    FROM EmployeeDemographics ed
    INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
    WHERE es.Salary BETWEEN minSal AND maxSal
    ORDER BY es.Salary DESC;
END //
DELIMITER ;

-- Call with range
CALL GetEmployeesBySalaryRange(75000, 90000);

-- Stored procedure with OUTPUT parameter
DELIMITER //
CREATE PROCEDURE GetSalaryStats(
    OUT totalSalary DECIMAL(12,2),
    OUT avgSalary DECIMAL(10,2),
    OUT empCount INT
)
BEGIN
    SELECT SUM(Salary), AVG(Salary), COUNT(*)
    INTO totalSalary, avgSalary, empCount
    FROM EmployeeSalary;
END //
DELIMITER ;

-- Call and retrieve output values
CALL GetSalaryStats(@total, @avg, @count);
SELECT @total AS TotalSalary, @avg AS AvgSalary, @count AS EmployeeCount;

-- Stored procedure with conditional logic
DELIMITER //
CREATE PROCEDURE GetEmployeeLevel(IN empID INT)
BEGIN
    DECLARE empSalary INT;
    DECLARE empLevel VARCHAR(20);

    SELECT Salary INTO empSalary
    FROM EmployeeSalary
    WHERE EmployeeID = empID;

    IF empSalary >= 90000 THEN
        SET empLevel = 'Senior';
    ELSEIF empSalary >= 80000 THEN
        SET empLevel = 'Mid-Level';
    ELSE
        SET empLevel = 'Junior';
    END IF;

    SELECT empID AS EmployeeID, empSalary AS Salary, empLevel AS Level;
END //
DELIMITER ;

CALL GetEmployeeLevel(1001);

-- Drop procedure
-- DROP PROCEDURE IF EXISTS GetAllEmployees;

-- List all procedures in database (MySQL)
SELECT ROUTINE_NAME, ROUTINE_TYPE
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'SQLTutorials';
