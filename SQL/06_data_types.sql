-- ============================================================
-- DATA TYPES
-- ============================================================
-- Data types define what kind of data a column can store.
-- Choosing the right type affects storage, performance, and validation.

-- NUMERIC TYPES
-- INT: Whole numbers (-2,147,483,648 to 2,147,483,647)
-- BIGINT: Very large whole numbers
-- FLOAT: Approximate decimal numbers (good for scientific calculations)
-- DECIMAL(p,s): Exact decimal numbers (p = precision, s = scale)
--   Example: DECIMAL(10,2) = up to 10 digits, 2 after decimal

-- STRING TYPES
-- VARCHAR(n): Variable-length string, max n characters (e.g., VARCHAR(50))
-- CHAR(n): Fixed-length string, always n characters (padded with spaces)
-- TEXT: Large variable-length string (up to 65,535 chars in MySQL)
-- ENUM: String with predefined values (e.g., ENUM('Male','Female'))

-- DATE/TIME TYPES
-- DATE: Stores date only (YYYY-MM-DD)
-- TIME: Stores time only (HH:MM:SS)
-- DATETIME: Stores both date and time (YYYY-MM-DD HH:MM:SS)
-- TIMESTAMP: Like DATETIME but auto-updates on modification

-- BOOLEAN TYPE
-- BOOLEAN/BOOL: TRUE or FALSE (stored as TINYINT(1) in MySQL)

-- Example table demonstrating all data types
CREATE TABLE DataTypeExamples (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Numeric
    age INT,
    salary DECIMAL(10,2),
    rating FLOAT,
    -- String
    first_name VARCHAR(50),
    country_code CHAR(2),
    bio TEXT,
    gender ENUM('Male', 'Female', 'Other'),
    -- Date/Time
    birth_date DATE,
    login_time TIME,
    created_at DATETIME,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Boolean
    is_active BOOLEAN DEFAULT TRUE
);

-- Insert sample data
INSERT INTO DataTypeExamples
(age, salary, rating, first_name, country_code, bio, gender, birth_date, login_time, created_at)
VALUES
(25, 80000.50, 4.5, 'Rishit', 'IN', 'Software Engineer from India', 'Male', '2000-05-15', '09:30:00', NOW());

-- Query to see the data
SELECT * FROM DataTypeExamples;

-- Useful type conversion functions
SELECT CAST(Salary AS CHAR) AS SalaryAsString FROM EmployeeSalary;
SELECT CONVERT(Salary, DECIMAL(10,2)) AS SalaryConverted FROM EmployeeSalary;
