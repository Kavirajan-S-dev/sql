-- =====================================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- =====================================================================

-- ============================================================================
-- 📘 FULLY ORGANIZED SQL CODE STRUCTURE: VIEW CONCEPT
-- ============================================================================
-- 🔹 A VIEW is a virtual table based on the result of a SELECT query.
-- 🔹 It does not store data itself; it reflects data from underlying tables.
-- 🔹 Useful for abstraction, simplification, and security.
-- ============================================================================

-- ============================================================================
-- 🧱 STEP 1: CREATE BASE TABLE
-- ============================================================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Department VARCHAR(50),
    JoinDate DATE,
    Salary DECIMAL(10,2)
);

-- ============================================================================
-- 📥 STEP 2: INSERT SAMPLE DATA INTO BASE TABLE
-- ============================================================================

INSERT INTO Employees
    (EmpID, EmpName, Email, Department, JoinDate, Salary)
VALUES
    (1, 'Alice Johnson', 'alice@example.com', 'HR', '2020-01-15', 70000.00),
    (2, 'Bob Smith', 'bob@example.com', 'Finance', '2019-03-10', 68000.00),
    (3, 'Charlie Brown', 'charlie@example.com', 'IT', '2021-06-23', 72000.00),
    (4, 'David Lee', 'david@example.com', 'IT', '2022-09-30', 69000.00),
    (5, 'Eva Green', 'eva@example.com', 'Marketing', '2021-11-11', 71000.00);


-- ============================================================================
-- 👁️ STEP 3: CREATE A VIEW — ONLY IT DEPARTMENT EMPLOYEES
-- ============================================================================

CREATE VIEW View_IT_Employees
AS
    SELECT EmpID, EmpName, Department, Salary
    FROM Employees
    WHERE Department = 'IT';


-- ============================================================================
-- 🔎 STEP 4: SELECT FROM THE VIEW
-- ============================================================================

SELECT *
FROM View_IT_Employees;

-- 📋 Expected Output:
-- +--------+---------------+------------+----------+
-- | EmpID  | EmpName       | Department | Salary   |
-- +--------+---------------+------------+----------+
-- | 3      | Charlie Brown | IT         | 72000.00 |
-- | 4      | David Lee     | IT         | 69000.00 |
-- +--------+---------------+------------+----------+


-- ============================================================================
-- ✏️ STEP 5: UPDATE DATA THROUGH VIEW (if allowed)
-- ============================================================================

-- ✅ Only allowed if the view is based on one table and contains no aggregates.
UPDATE View_IT_Employees
SET Salary = Salary + 2000
WHERE EmpID = 4;


-- 🔁 Check view and base table again:
SELECT *
FROM View_IT_Employees;

SELECT *
FROM Employees
WHERE EmpID = 4;

-- 📋 Output after update:
-- +--------+-----------+------------+----------+
-- | EmpID  | EmpName   | Department | Salary   |
-- +--------+-----------+------------+----------+
-- | 4      | David Lee | IT         | 71000.00 |
-- +--------+-----------+------------+----------+


-- ============================================================================
-- 🧹 STEP 6: DROP THE VIEW (If needed)
-- ============================================================================

DROP VIEW IF EXISTS View_IT_Employees;


-- ============================================================================
-- 🎉 THANK YOU
-- ============================================================================
