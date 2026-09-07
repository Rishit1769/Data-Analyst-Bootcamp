-- ============================================================
-- STRING FUNCTIONS
-- ============================================================
-- String functions manipulate and transform text data.
-- Essential for data cleaning and formatting.

-- TRIM: Removes leading AND trailing spaces
SELECT TRIM('   Hello World   ') AS Trimmed;
-- Output: 'Hello World'

-- LTRIM: Removes leading (left) spaces only
SELECT LTRIM('   Hello World') AS LeftTrimmed;
-- Output: 'Hello World'

-- RTRIM: Removes trailing (right) spaces only
SELECT RTRIM('Hello World   ') AS RightTrimmed;
-- Output: 'Hello World'

-- REPLACE: Replace all occurrences of a substring
SELECT REPLACE('Hello World', 'World', 'SQL') AS Replaced;
-- Output: 'Hello SQL'

-- SUBSTRING/SUBSTR: Extract part of a string
-- SUBSTRING(string, start_position, length)
SELECT SUBSTRING('Hello World', 1, 5) AS Extracted;
-- Output: 'Hello'

SELECT SUBSTRING('Hello World', 7) AS FromPosition;
-- Output: 'World'

-- UPPER: Convert entire string to uppercase
SELECT UPPER('hello world') AS UpperCase;
-- Output: 'HELLO WORLD'

-- LOWER: Convert entire string to lowercase
SELECT LOWER('HELLO WORLD') AS LowerCase;
-- Output: 'hello world'

-- LENGTH/LEN: Get the length of a string
SELECT LENGTH('Hello World') AS StringLength;
-- Output: 11

-- CONCAT: Combine multiple strings
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM EmployeeDemographics;

-- CONCAT_WS: Concatenate with separator
SELECT CONCAT_WS(', ', FirstName, LastName, Gender) AS EmployeeInfo
FROM EmployeeDemographics;

-- LEFT: Extract characters from the left
SELECT LEFT('Hello World', 5) AS LeftPart;
-- Output: 'Hello'

-- RIGHT: Extract characters from the right
SELECT RIGHT('Hello World', 5) AS RightPart;
-- Output: 'World'

-- REVERSE: Reverse a string
SELECT REVERSE('Hello') AS Reversed;
-- Output: 'olleH'

-- REPEAT: Repeat a string
SELECT REPEAT('Ha', 3) AS Repeated;
-- Output: 'HaHaHa'

-- LPAD/RPAD: Left/Right pad with characters
SELECT LPAD('42', 5, '0') AS LeftPadded;
-- Output: '00042'

SELECT RPAD('Hi', 5, '!') AS RightPadded;
-- Output: 'Hi!!!'

-- Practical example: Clean and format employee data
SELECT
    UPPER(FirstName) AS UpperFirst,
    LOWER(LastName) AS LowerLast,
    CONCAT(UPPER(LEFT(FirstName,1)), LOWER(SUBSTRING(FirstName,2))) AS ProperFirst,
    LENGTH(FirstName) AS NameLength
FROM EmployeeDemographics;
