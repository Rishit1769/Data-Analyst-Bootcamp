-- ============================================================
-- EXPORTING DATA TO DIFFERENT FILE TYPES
-- ============================================================
-- Different databases support different methods to export data.

-- MySQL: SELECT INTO OUTFILE (CSV export)
-- SELECT * FROM EmployeeDemographics
-- INTO OUTFILE '/path/to/employees.csv'
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- MySQL: Export with custom formatting
-- SELECT
--     CONCAT(FirstName, ' ', LastName) AS FullName,
--     Salary
-- FROM EmployeeDemographics ed
-- INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID
-- INTO OUTFILE '/path/to/employee_report.csv'
-- FIELDS TERMINATED BY '\t'      -- Tab separated
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';

-- MySQL: Export using mysqldump (whole database)
-- mysqldump -u username -p SQLTutorials > backup.sql

-- MySQL: Export specific tables
-- mysqldump -u username -p SQLTutorials EmployeeDemographics EmployeeSalary > tables_backup.sql

-- SQL Server: bcp utility (command line)
-- bcp "SELECT * FROM SQLTutorials.dbo.EmployeeDemographics" queryout
-- C:\output\employees.csv -c -t, -T -S server_name

-- SQL Server: Export to Excel using SSIS
-- 1. Open SQL Server Data Tools
-- 2. Create Integration Services project
-- 3. Add Data Flow Task
-- 4. Use OLE DB Source and Excel Destination

-- PostgreSQL: COPY TO command
-- COPY EmployeeDemographics TO '/path/to/employees.csv'
-- DELIMITER ',' CSV HEADER;

-- PostgreSQL: Export with psql command line
-- \copy (SELECT * FROM EmployeeDemographics) TO 'employees.csv' CSV HEADER

-- Export query results to different formats:
-- 1. CSV: Most common, opens in Excel
-- 2. JSON: SELECT JSON_ARRAYAGG(JSON_OBJECT('key', value)) FROM table;
-- 3. XML: SELECT * FROM table FOR XML AUTO;
-- 4. HTML: Some databases support direct HTML export

-- Verify export file exists (MySQL)
-- SHOW VARIABLES LIKE 'secure_file_priv';  -- Shows allowed export directory
