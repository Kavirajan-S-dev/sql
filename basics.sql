-- ===============================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- ===============================================================

-- ===============================================================
-- 🧱 FOUNDATION CONCEPTS
-- ===============================================================


-- ===============================================================
-- 📦 WHAT IS A DATA WAREHOUSE? (EASY VERSION)
-- ===============================================================

-- A Data Warehouse is a large system where a company stores data
-- from various sources (e.g., sales, customers, website activity).
-- It is used to analyze historical data, identify trends, and 
-- generate reports.

-- 🔍 Example Use Cases:
--   - How many products did we sell last year?
--   - Which month had the highest sales?
--   - Which customer buys the most?

-- ⚙️ ETL PROCESS (How data gets into a warehouse):
--   E - Extract   → Get data from different sources
--   T - Transform → Clean and organize the data
--   L - Load      → Save it into the data warehouse

-- 🛠️ Common Data Warehouse Tools:
--   - Amazon Redshift
--   - Google BigQuery
--   - Snowflake
--   - Microsoft Synapse
--   - Oracle Data Warehouse

-- 📊 DATABASE vs DATA WAREHOUSE:

-- DATABASE (for daily operations):
--   - Used for tasks like sales, orders, etc.
--   - Real-time data
--   - Optimized for INSERT/UPDATE

-- DATA WAREHOUSE (for reporting/analytics):
--   - Used for generating reports and analysis
--   - Stores both historical and current data
--   - Optimized for SELECT (read-heavy)

-- ===============================================================


-- ===============================================================
-- 🧠 BASIC CONCEPTS – SQL, DBMS, RDBMS, NoSQL
-- ===============================================================

-- 🔸 WHAT IS SQL?
-- SQL = Structured Query Language
-- It is used to interact with relational databases (like asking 
-- questions to your data).

-- You can use SQL to:
--   - Retrieve data     → SELECT
--   - Add new data      → INSERT
--   - Update existing   → UPDATE
--   - Remove data       → DELETE
--   - Create/modify structures → CREATE, ALTER

-- 🔸 WHAT IS DBMS?
-- DBMS = Database Management System
-- Software used to store and manage data.
-- Examples: MySQL, SQL Server, Oracle, PostgreSQL, MS Access

-- 🔸 WHAT IS RDBMS?
-- RDBMS = Relational Database Management System
-- A DBMS that organizes data in **tables** (rows and columns).
-- Tables can be related using keys like **Primary Key** and **Foreign Key**.
-- Supports rules like **Normalization**.

-- Examples: MySQL, PostgreSQL, SQL Server, Oracle

-- ➕ DBMS vs RDBMS:
-- - DBMS: Can store in single tables or files (no strict relationships)
-- - RDBMS: Uses related tables and supports advanced queries

-- 🔸 WHAT IS NoSQL?
-- NoSQL = "Not Only SQL" → Non-relational databases
-- Designed for unstructured/semi-structured data (e.g., JSON, XML)
-- No fixed schema required — very flexible

-- Best for:
--   - Big Data
--   - Real-time applications
--   - Rapidly changing datasets

-- Examples: MongoDB, Cassandra, Redis, CouchDB

-- 🔄 QUICK COMPARISON:

-- ---------------------------------------------------------------
-- Feature        | RDBMS (SQL)           | NoSQL
-- -------------- | ----------------------|-----------------------
-- Structure      | Tables (rows, columns)| Collections (JSON-like)
-- Schema         | Fixed (strict)        | Flexible (schema-less)
-- Best for       | Complex queries, joins| Big Data, real-time apps
-- Examples       | MySQL, SQL Server     | MongoDB, Cassandra
-- ---------------------------------------------------------------

-- 📌 Use RDBMS when:
--   - Data is structured
--   - Relationships between data matter (e.g., banking, HR)

-- 📌 Use NoSQL when:
--   - You need speed, flexibility, or scalability (e.g., social media, logs)

-- ===============================================================

-- ***************************************************************************************************************************************************

-- ===============================================================
-- 🔗 SQL DATABASE DESIGN & RELATIONSHIPS
-- ===============================================================


-- ===============================================================
-- 📘 SECTION: RELATIONSHIPS IN SQL DATABASES
-- ===============================================================

-- 🔹 DEFINITION:
-- A **relationship** in SQL connects two or more tables using
-- **Primary Keys** and **Foreign Keys**.
-- This allows linking data across tables while keeping data consistent.

--   PRIMARY KEY: Uniquely identifies each row in a table.  
--   FOREIGN KEY: Refers to the primary key in another table.

-- ✅ Maintains data integrity and ensures meaningful connections.

-- 🔸 TYPES OF RELATIONSHIPS:
-- ---------------------------------------------------------------

-- 1️⃣ ONE-TO-ONE (1:1)
-- - One row in Table A is linked to one row in Table B.
-- - Example: One person has one passport.
--   Person(ID, Name)
--   Passport(PassportID, PersonID)

-- 2️⃣ ONE-TO-MANY (1:N)
-- - One row in Table A can relate to many rows in Table B.
-- - Example: One customer places many orders.
--   Customer(CustomerID, Name)
--   Orders(OrderID, CustomerID)

-- 3️⃣ MANY-TO-ONE (N:1)
-- - Many rows in Table A relate to one row in Table B.
-- - Reverse of 1:N.
-- - Example: Many employees work in one department.

-- 4️⃣ MANY-TO-MANY (M:N)
-- - Many rows in A relate to many rows in B.
-- - Requires a **junction table** (e.g., Enrollments)

-- ===============================================================


-- ===============================================================
-- 🧮 SECTION: NORMALIZATION
-- ===============================================================

-- 🔹 WHAT IS NORMALIZATION?
-- Normalization = Process of **organizing data** to:
--   - Reduce duplication
--   - Improve integrity
--   - Avoid anomalies (insert/update/delete issues)

-- 🔸 BENEFITS:
-- - Less repetition
-- - Easier maintenance
-- - More efficient storage
-- - Reliable queries

-- 🔸 TYPES OF NORMAL FORMS:
-- ---------------------------------------------------------------

-- 1NF (First Normal Form):
-- - No repeating groups or arrays in a single column
-- - Each cell has only one value
--   ❌ Courses = 'Math, Science'
--   ✅ Create separate rows

-- 2NF (Second Normal Form):
-- - Must be in 1NF
-- - Remove partial dependencies
-- - Every non-key column depends on the **whole** primary key

-- 3NF (Third Normal Form):
-- - Must be in 2NF
-- - Remove transitive dependencies
-- - Non-key columns depend **only on the primary key**

-- BCNF:
-- - A stricter form of 3NF
-- - Every determinant must be a **candidate key**

-- 4NF:
-- - Removes multi-valued dependencies
-- - No table should contain two or more independent multi-valued facts

-- 5NF:
-- - Removes join dependencies
-- - Data should be reconstructible from smaller pieces

-- ===============================================================


-- ===============================================================
-- 🔑 SECTION: COMPOSITE KEY
-- ===============================================================

-- 🔹 DEFINITION:
-- A **composite key** is a **primary key** made from **2 or more columns**.
-- Used when one column alone isn't enough to uniquely identify a row.

-- 🔸 EXAMPLE:
-- Track which student is in which course:
CREATE TABLE enrollments
(
  studentid INT,
  courseid INT,
  enrollmentdate DATE,
  PRIMARY KEY (studentid, courseid)
  -- 👆 Composite Key
);

-- - One student can enroll in multiple courses
-- - One course can have many students
-- - But a student can’t enroll in the same course twice

-- 🔸 WHY USE COMPOSITE KEYS?
-- - Enforce uniqueness on a **combination** of values
-- - Represent many-to-many relationships
-- - Common in junction/link tables

-- You can still use **FOREIGN KEYS** with composite keys:
--   StudentID → Students(StudentID)
--   CourseID  → Courses(CourseID)

-- ===============================================================


-- ===============================================================
-- ⚠️ SECTION: CONSTRAINTS IN SQL
-- ===============================================================

-- 🔹 DEFINITION:
-- A **constraint** is a rule that limits what values can go in a column.
-- It helps ensure valid, consistent, and meaningful data.

-- 🔸 TYPES OF CONSTRAINTS:
-- ---------------------------------------------------------------

-- 1. PRIMARY KEY
-- - Unique and NOT NULL
-- - Only one per table
CREATE TABLE students
(
  studentid INT PRIMARY KEY,
  name VARCHAR(100)
);

-- 2. FOREIGN KEY
-- - References a primary key in another table
-- - Maintains referential integrity
CREATE TABLE orders
(
  orderid INT PRIMARY KEY,
  customerid INT,
  FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- 3. UNIQUE
-- - All values in the column must be different (allows one NULL)
CREATE TABLE users
(
  userid INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);

-- 4. NOT NULL
-- - Prevents empty values
CREATE TABLE products
(
  productid INT,
  name VARCHAR(50) NOT NULL
);

-- 5. CHECK
-- - Restricts values using a condition
CREATE TABLE employees
(
  empid INT,
  age INT CHECK (age >= 18)
);

-- 6. DEFAULT
-- - Sets a default value if none is given
CREATE TABLE customers
(
  customerid INT,
  country VARCHAR(50) DEFAULT 'India'
);

-- ===============================================================


-- ===============================================================
-- 🗂️ SECTION: DATABASE SCHEMA IN SQL
-- ===============================================================

-- 🔹 DEFINITION:
-- A **schema** is the **structure** or **blueprint** of a database.
-- It defines:
--   - Tables
--   - Columns & data types
--   - Keys (Primary/Foreign)
--   - Indexes
--   - Views, procedures (advanced)

-- 🔸 WHY IS SCHEMA IMPORTANT?
-- - Keeps data organized and understandable
-- - Improves collaboration between devs
-- - Supports data consistency and integrity

-- 🔸 EXAMPLE SCHEMA:
-- A simple school system:
CREATE TABLE students
(
  studentid INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE
);

CREATE TABLE courses
(
  courseid INT PRIMARY KEY,
  title VARCHAR(100),
  duration INT
);

CREATE TABLE enrollments
(
  studentid INT,
  courseid INT,
  enrollmentdate DATE,
  PRIMARY KEY (studentid, courseid),
  FOREIGN KEY (studentid) REFERENCES students(studentid),
  FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

-- 🆚 SCHEMA vs DATABASE:

-- DATABASE = Whole data container (tables, users, etc.)
-- SCHEMA   = Structure/layout inside the database

-- ✅ You can have **multiple schemas** in one database:
-- Example:
-- CREATE SCHEMA School;
-- CREATE TABLE School.Students (...);

-- ===============================================================


-- ***************************************************************************************************************************************************


-- ===============================================================
-- ⚙️ SQL FUNCTIONALITY & PERFORMANCE
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


-- ***************************************************************************************************************************************************

-- ===============================================================
-- 🗝️  SQL Keywords - Essentials
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
