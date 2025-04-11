-- =====================================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- =====================================================================

-- ========================================================================
-- 📘 COMPLETE SQL CTE (COMMON TABLE EXPRESSION) EXAMPLES
-- ========================================================================

-- 🔹 A CTE is a temporary result set that you can reference within a query.
-- 🔹 It helps break complex logic into readable chunks and enables recursion.

-- ========================================================================
-- 🏗️ STEP 1: DROP & CREATE SAMPLE TABLE
-- ========================================================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    ManagerID INT
);

-- ========================================================================
-- 📦 STEP 2: INSERT SAMPLE DATA
-- ========================================================================

INSERT INTO Employees (EmpID, EmpName, ManagerID) VALUES
(1, 'Alice Johnson', NULL),
(2, 'Bob Smith', 1),
(3, 'Charlie Brown', 1),
(4, 'David Lee', 2),
(5, 'Eva Green', 3);

-- ========================================================================
-- 🔍 Example 1: Simple CTE — List Top-Level Managers
-- ========================================================================

WITH TopManagers AS (
    SELECT EmpID, EmpName
    FROM Employees
    WHERE ManagerID IS NULL
)
SELECT * FROM TopManagers;

-- 📋 Output:
-- +--------+---------------+
-- | EmpID  | EmpName       |
-- +--------+---------------+
-- | 1      | Alice Johnson |
-- +--------+---------------+

-- ========================================================================
-- 🔁 Example 2: CTE with JOIN — Employees and Their Managers
-- ========================================================================

WITH EmpWithManagers AS (
    SELECT 
        e.EmpID,
        e.EmpName,
        m.EmpName AS ManagerName
    FROM Employees e
    LEFT JOIN Employees m ON e.ManagerID = m.EmpID
)
SELECT * FROM EmpWithManagers;

-- 📋 Output:
-- +--------+---------------+----------------+
-- | EmpID  | EmpName       | ManagerName    |
-- +--------+---------------+----------------+
-- | 1      | Alice Johnson | NULL           |
-- | 2      | Bob Smith     | Alice Johnson  |
-- | 3      | Charlie Brown | Alice Johnson  |
-- | 4      | David Lee     | Bob Smith      |
-- | 5      | Eva Green     | Charlie Brown  |
-- +--------+---------------+----------------+

-- =====================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- =====================================================================
