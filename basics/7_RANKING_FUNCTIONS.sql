-- =====================================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- =====================================================================

-- =====================================================================
-- 📘 INTRODUCTION TO SQL RANKING FUNCTIONS
-- =====================================================================
-- Ranking functions assign a number (rank or group) to rows based on a specified order.
-- These are evaluated using the OVER() clause and optionally PARTITION BY to group logic.

-- 🔗 TYPES OF RANKING FUNCTIONS:

-- 1. ROW_NUMBER()
--    Unique number for each row (no ties).

-- 2. RANK()
--    Ties share the same rank; skips next ranks.

-- 3. DENSE_RANK()
--    Ties share the same rank; NO skipped ranks.

-- 4. NTILE(n)
--    Divides rows into n equal (or near equal) groups (tiles).

-- =====================================================================
-- 🏗️ STEP 1: CREATE SAMPLE TABLE
-- =====================================================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

-- =====================================================================
-- 📦 STEP 2: INSERT SAMPLE DATA
-- =====================================================================

INSERT INTO Employees
    (EmpID, Name, Department, Salary)
VALUES
    (1, 'Alice', 'HR', 5000),
    (2, 'Bob', 'HR', 5000),
    (3, 'Charlie', 'HR', 4500),
    (4, 'David', 'IT', 7000),
    (5, 'Eva', 'IT', 7000),
    (6, 'Frank', 'IT', 6500),
    (7, 'Grace', 'Finance', 6000),
    (8, 'Henry', 'Finance', 6000),
    (9, 'Isla', 'Finance', 5800),
    (10, 'Jack', 'Finance', 5800);

-- =====================================================================
-- 🔢 1. ROW_NUMBER(): Unique row number by Salary DESC per Department
-- =====================================================================

SELECT
    Department,
    Name,
    Salary,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RowNum
FROM Employees;

-- 📋 Example Output (Top 5 rows):

-- +------------+--------+--------+---------+
-- | Department | Name   | Salary | RowNum  |
-- +------------+--------+--------+---------+
-- | HR         | Alice  | 5000   | 1       |
-- | HR         | Bob    | 5000   | 2       |
-- | HR         | Charlie| 4500   | 3       |
-- | IT         | David  | 7000   | 1       |
-- | IT         | Eva    | 7000   | 2       |
-- +------------+--------+--------+---------+

-- =====================================================================
-- 🔢 2. RANK(): Assigns same rank for ties, skips next rank(s)
-- =====================================================================

SELECT
    Department,
    Name,
    Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankNum
FROM Employees;

-- 📋 Example Output (Top 5 rows):

-- +------------+--------+--------+---------+
-- | Department | Name   | Salary | RankNum |
-- +------------+--------+--------+---------+
-- | HR         | Alice  | 5000   | 1       |
-- | HR         | Bob    | 5000   | 1       |
-- | HR         | Charlie| 4500   | 3       |
-- | IT         | David  | 7000   | 1       |
-- | IT         | Eva    | 7000   | 1       |
-- +------------+--------+--------+---------+

-- =====================================================================
-- 🔢 3. DENSE_RANK(): Same as RANK but without skipping
-- =====================================================================

SELECT
    Department,
    Name,
    Salary,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DenseRankNum
FROM Employees;

-- 📋 Example Output (Top 5 rows):

-- +------------+--------+--------+--------------+
-- | Department | Name   | Salary | DenseRankNum |
-- +------------+--------+--------+--------------+
-- | HR         | Alice  | 5000   | 1            |
-- | HR         | Bob    | 5000   | 1            |
-- | HR         | Charlie| 4500   | 2            |
-- | IT         | David  | 7000   | 1            |
-- | IT         | Eva    | 7000   | 1            |
-- +------------+--------+--------+--------------+

-- =====================================================================
-- 🔢 4. NTILE(3): Divide into 3 groups by Salary DESC within Department
-- =====================================================================

SELECT
    Department,
    Name,
    Salary,
    NTILE(3) OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryTile
FROM Employees;

-- 📋 Example Output (Top 5 rows):

-- +------------+--------+--------+-------------+
-- | Department | Name   | Salary | SalaryTile  |
-- +------------+--------+--------+-------------+
-- | HR         | Alice  | 5000   | 1           |
-- | HR         | Bob    | 5000   | 2           |
-- | HR         | Charlie| 4500   | 3           |
-- | IT         | David  | 7000   | 1           |
-- | IT         | Eva    | 7000   | 2           |
-- +------------+--------+--------+-------------+

-- =====================================================================
-- 🎉 THANK YOU 
-- =====================================================================
