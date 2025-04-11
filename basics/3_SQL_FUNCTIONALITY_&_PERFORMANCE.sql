-- ===============================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- ===============================================================

-- ===============================================================
-- 📚 SECTION: INDEXING IN SQL
-- ===============================================================

-- 🔹 WHAT IS INDEXING?
-- Indexing is like a **table of contents** for a database.
-- It helps **speed up searching and data retrieval**, especially in large tables.

-- ➕ Example: Instead of scanning every row, an index lets SQL jump directly to what it needs.

-- 🧠 Indexes improve performance on:
-- - WHERE conditions
-- - JOIN operations
-- - ORDER BY and GROUP BY clauses

-- 🔸 TYPES OF INDEXES:
-- ---------------------------------------------------------------

-- 1️⃣ CLUSTERED INDEX
-- - Sorts the **actual table data** based on the index column.
-- - Only **one** clustered index per table.
-- - By default, PRIMARY KEY = clustered index.
CREATE TABLE employees
(
  empid INT PRIMARY KEY,
  -- 👆 Clustered index created automatically
  name VARCHAR(100),
  department VARCHAR(50)
);

-- 2️⃣ NON-CLUSTERED INDEX
-- - Creates a **separate structure** that points to the table rows.
-- - You can create **multiple** non-clustered indexes.
CREATE NONCLUSTERED INDEX idx_emp_name
  ON employees(name);

-- 3️⃣ UNIQUE INDEX
-- - Ensures column values are **unique** (no duplicates).
-- - Often used for emails, usernames, etc.
CREATE UNIQUE INDEX idx_unique_email
  ON employees(email);

-- 4️⃣ COMPOSITE INDEX (MULTI-COLUMN)
-- - Index on **two or more columns**.
-- - Helps with multi-column queries.
CREATE NONCLUSTERED INDEX idx_dept_name
  ON employees(department, name);

-- ✅ Tip: Use indexes **strategically** – too many can slow down inserts/updates.

-- ===============================================================


-- ===============================================================
-- 🔄 SECTION: CURSOR IN SQL
-- ===============================================================

-- 🔹 WHAT IS A CURSOR?
-- A **cursor** lets you process query results **row-by-row**.
-- Unlike typical SQL that works on sets, cursors are like **loops** in programming.

-- ⚠️ Use only when necessary — cursors can be **slow and resource-heavy**.

-- 🔸 WHEN TO USE CURSORS:
-- - When you must process rows **individually**
-- - For **row-wise operations** that can’t be done with JOINs or aggregates

-- 🔸 BASIC CURSOR STEPS:
-- ---------------------------------------------------------------
-- 1. DECLARE the cursor
-- 2. OPEN the cursor
-- 3. FETCH rows one by one
-- 4. PROCESS each row
-- 5. CLOSE the cursor
-- 6. DEALLOCATE the cursor

-- 🔸 EXAMPLE:
DECLARE @Name VARCHAR(100);

-- Step 1: Declare
DECLARE name_cursor CURSOR FOR
  SELECT name FROM students;

-- Step 2: Open
OPEN name_cursor;

-- Step 3: Fetch first
FETCH NEXT FROM name_cursor INTO @Name;

-- Step 4: Loop through rows
WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT 'Student Name: ' + @Name;
  FETCH NEXT FROM name_cursor INTO @Name;
END;

-- Step 5: Close
CLOSE name_cursor;

-- Step 6: Deallocate
DEALLOCATE name_cursor;

-- ⚠️ NOTE:
-- Try to use **set-based logic** (joins, subqueries, window functions) instead of cursors when possible.

-- ===============================================================


-- ===============================================================
-- 🧩 SECTION: FUNCTIONS IN SQL (SIMPLE EXPLANATION)
-- ===============================================================

-- 🔹 WHAT IS A FUNCTION?
-- A **function** performs a specific task and returns a value.
-- You can use:
-- - Built-in SQL functions
-- - Custom (user-defined) functions

-- 🔸 TYPES OF FUNCTIONS:
-- ---------------------------------------------------------------

-- 1️⃣ SINGLE-ROW (SCALAR) FUNCTIONS
-- - Return **one value per row**
-- - Examples:
--   SELECT UPPER('sql');         -- 'SQL'
--   SELECT LEN('hello');         -- 5
--   SELECT GETDATE();            -- current datetime

--   🔸 Categories:
--   - String: UPPER(), LOWER(), LEN(), SUBSTRING()
--   - Math: ABS(), ROUND(), CEILING(), FLOOR()
--   - Date: GETDATE(), DATEADD(), DATEDIFF()
--   - Conversion: CAST(), CONVERT()

-- 2️⃣ MULTI-ROW (AGGREGATE) FUNCTIONS
-- - Return **one value for a group of rows**
-- - Examples:
--   SELECT COUNT(*) FROM Students;
--   SELECT AVG(Age) FROM Students;
--   SELECT MAX(Age), MIN(Age) FROM Students;

-- 🔸 USAGE EXAMPLE:
SELECT 
  UPPER(firstname) AS UpperName,
  LEN(email)       AS EmailLength,
  GETDATE()        AS Today
FROM student;

SELECT 
  COUNT(*) AS TotalStudents,
  AVG(age) AS AverageAge
FROM student;

-- ===============================================================


-- ===============================================================
-- 🛠️ USER-DEFINED FUNCTION (UDF) – Optional / Advanced
-- ===============================================================

-- 🔸 You can create custom functions using:
-- Syntax:
-- CREATE FUNCTION <FunctionName> (@param1 TYPE, @param2 TYPE)
-- RETURNS TYPE
-- AS
-- BEGIN
--     RETURN <expression>;
-- END;

-- 🧪 EXAMPLE: Get full name
-- CREATE FUNCTION GetFullName (@fname VARCHAR(50), @lname VARCHAR(50))
-- RETURNS VARCHAR(100)
-- AS
-- BEGIN
--     RETURN @fname + ' ' + @lname;
-- END;

-- ✅ Usage:
-- SELECT dbo.GetFullName('Kavi', 'Rajan');  -- Output: 'Kavi Rajan'

-- ===============================================================

-- ================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- ================================================================