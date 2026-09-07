-- ============================================================
-- SYS TABLES (System Tables)
-- ============================================================
-- System tables contain metadata about the database.
-- They store information about tables, columns, indexes, users, etc.
-- Different databases use different system table names.

-- MySQL: Show all databases
SHOW DATABASES;

-- MySQL: Show all tables in current database
SHOW TABLES;

-- MySQL: Describe table structure (columns, types, keys)
DESCRIBE EmployeeDemographics;
DESC EmployeeDemographics;  -- Short form

-- MySQL: Show detailed table status
SHOW TABLE STATUS LIKE 'EmployeeDemographics';

-- MySQL: Show create table statement (see full table definition)
SHOW CREATE TABLE EmployeeDemographics;
SHOW CREATE TABLE EmployeeSalary;

-- MySQL: Show columns with full details using INFORMATION_SCHEMA
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'SQLTutorials'
AND TABLE_NAME = 'EmployeeDemographics';

-- MySQL: Show all tables in a specific database
SELECT TABLE_NAME, TABLE_TYPE, ENGINE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'SQLTutorials';

-- MySQL: Show indexes for a table
SHOW INDEX FROM EmployeeDemographics;

-- MySQL: Show database size
SELECT
    table_name AS 'Table',
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS 'Size (MB)'
FROM information_schema.TABLES
WHERE table_schema = 'SQLTutorials';

-- SQL Server equivalents (for reference):
-- SELECT * FROM sys.tables;                    -- List all tables
-- SELECT * FROM sys.columns;                   -- List all columns
-- SELECT * FROM sys.indexes;                   -- List all indexes
-- SELECT * FROM sys.objects;                   -- List all objects
-- SELECT * FROM sys.databases;                 -- List all databases

-- PostgreSQL equivalents (for reference):
-- SELECT * FROM information_schema.tables;
-- SELECT * FROM information_schema.columns;
-- SELECT * FROM pg_catalog.pg_tables;
