# Data Analyst Bootcamp

This repository is a practical SQL learning track focused on real-world data analysis concepts using MySQL-style syntax. It contains a set of SQL scripts that progressively build from foundational querying to advanced database concepts such as views, CTEs, window functions, stored procedures, and data import/export.

The project uses a sample database called `SQLTutorials` with two core tables:

- `EmployeeDemographics`
- `EmployeeSalary`

These tables are created and populated in [SQL/db.sql](SQL/db.sql), and the remaining scripts build on top of that dataset.

## Repository Structure

- [SQL/db.sql](SQL/db.sql) — creates the database, tables, and sample employee records
- [SQL/01_joins.sql](SQL/01_joins.sql) — INNER, LEFT, RIGHT, FULL OUTER, and CROSS joins
- [SQL/02_unions.sql](SQL/02_unions.sql) — UNION and UNION ALL examples
- [SQL/03_case_statements.sql](SQL/03_case_statements.sql) — conditional logic using CASE
- [SQL/04_updating_deleting.sql](SQL/04_updating_deleting.sql) — UPDATE and DELETE operations
- [SQL/05_partition_by.sql](SQL/05_partition_by.sql) — window functions and partitioning
- [SQL/06_data_types.sql](SQL/06_data_types.sql) — common SQL data types and examples
- [SQL/07_aliasing.sql](SQL/07_aliasing.sql) — column and table aliasing
- [SQL/08_creating_views.sql](SQL/08_creating_views.sql) — view creation and usage
- [SQL/09_having_vs_group_by.sql](SQL/09_having_vs_group_by.sql) — GROUP BY vs HAVING
- [SQL/10_getdate.sql](SQL/10_getdate.sql) — date and time functions (`NOW`, `CURDATE`, `DATE_ADD`, etc.)
- [SQL/11_primary_key_foreign_key.sql](SQL/11_primary_key_foreign_key.sql) — primary and foreign key concepts
- [SQL/12_ctes.sql](SQL/12_ctes.sql) — common table expressions and recursive CTEs
- [SQL/13_sys_tables.sql](SQL/13_sys_tables.sql) — metadata queries using system tables and INFORMATION_SCHEMA
- [SQL/14_subqueries.sql](SQL/14_subqueries.sql) — scalar, correlated, and derived-table subqueries
- [SQL/15_temp_tables.sql](SQL/15_temp_tables.sql) — temporary table creation and usage
- [SQL/16_string_functions.sql](SQL/16_string_functions.sql) — string cleaning and formatting functions
- [SQL/17_regular_expression.sql](SQL/17_regular_expression.sql) — regex pattern matching with MySQL `REGEXP`
- [SQL/18_stored_procedures.sql](SQL/18_stored_procedures.sql) — procedure creation, parameters, and conditional logic
- [SQL/19_importing_data.sql](SQL/19_importing_data.sql) — data import patterns for CSV, SQL, Excel, and other sources
- [SQL/20_exporting_data.sql](SQL/20_exporting_data.sql) — data export patterns and command examples

## Learning Path

A recommended progression is:

1. Run [SQL/db.sql](SQL/db.sql) to create the database and sample records.
2. Work through the scripts in numeric order.
3. Reuse the same employee dataset to practice the concepts in each file.
4. Finish with data management and database administration topics such as procedures, imports, and exports.

## Setup Instructions

### MySQL / MariaDB

Open a MySQL client and run the database initialization script:

```sql
SOURCE SQL/db.sql;
```

Or from the terminal:

```bash
mysql -u your_username -p < SQL/db.sql
```

Then open each lesson file one-by-one and execute the queries in your SQL client.

### Recommended Workflow

- Start with the core queries in [SQL/01_joins.sql](SQL/01_joins.sql) to [SQL/05_partition_by.sql](SQL/05_partition_by.sql).
- Move into aggregation and data shaping topics such as [SQL/06_data_types.sql](SQL/06_data_types.sql), [SQL/07_aliasing.sql](SQL/07_aliasing.sql), and [SQL/09_having_vs_group_by.sql](SQL/09_having_vs_group_by.sql).
- Practice data cleanup and string manipulation in [SQL/16_string_functions.sql](SQL/16_string_functions.sql) and [SQL/17_regular_expression.sql](SQL/17_regular_expression.sql).
- Explore intermediate and advanced database patterns in [SQL/12_ctes.sql](SQL/12_ctes.sql), [SQL/14_subqueries.sql](SQL/14_subqueries.sql), and [SQL/18_stored_procedures.sql](SQL/18_stored_procedures.sql).

## Database Schema

The sample database contains employee records with the following main fields:

### `EmployeeDemographics`

- `EmployeeID`
- `FirstName`
- `LastName`
- `Age`
- `Gender`

### `EmployeeSalary`

- `EmployeeID`
- `JobTitle`
- `Salary`

This schema is intentionally simple so each topic can focus on a single SQL concept without extra noise.

## Notes

- The repository is mostly MySQL-focused, but several scripts include comments showing how equivalent commands work in SQL Server or PostgreSQL.
- Some lesson files intentionally include modifications to data (for example, [SQL/04_updating_deleting.sql](SQL/04_updating_deleting.sql) and [SQL/18_stored_procedures.sql](SQL/18_stored_procedures.sql)). These are learning examples and may affect the state of the database if executed repeatedly.
- The project is designed as a hands-on SQL tutorial and is ideal for beginners to intermediate learners.

## Skills Covered

This curriculum covers:

- Joins and unions
- Data filtering and sorting
- Aggregation and grouping
- CASE logic
- Window functions and partitioning
- Data types and casting
- Views and temp tables
- Subqueries and CTEs
- Date functions
- String and regex handling
- Keys and referential integrity
- Stored procedures
- Data import/export workflows

## Goal

The goal of this repository is to provide a structured, practical foundation in SQL for data analysis and database operations, using a realistic employee dataset and step-by-step exercises.

## License

This project is intended for educational purposes and is not packaged as a production-ready application.

