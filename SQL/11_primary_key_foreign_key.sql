-- ============================================================
-- PRIMARY KEY vs FOREIGN KEY
-- ============================================================
-- PRIMARY KEY: Uniquely identifies each row in a table.
--   - Must be unique (no duplicates)
--   - Cannot be NULL
--   - Each table can have only ONE primary key
--   - Automatically creates an index for fast lookups

-- FOREIGN KEY: Creates a link between two tables.
--   - References the primary key of another table
--   - Ensures referential integrity (prevents invalid references)
--   - Can have multiple foreign keys in a table
--   - Can be NULL (unless specified otherwise)

-- PRIMARY KEY example: Already defined in our tables
-- EmployeeDemographics has EmployeeID as PRIMARY KEY
-- EmployeeSalary also has EmployeeID (but not as PRIMARY KEY in this setup)

-- Create a new table with both PRIMARY KEY and FOREIGN KEY
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,           -- Primary Key: uniquely identifies each department
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,            -- Primary Key: uniquely identifies each employee
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)  -- Foreign Key: links to Departments
);

-- Insert data
INSERT INTO Departments VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'Chicago'),
(3, 'Finance', 'Boston');

INSERT INTO Employees VALUES
(101, 'Rishit', 'Shah', 1),
(102, 'Aarav', 'Patel', 2),
(103, 'Ananya', 'Shah', 1);

-- Query using the relationship
SELECT
    e.FirstName,
    e.LastName,
    d.DeptName,
    d.Location
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

-- FOREIGN KEY with ON DELETE CASCADE
-- When a department is deleted, all its employees are also deleted
CREATE TABLE Employees_Cascade (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
    ON DELETE CASCADE
);

-- FOREIGN KEY with ON DELETE SET NULL
-- When a department is deleted, set DeptID to NULL
CREATE TABLE Employees_SetNull (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
    ON DELETE SET NULL
);

-- Add foreign key to existing table using ALTER TABLE
-- ALTER TABLE Employees
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (DeptID) REFERENCES Departments(DeptID);

-- Drop foreign key constraint
-- ALTER TABLE Employees
-- DROP FOREIGN KEY fk_department;

-- KEY DIFFERENCE:
-- PRIMARY KEY = "I am unique identifier for this table"
-- FOREIGN KEY = "I reference a unique identifier in another table"
