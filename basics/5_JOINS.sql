-- =====================================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- =====================================================================

-- =====================================================================
-- 📘 INTRODUCTION TO SQL JOINS
-- =====================================================================
-- In SQL, JOINs are used to combine rows from two or more tables 
-- based on a related column between them.

-- 🧠 Think of JOINS as a way to answer questions like:
-- "Which employees belong to which department?"
-- "Which products have not been sold?"

-- SQL provides different types of JOINs to handle different scenarios 
-- when linking data across tables.

-- 🔗 TYPES OF JOINS IN SQL

-- 1. INNER JOIN
--    Returns only the rows that have matching values in both tables.
--    🟢 Returns only matched rows.

-- 2. OUTER JOIN (also called EXTERNAL JOIN)
--    Returns matched rows, plus unmatched rows from one or both tables.
--    Subtypes:
--      a. LEFT OUTER JOIN (LEFT JOIN)
--         All rows from the left + matched from right. NULL if no match.
--      b. RIGHT OUTER JOIN (RIGHT JOIN)
--         All rows from the right + matched from left. NULL if no match.
--      c. FULL OUTER JOIN
--         All rows from both tables. NULLs where there is no match.

-- 3. SELF JOIN
--    A table joined with itself.
--    🟢 Used for hierarchy, pairing, or internal relationships.

-- 4. CROSS JOIN
--    Returns all combinations of rows between two tables.
--    🟢 Used when you want all combinations.

-- Summary:
-- +--------------------+-----------------------------------------+----------+-------------+
-- | Join Type          | Description                             | Matched? | Unmatched?  |
-- +--------------------+-----------------------------------------+----------+-------------+
-- | INNER JOIN         | Only matched rows from both tables      | ✅       | ❌          |
-- | LEFT OUTER JOIN    | All from left + matched from right      | ✅       | Left only   |
-- | RIGHT OUTER JOIN   | All from right + matched from left      | ✅       | Right only  |
-- | FULL OUTER JOIN    | All rows from both tables               | ✅       | Both sides  |
-- | SELF JOIN          | Join a table to itself                  | ✅       | ❌          |
-- | CROSS JOIN         | All combinations of rows                | ❌       | All rows    |
-- +--------------------+-----------------------------------------+----------+-------------+

-- =====================================================================
-- 🏗️ STEP 1: CREATE TABLES
-- =====================================================================

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE,
    Salary DECIMAL(10, 2),
    DeptID INT
);

-- =====================================================================
-- 📦 STEP 2: INSERT DATA
-- =====================================================================

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(1, 'Human Resources', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Finance', 'Chicago'),
(4, 'Marketing', 'Seattle');

INSERT INTO Employees (EmpID, EmpName, Email, JoinDate, Salary, DeptID) VALUES
(101, 'Alice Johnson', 'alice@example.com', '2020-01-15', 70000.00, 1),
(102, 'Bob Smith', 'bob@example.com', '2019-03-10', 68000.00, 1),
(103, 'Charlie Brown', 'charlie@example.com', '2021-06-23', 72000.00, 2),
(104, 'David Lee', 'david@example.com', '2022-09-30', 69000.00, NULL),
(105, 'Eva Green', 'eva@example.com', '2021-11-11', 71000.00, 5);

-- =====================================================================
-- 🔗 1. INNER JOIN: Only Employees with valid Departments
-- =====================================================================

SELECT 
    e.EmpID,
    e.EmpName,
    e.Email,
    e.Salary,
    d.DeptName,
    d.Location
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

-- 📋 Output:
-- +--------+---------------+-------------------+--------+------------------+---------------+
-- | EmpID  | EmpName       | Email             | Salary | DeptName         | Location      |
-- +--------+---------------+-------------------+--------+------------------+---------------+
-- | 101    | Alice Johnson | alice@example.com | 70000  | Human Resources  | New York      |
-- | 102    | Bob Smith     | bob@example.com   | 68000  | Human Resources  | New York      |
-- | 103    | Charlie Brown | charlie@example.com | 72000 | IT              | San Francisco |
-- +--------+---------------+-------------------+--------+------------------+---------------+

-- =====================================================================
-- 🔗 2. LEFT OUTER JOIN: All Employees (even without valid departments)
-- =====================================================================

SELECT 
    e.EmpID,
    e.EmpName,
    e.Email,
    e.Salary,
    d.DeptName,
    d.Location
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;

-- 📋 Output:
-- +--------+---------------+-------------------+--------+------------------+---------------+
-- | EmpID  | EmpName       | Email             | Salary | DeptName         | Location      |
-- +--------+---------------+-------------------+--------+------------------+---------------+
-- | 101    | Alice Johnson | alice@example.com | 70000  | Human Resources  | New York      |
-- | 102    | Bob Smith     | bob@example.com   | 68000  | Human Resources  | New York      |
-- | 103    | Charlie Brown | charlie@example.com | 72000 | IT              | San Francisco |
-- | 104    | David Lee     | david@example.com | 69000  | NULL             | NULL          |
-- | 105    | Eva Green     | eva@example.com   | 71000  | NULL             | NULL          |
-- +--------+---------------+-------------------+--------+------------------+---------------+

-- =====================================================================
-- 🔗 3. RIGHT OUTER JOIN: All Departments (even without employees)
-- =====================================================================

SELECT 
    e.EmpName,
    d.DeptName,
    d.Location
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;

-- 📋 Output:
-- +---------------+------------------+---------------+
-- | EmpName       | DeptName         | Location      |
-- +---------------+------------------+---------------+
-- | Alice Johnson | Human Resources  | New York      |
-- | Bob Smith     | Human Resources  | New York      |
-- | Charlie Brown | IT               | San Francisco |
-- | NULL          | Finance          | Chicago       |
-- | NULL          | Marketing        | Seattle       |
-- +---------------+------------------+---------------+

-- =====================================================================
-- 🔗 4. FULL OUTER JOIN: Combine both even if unmatched
-- =====================================================================
-- ⚠️ Not supported natively in MySQL — workaround needed

SELECT 
    e.EmpName,
    d.DeptName,
    d.Location
FROM Employees e
FULL OUTER JOIN Departments d ON e.DeptID = d.DeptID;

-- 📋 Output (if supported):
-- +---------------+------------------+---------------+
-- | EmpName       | DeptName         | Location      |
-- +---------------+------------------+---------------+
-- | Alice Johnson | Human Resources  | New York      |
-- | Bob Smith     | Human Resources  | New York      |
-- | Charlie Brown | IT               | San Francisco |
-- | David Lee     | NULL             | NULL          |
-- | Eva Green     | NULL             | NULL          |
-- | NULL          | Finance          | Chicago       |
-- | NULL          | Marketing        | Seattle       |
-- +---------------+------------------+---------------+

-- =====================================================================
-- 🔁 5. SELF JOIN: Employees with colleagues in the same department
-- =====================================================================

SELECT 
    E1.EmpName AS Employee,
    E2.EmpName AS Colleague,
    D.DeptName
FROM Employees E1
JOIN Employees E2 ON E1.DeptID = E2.DeptID AND E1.EmpID < E2.EmpID
JOIN Departments D ON E1.DeptID = D.DeptID;

-- 📋 Output:
-- +---------------+-----------+------------------+
-- | Employee      | Colleague | DeptName         |
-- +---------------+-----------+------------------+
-- | Alice Johnson | Bob Smith | Human Resources  |
-- +---------------+-----------+------------------+

-- =====================================================================
-- 🔀 6. CROSS JOIN: All Employee–Department combinations
-- =====================================================================

SELECT 
    e.EmpName,
    d.DeptName
FROM Employees e
CROSS JOIN Departments d;

-- 📋 Output (first few rows):
-- +---------------+------------------+
-- | EmpName       | DeptName         |
-- +---------------+------------------+
-- | Alice Johnson | Human Resources  |
-- | Alice Johnson | IT               |
-- | Alice Johnson | Finance          |
-- | Alice Johnson | Marketing        |
-- | Bob Smith     | Human Resources  |
-- +---------------+------------------+

-- =====================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- =====================================================================
