-- =====================================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- =====================================================================

-- =====================================================================
-- 📘 INTRODUCTION TO SQL SET OPERATORS
-- =====================================================================
-- SQL Set Operators allow combining results from two or more SELECT queries.
-- The SELECT statements must have:
-- ➤ Same number of columns
-- ➤ Compatible data types
-- ➤ Same column order

-- 🔗 TYPES OF SET OPERATORS:

-- 1. UNION
--    Combines both queries and removes duplicates.

-- 2. UNION ALL
--    Combines both queries and keeps duplicates.

-- 3. INTERSECT
--    Returns only the common rows between both queries.

-- 4. EXCEPT (aka MINUS in Oracle)
--    Returns rows from the first query that do NOT exist in the second.

-- +-------------+-----------------------------------------------+
-- | Operator    | Description                                   |
-- +-------------+-----------------------------------------------+
-- | UNION       | Combines and removes duplicates               |
-- | UNION ALL   | Combines all, includes duplicates             |
-- | INTERSECT   | Only rows present in both SELECT results      |
-- | EXCEPT      | Rows in 1st SELECT but not in 2nd             |
-- +-------------+-----------------------------------------------+

-- =====================================================================
-- 🏗️ STEP 1: CREATE SAMPLE TABLES
-- =====================================================================

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Scholarships;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Scholarships (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- =====================================================================
-- 📦 STEP 2: INSERT SAMPLE DATA
-- =====================================================================

INSERT INTO Students (StudentID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva');

INSERT INTO Scholarships (StudentID, Name) VALUES
(3, 'Charlie'),
(4, 'David'),
(6, 'Frank'),
(7, 'Grace');

-- =====================================================================
-- 🔗 1. UNION: Combine results and remove duplicates
-- =====================================================================

SELECT Name FROM Students
UNION
SELECT Name FROM Scholarships;

-- 📋 Example Output:

-- +---------+
-- | Name    |
-- +---------+
-- | Alice   |
-- | Bob     |
-- | Charlie |
-- | David   |
-- | Eva     |
-- | Frank   |
-- | Grace   |
-- +---------+

-- =====================================================================
-- 🔗 2. UNION ALL: Combine results including duplicates
-- =====================================================================

SELECT Name FROM Students
UNION ALL
SELECT Name FROM Scholarships;

-- 📋 Example Output:

-- +---------+
-- | Name    |
-- +---------+
-- | Alice   |
-- | Bob     |
-- | Charlie |
-- | David   |
-- | Eva     |
-- | Charlie |
-- | David   |
-- | Frank   |
-- | Grace   |
-- +---------+

-- =====================================================================
-- 🔗 3. INTERSECT: Return rows common to both queries
-- =====================================================================
-- ⚠️ Not supported in MySQL (use INNER JOIN instead)

SELECT Name FROM Students
INTERSECT
SELECT Name FROM Scholarships;

-- 📋 Example Output:

-- +---------+
-- | Name    |
-- +---------+
-- | Charlie |
-- | David   |
-- +---------+

-- =====================================================================
-- 🔗 4. EXCEPT: Return rows in first SELECT but not in second
-- =====================================================================
-- ⚠️ In Oracle use: MINUS instead of EXCEPT

SELECT Name FROM Students
EXCEPT
SELECT Name FROM Scholarships;

-- 📋 Example Output:

-- +--------+
-- | Name   |
-- +--------+
-- | Alice  |
-- | Bob    |
-- | Eva    |
-- +--------+

-- =====================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- =====================================================================
