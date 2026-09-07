-- ============================================================
-- IMPORTING DATA FROM DIFFERENT FILE TYPES/SOURCES
-- ============================================================
-- Different databases support different methods to import data.

-- MySQL: LOAD DATA INFILE (most common for CSV)
-- LOAD DATA INFILE '/path/to/file.csv'
-- INTO TABLE EmployeeDemographics
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;  -- Skip header row

-- MySQL: Import from another database
-- INSERT INTO target_table
-- SELECT * FROM source_database.source_table;

-- MySQL: Import using mysql command line
-- mysql -u username -p database_name < import_file.sql

-- MySQL: Import CSV with phpMyAdmin
-- 1. Select database
-- 2. Click Import tab
-- 3. Choose CSV file
-- 4. Set format options
-- 5. Click Go

-- SQL Server: BULK INSERT
-- BULK INSERT EmployeeDemographics
-- FROM 'C:\data\employees.csv'
-- WITH (
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n',
--     FIRSTROW = 2,              -- Skip header
--     CODEPAGE = '65001'         -- UTF-8 encoding
-- );

-- SQL Server: Import from Excel using OPENROWSET
-- SELECT * INTO EmployeeDemographics
-- FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--     'Excel 12.0;Database=C:\data\employees.xlsx',
--     'SELECT * FROM [Sheet1$]');

-- PostgreSQL: COPY command
-- COPY EmployeeDemographics FROM '/path/to/employees.csv'
-- DELIMITER ',' CSV HEADER;

-- PostgreSQL: pgAdmin import
-- 1. Right-click table
-- 2. Select "Import/Export"
-- 3. Choose file and format
-- 4. Click OK

-- General: INSERT with VALUES (manual entry)
-- INSERT INTO EmployeeDemographics VALUES
-- (1001, 'John', 'Doe', 25, 'Male'),
-- (1002, 'Jane', 'Smith', 30, 'Female');

-- File formats supported:
-- CSV: Comma-Separated Values (most common)
-- TSV: Tab-Separated Values
-- JSON: JavaScript Object Notation
-- XML: Extensible Markup Language
-- Excel: .xlsx, .xls files
-- SQL: SQL dump files
