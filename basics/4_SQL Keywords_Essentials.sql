-- ===============================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- ===============================================================


-- ===============================================================
-- Keywords
-- ===============================================================
-- SELECT       : 📥 Retrieve data
-- FROM         : 📂 Specify the table
-- WHERE        : 🔍 Filter records
-- ORDER BY     : 📊 Sort results
-- GROUP BY     : 👥 Group rows for aggregation
-- HAVING       : 📎 Filter grouped rows
-- DISTINCT     : 🚫 Remove duplicates
-- AS           : 🏷️  Alias a column/table
-- INSERT       : ➕ Add new records
-- UPDATE       : ✏️  Modify existing records
-- DELETE       : ❌ Remove records
-- CREATE       : 🏗️  Create database/table
-- ALTER        : 🛠️  Modify structure
-- DROP         : 💣 Delete database/table
-- TRUNCATE     : 🧹 Delete all data (keep structure)
-- JOIN         : 🔗 Combine rows from multiple tables
-- INNER JOIN   : 🔄 Return matching rows from both tables
-- LEFT JOIN    : ⬅️ All from left + matching from right
-- RIGHT JOIN   : ➡️ All from right + matching from left
-- FULL JOIN    : 🌐 All from both tables
-- UNION        : 🔀 Combine results (unique only)
-- UNION ALL    : 🔁 Combine results (include duplicates)
-- IN           : 🧾 Check if value is in list
-- BETWEEN      : 🎯 Range filtering
-- LIKE         : 🔤 Pattern matching
-- EXISTS       : ✅ Check for row existence
-- ANY          : 🎲 Compare to any value in subquery
-- ALL          : 📋 Compare to all values in subquery
-- CASE         : 🧠 Conditional logic
-- CAST         : 🔄 Convert data types
-- CONVERT      : 🔁 Another way to change data types (SQL Server)
-- TOP (n)      : 🥇 Return first n rows (SQL Server syntax)
-- LIMIT (n)    : ⛔ Limit rows (MySQL/PostgreSQL)
-- OFFSET       : ↘️ Skip rows (used with LIMIT)
-- COMMIT       : 💾 Save transaction
-- ROLLBACK     : ↩️ Undo transaction
-- SAVEPOINT    : 🧷 Save intermediate state
-- GRANT        : 🆗 Give permissions
-- REVOKE       : 🛑 Remove permissions
-- DEFAULT      : 🎛️  Set default value for a column
-- PRIMARY KEY  : 🗝️  Unique row identifier
-- FOREIGN KEY  : 🔐 Link to another table’s primary key
-- CHECK        : ✅ Validate column values
-- NULL         : 🕳️  Absence of value
-- NOT NULL     : 🚫 Cannot be empty
-- IS NULL      : ❓ Check if value is null
-- IS NOT NULL  : ❗ Check if value is NOT null
-- ===============================================================



-- ===============================================================
-- Data Types
-- ===============================================================
-- Common Data Types (SQL Server):
-- INT             : Whole number
-- VARCHAR(n)      : Variable-length string (n characters max)
-- CHAR(n)         : Fixed-length string
-- DECIMAL(p,s)    : Precise number (p = precision, s = scale)
-- DATE            : Date only
-- DATETIME        : Date and time
-- BIT             : Boolean (0 or 1)
-- ===============================================================



-- ===============================================================
-- 🔧 Operators - SQL Logic & Math
-- ===============================================================

-- 📊 Comparison Operators:
-- =             : Equal to
-- != or <>      : Not equal to
-- <             : Less than
-- >             : Greater than
-- <=            : Less than or equal to
-- >=            : Greater than or equal to

-- ➗ Arithmetic Operators:
-- +             : Addition
-- -             : Subtraction
-- *             : Multiplication
-- /             : Division
-- %             : Modulus (remainder)

-- 🧠 Logical Operators:
-- AND           : All conditions must be true
-- OR            : At least one condition must be true
-- NOT           : Negates a condition

-- 🔍 Predicates & Matching:
-- BETWEEN a AND b     : Value within range
-- IN (value1, value2) : Matches any in list
-- LIKE 'A%'           : Pattern match using % or _
-- IS NULL             : Value is NULL (empty)
-- IS NOT NULL         : Value is NOT NULL
-- EXISTS (subquery)   : True if subquery returns any row

-- 🔀 Subquery Comparisons:
-- ALL                : Compare to all results from a subquery
-- ANY / SOME         : Compare to any result from a subquery

-- 🧠 Conditional Expression:
-- CASE
--   WHEN condition THEN result
--   ELSE default_result
-- END

-- (Optional/Niche)
-- Bitwise: & | ^ ~ << >>  -- Bitwise operations (advanced use)
-- ===============================================================


-- ===============================================================
-- 📈 AGGREGATION FUNCTIONS
-- ===============================================================
-- COUNT(*)               : Count all rows
-- COUNT(DISTINCT col)    : Count unique values
-- SUM(column)            : Total sum of a numeric column
-- AVG(column)            : Average value of a column
-- MIN(column)            : Lowest value
-- MAX(column)            : Highest value

-- 🧵 STRING_AGG(column, separator) : Combine text values (if supported)
-- 🧮 STDEV(column) / VAR(column)   : Standard deviation / Variance (stats)

-- GROUP BY     : Group rows that have the same values in specified columns
-- HAVING       : Filter groups after aggregation (like WHERE for groups)
-- ===============================================================


-- 📘 ================================================================
-- 📌 TYPES OF SQL COMMANDS IN SQL
-- ================================================================

-- 🧱 1. DDL (Data Definition Language)
-- ---------------------------------------------------------------
-- Used to define and modify the structure of database objects
-- 🎯 Common Commands:
--   • CREATE     - Create a new database/table
--   • ALTER      - Modify an existing table
--   • DROP       - Delete a table or database
--   • TRUNCATE   - Remove all rows from a table (structure remains)

-- 💡 Examples:
CREATE DATABASE sampledb;         -- Creates a new database
USE sampledb;                     -- Selects the database to use

CREATE TABLE student (
  studentid INT PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  age INT,
  country VARCHAR(50),
  email VARCHAR(100)
);

ALTER TABLE student
  ADD mobilenumber VARCHAR(15);   -- Adds a new column

ALTER TABLE student
  ALTER COLUMN email VARCHAR(150); -- Modifies column data type

EXEC sp_rename
  'student.mobilenumber', 'phone', 'COLUMN'; -- Renames a column

ALTER TABLE student
  DROP COLUMN age;                -- Deletes a column

-- DROP TABLE student;           -- Deletes the entire table
-- TRUNCATE TABLE student;       -- Deletes all data but keeps the structure

-- 🧰 ---------------------------------------------------------------

-- ✏️ 2. DML (Data Manipulation Language)
-- ---------------------------------------------------------------
-- Used to manipulate data stored in tables
-- 🎯 Common Commands:
--   • INSERT     - Add new data
--   • UPDATE     - Modify existing data
--   • DELETE     - Remove data

-- 💡 Examples:
INSERT INTO student (studentid, firstname, lastname, country, email, phone)
VALUES (1, 'Arun', 'Kumar', 'India', 'arun@example.com', '9876543210');

UPDATE student
SET email = 'arun.kumar@email.com'
WHERE studentid = 1;

-- DELETE FROM student WHERE studentid = 2; -- Deletes a student

-- 🔍 ---------------------------------------------------------------

-- 🔎 3. DQL (Data Query Language)
-- ---------------------------------------------------------------
-- Used to query and retrieve data from tables
-- 🎯 Common Command:
--   • SELECT     - Retrieve data

-- 💡 Examples:
SELECT * FROM student;                            -- All columns
SELECT firstname, email FROM student;             -- Specific columns
SELECT * FROM student WHERE country = 'India';    -- Filtered
SELECT * FROM student WHERE firstname LIKE 'A%';  -- Pattern matching
SELECT * FROM student ORDER BY firstname ASC;     -- Sorting
SELECT * FROM student WHERE country IN ('India', 'USA'); -- IN clause

-- 🔐 ---------------------------------------------------------------

-- 🛡️ 4. DCL (Data Control Language)
-- ---------------------------------------------------------------
-- Used to control access and permissions
-- 🎯 Common Commands:
--   • GRANT      - Give user access
--   • REVOKE     - Remove user access

-- 💡 Examples:
-- GRANT SELECT ON student TO [Username];    -- Give read access
-- REVOKE SELECT ON student FROM [Username]; -- Remove access

-- 🎯 NOTE:
-- [Username] refers to a database login/user account.

-- 🌀 ---------------------------------------------------------------

-- 🔁 5. TCL (Transaction Control Language)
-- ---------------------------------------------------------------
-- Used to manage transactions and ensure data integrity
-- 🎯 Common Commands:
--   • COMMIT     - Save the transaction
--   • ROLLBACK   - Undo changes
--   • SAVEPOINT  - Set a point to roll back to

-- 💡 Examples:
BEGIN TRANSACTION;

UPDATE student
SET country = 'Canada'
WHERE studentid = 1;

COMMIT;     -- Saves the changes

-- ROLLBACK; -- Undoes changes if something goes wrong

-- ================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- ================================================================