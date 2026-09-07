-- ============================================================
-- PARTITION BY
-- ============================================================
-- PARTITION BY divides result set into partitions and performs
-- calculations on each partition independently.
-- Used with window functions: ROW_NUMBER, RANK, DENSE_RANK, SUM, AVG, etc.
-- Unlike GROUP BY, it does NOT collapse rows - it adds a column with the result.

-- ROW_NUMBER: Assigns unique sequential number within each partition
SELECT EmployeeID, FirstName, LastName, Salary,
    ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY Salary DESC) AS RowNum
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- RANK: Assigns rank with gaps for ties (e.g., 1, 2, 2, 4)
SELECT EmployeeID, FirstName, LastName, Salary,
    RANK() OVER (PARTITION BY Gender ORDER BY Salary DESC) AS RankNum
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- DENSE_RANK: Like RANK but no gaps (e.g., 1, 2, 2, 3)
SELECT EmployeeID, FirstName, LastName, Salary,
    DENSE_RANK() OVER (PARTITION BY Gender ORDER BY Salary DESC) AS DenseRankNum
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Running total within each partition
SELECT EmployeeID, FirstName, LastName, Salary,
    SUM(Salary) OVER (PARTITION BY Gender ORDER BY EmployeeID) AS RunningTotal
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Average salary within each gender partition
SELECT EmployeeID, FirstName, LastName, Salary, Gender,
    AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalaryInGender
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;

-- Difference from average within each partition
SELECT EmployeeID, FirstName, LastName, Salary, Gender,
    Salary - AVG(Salary) OVER (PARTITION BY Gender) AS DiffFromAvg
FROM EmployeeDemographics ed
INNER JOIN EmployeeSalary es ON ed.EmployeeID = es.EmployeeID;
