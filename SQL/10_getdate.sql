-- ============================================================
-- GETDATE() and Date Functions
-- ============================================================
-- GETDATE() returns current date and time.
-- Different databases use different functions:
--   MySQL: NOW(), CURDATE(), CURTIME()
--   SQL Server: GETDATE()
--   PostgreSQL: CURRENT_TIMESTAMP, NOW()

-- Get current date and time (MySQL syntax)
SELECT NOW() AS CurrentDateTime;

-- Get current date only
SELECT CURDATE() AS CurrentDate;

-- Get current time only
SELECT CURTIME() AS CurrentTime;

-- Extract date components
SELECT
    YEAR(NOW()) AS CurrentYear,
    MONTH(NOW()) AS CurrentMonth,
    DAY(NOW()) AS CurrentDay,
    HOUR(NOW()) AS CurrentHour,
    MINUTE(NOW()) AS CurrentMinute,
    SECOND(NOW()) AS CurrentSecond;

-- Day of week and day of year
SELECT
    DAYOFWEEK(NOW()) AS DayOfWeek,      -- 1=Sunday, 7=Saturday
    DAYNAME(NOW()) AS DayName,           -- 'Monday', 'Tuesday', etc.
    DAYOFYEAR(NOW()) AS DayOfYear,       -- 1-366
    WEEK(NOW()) AS WeekNumber;           -- 0-53

-- Date formatting
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') AS FormattedDate;        -- 2026-09-08
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y') AS DateWithSlashes;      -- 08/09/2026
SELECT DATE_FORMAT(NOW(), '%W, %M %d, %Y') AS FullDate;        -- Monday, September 08, 2026

-- Date arithmetic
SELECT
    DATE_ADD(NOW(), INTERVAL 30 DAY) AS ThirtyDaysLater,
    DATE_SUB(NOW(), INTERVAL 30 DAY) AS ThirtyDaysAgo,
    DATE_ADD(NOW(), INTERVAL 1 MONTH) AS OneMonthLater,
    DATE_ADD(NOW(), INTERVAL 1 YEAR) AS OneYearLater;

-- Difference between dates
SELECT DATEDIFF('2026-12-31', NOW()) AS DaysUntilEndOfYear;

-- Practical example: Employees hired in last 365 days
-- (Would work if hire_date column existed)
-- SELECT FirstName, LastName, hire_date
-- FROM EmployeeDemographics
-- WHERE hire_date >= DATE_SUB(NOW(), INTERVAL 365 DAY);
