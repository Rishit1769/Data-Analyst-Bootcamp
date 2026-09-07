-- ============================================================
-- REGULAR EXPRESSIONS
-- ============================================================
-- Regular expressions (regex) allow advanced pattern matching.
-- MySQL uses REGEXP or RLIKE operator.
-- Different databases have different regex support.

-- MySQL: Basic REGEXP matching
-- Find employees with names starting with 'R'
SELECT FirstName, LastName
FROM EmployeeDemographics
WHERE FirstName REGEXP '^R';

-- Find employees with names ending with 'a'
SELECT FirstName
FROM EmployeeDemographics
WHERE FirstName REGEXP 'a$';

-- Find employees with names containing 'an'
SELECT FirstName, LastName
FROM EmployeeDemographics
WHERE FirstName REGEXP 'an';

-- Find employees with names containing only letters
SELECT FirstName
FROM EmployeeDemographics
WHERE FirstName REGEXP '^[a-zA-Z]+$';

-- Find employees with exactly 5 characters in first name
SELECT FirstName
FROM EmployeeDemographics
WHERE FirstName REGEXP '^.{5}$';

-- Find employees with names starting with vowel
SELECT FirstName
FROM EmployeeDemographics
WHERE FirstName REGEXP '^[AEIOUaeiou]';

-- Email validation pattern (basic)
SELECT FirstName, LastName
FROM EmployeeDemographics
WHERE CONCAT(LOWER(FirstName), '.', LOWER(LastName), '@company.com')
REGEXP '^[a-z]+\.[a-z]+@[a-z]+\.[a-z]+$';

-- MySQL REGEXP patterns:
-- ^     Start of string
-- $     End of string
-- .     Any single character
-- *     Zero or more occurrences
-- +     One or more occurrences
-- ?     Zero or one occurrence
-- []    Character set
-- [^]   Negated character set
-- |     OR
-- ()    Grouping
-- {n}   Exactly n occurrences
-- {n,m} Between n and m occurrences

-- Find employees with special characters in name (none in our data, but example)
-- SELECT FirstName FROM EmployeeDemographics WHERE FirstName REGEXP '[^a-zA-Z]';

-- Practical: Find names with double letters
SELECT FirstName
FROM EmployeeDemographics
WHERE FirstName REGEXP '(.)\\1';
