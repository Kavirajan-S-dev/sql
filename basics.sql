-- ===============================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
-- ===============================================================



-- ===============================================================
-- WHAT IS A DATA WAREHOUSE? (EASY VERSION)
-- ===============================================================
-- A Data Warehouse is a big storage system where a company
--     saves data from different places (sales, customers, website).
--     It is used to check past data, find trends, and make reports.
-- Example Use:
--     - "How many products did we sell last year?"
--     - "Which month had the most sales?"
--     - "Which customer buys the most?"
-- ETL PROCESS (How data gets into warehouse):
--     E - Extract   - Get data from different sources
--     T - Transform - Clean and organize the data
--     L - Load      - Save it into the data warehouse
-- Tools used:
--     - Amazon Redshift
--     - Google BigQuery
--     - Snowflake
--     - Microsoft Synapse
--     - Oracle Data Warehouse
-- DATABASE VS DATA WAREHOUSE:
--     DATABASE (for daily use):
--     - Used for sales, orders, etc.
--     - Works with real-time data
--     - Fast for INSERT/UPDATE
--     DATA WAREHOUSE (for reports):
--     - Used for analysis and reports
--     - Stores old + current data
--     - Fast for SELECT (read-only)
-- ===============================================================



-- ===============================================================
-- BASIC CONCEPTS - SQL, DBMS, RDBMS, NoSQL
-- ===============================================================
-- WHAT IS SQL?
-- SQL stands for **Structured Query Language**.
-- It is used to interact with **relational databases** - like asking questions to a data storage system.
-- You can use SQL to:
--    Retrieve data (SELECT)
--    Add new data (INSERT)
--    Update data (UPDATE)
--    Delete data (DELETE)
--    Create or modify tables (CREATE, ALTER)

-- WHAT IS DBMS?
-- DBMS = **Database Management System**
-- A software system to **store and manage data**.
-- Examples: MySQL, SQL Server, Oracle, PostgreSQL, MS Access

-- WHAT IS RDBMS?
-- RDBMS = **Relational Database Management System**
-- It's a type of DBMS where data is stored in **tables** (rows & columns).
-- Each table can be related to another (called a **relation**).
-- It follows rules like **Primary Keys**, **Foreign Keys**, and **Normalization**.
-- Examples: MySQL, PostgreSQL, SQL Server, Oracle DB
-- Difference between DBMS and RDBMS:
-- DBMS can store data in files or single tables.
-- RDBMS stores data in **related tables**, and supports complex queries.

-- WHAT IS NoSQL?
-- NoSQL = **Not Only SQL** (non-relational database)
-- Used for unstructured or semi-structured data (like JSON, XML).
-- It's flexible: You don't need to define a fixed schema.
-- Ideal for Big Data, real-time apps, or fast-growing datasets.
-- Examples: MongoDB, Cassandra, Redis, CouchDB

-- QUICK COMPARISON:
-- ---------------------------------------------------------------
-- Feature        | RDBMS (SQL)           | NoSQL
-- -------------- | ----------------------|-----------------------
-- Structure      | Tables (rows, columns)| Collections (JSON-like)
-- Schema         | Fixed (strict)        | Flexible (schema-less)
-- Best for       | Complex queries, joins| Big Data, real-time apps
-- Examples       | MySQL, SQL Server     | MongoDB, Cassandra
-- ---------------------------------------------------------------

-- Use SQL when data is structured and relationships matter (e.g., banks, HR).
-- Use NoSQL when you need scalability and fast performance (e.g., social media, logs).
-- ===============================================================



-- ===============================================================
-- SECTION: RELATIONSHIPS IN SQL DATABASES
-- ===============================================================
-- DEFINITION:
-- A **relationship** in SQL defines how two or more tables are **connected** to each other
-- using **primary keys** and **foreign keys**.
-- This allows data to be **linked** across different tables, maintaining **data integrity**.
-- PRIMARY KEY: Uniquely identifies each row in a table.
-- FOREIGN KEY: Refers to the primary key in another table (creates the relationship).
-- ===============================================================
-- TYPES OF RELATIONSHIPS
-- ===============================================================
-- 1. ONE-TO-ONE (1:1)
-- - One row in Table A is related to one row in Table B.
-- - Example: A person has one passport.
-- Example Tables:
-- Person(ID, Name)
-- Passport(PassportID, PersonID)
-- 2. ONE-TO-MANY (1:N)
-- - One row in Table A can be related to many rows in Table B.
-- - Example: One customer can place many orders.
-- Example Tables:
-- Customer(CustomerID, Name)
-- Orders(OrderID, CustomerID)
-- 3. MANY-TO-ONE (N:1)
-- - Many rows in Table A relate to one row in Table B.
-- - This is the reverse of one-to-many.
-- Example: Many employees work in one department.
-- 4. MANY-TO-MANY (M:N)
-- - Many rows in Table A relate to many rows in Table B.
-- - Needs a **junction table** in between.
-- ===============================================================



-- ===============================================================
-- SECTION: NORMALIZATION?
-- ===============================================================
-- WHAT IS NORMALIZATION IN SQL?
-- DEFINITION:
-- Normalization is the process of **organizing data** in a database
-- to reduce **redundancy** (duplicate data) and improve **data integrity** we make it to take it as separate table.
-- WHY NORMALIZE?
-- Avoid storing the same data in multiple places
-- Make database smaller and faster
-- Easier to update and maintain
-- Prevent anomalies (insert, update, delete problems)
-- ===============================================================
-- TYPES OF NORMAL FORMS
-- ===============================================================
-- 1NF (First Normal Form):
-- - Eliminate repeating groups (no multiple values in a single column)
-- - Each cell contains only **one value**
-- EXAMPLE : Courses = 'Math, Science'
-- FIXED : Create separate rows for each course
-- 2NF (Second Normal Form):
-- - Be in 1NF
-- - Remove **partial dependencies**
-- - Every non-key column should depend on the **whole primary key**
-- 3NF (Third Normal Form):
-- - Be in 2NF
-- - Remove **transitive dependencies**
-- - Non-key columns should depend **only on the primary key**
-- BCNF (Boyce-Codd Normal Form):
-- - Stricter version of 3NF
-- - Every determinant must be a **candidate key**
-- 4NF:
-- - Be in BCNF
-- - Remove **multi-valued dependencies**
-- 5NF:
-- - Be in 4NF
-- - Deals with **complex joins** and ensures that all data is reconstructible
-- ===============================================================



-- ===============================================================
-- SECTION: INDEXING IN SQL
-- ===============================================================
-- WHAT IS INDEXING?
-- Indexing is like a **table of contents** for your database.
-- It makes **searching and retrieving data faster**, especially on large tables.
-- Think of it like an index in a book - instead of flipping every page, you jump straight to the topic.
-- When you run queries with WHERE, JOIN, ORDER BY, etc., indexing can improve performance.
-- ===============================================================
-- TYPES OF INDEXES
-- ===============================================================
-- 1. CLUSTERED INDEX
-- - Sorts the actual **data rows** in the table based on the index.
-- - Only **one** clustered index is allowed per table.
-- - Primary key creates a clustered index by default.
-- Think of it as a **sorted table**.
-- Example:
CREATE TABLE employees
(
  empid INT PRIMARY KEY,
  -- This creates a clustered index by default
  NAME VARCHAR(100),
  department VARCHAR(50)
);

-- 2. NON-CLUSTERED INDEX
-- - Does **not** sort the actual table.
-- - Stores a separate structure that **points to the data**.
-- - You can have **multiple** non-clustered indexes.
-- Example:
CREATE NONCLUSTERED INDEX idx_emp_name
  ON employees(NAME);

-- 3. UNIQUE INDEX
-- - Ensures all values in the column are **unique** (no duplicates).
-- - Often used for columns like Email, Username, etc.
-- Example:
CREATE UNIQUE INDEX idx_unique_email
  ON employees(email);

-- 4. COMPOSITE INDEX (MULTI-COLUMN INDEX)
-- - An index on **two or more columns**.
-- - Useful for queries with multiple WHERE conditions.
-- Example:
CREATE NONCLUSTERED INDEX idx_dept_name
  ON employees(department, NAME);
-- ===============================================================



-- ===============================================================
-- SECTION: CONSTRAINTS IN SQL
-- ===============================================================
-- WHAT IS A CONSTRAINT?
-- A **constraint** is a rule applied to columns in a table
-- to **restrict the type of data** that can be inserted or updated.
-- Purpose:
-- Maintain data integrity
-- Avoid invalid data
-- Enforce business rules in the database
-- ===============================================================
-- TYPES OF CONSTRAINTS
-- ===============================================================
-- 1. PRIMARY KEY
-- - Uniquely identifies each record in a table
-- - Cannot be NULL
-- - Only one per table
-- Example:
CREATE TABLE students
(
  studentid INT PRIMARY KEY,
  NAME VARCHAR(100)
);

-- 2. FOREIGN KEY
-- - Links to a **primary key in another table**
-- - Ensures referential integrity
-- Example:
CREATE TABLE orders
(
  orderid INT PRIMARY KEY,
  customerid INT,
  FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- 3. UNIQUE
-- - Ensures all values in a column are different (but allows one NULL)
-- Example:
CREATE TABLE users
(
  userid INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);

-- 4. NOT NULL
-- - Prevents a column from having NULL (empty) values
-- Example:
CREATE TABLE products
(
  productid INT,
  NAME VARCHAR(50) NOT NULL
);

-- 5. CHECK
-- - Limits the values in a column using a condition
-- Example:
CREATE TABLE employees
(
  empid INT,
  age INT CHECK (age >= 18)
);

-- 6. DEFAULT
-- - Assigns a default value if no value is provided
-- Example:
CREATE TABLE customers
(
  customerid INT,
  country VARCHAR(50) DEFAULT 'India'
);
-- ===============================================================




-- ===============================================================
-- SECTION: COMPOSITE KEY
-- ===============================================================
-- DEFINITION:
-- A **composite key** is a **primary key** made up of **two or more columns**.
-- It's used when **a single column is not enough** to uniquely identify a row,
-- so we use a combination of multiple columns.
-- All values together must be unique (not individually).

-- ===============================================================
-- EXAMPLE: Composite Key
-- ===============================================================
-- Let's say a student can enroll in multiple courses,
-- and a course can have many students.
-- You need to track which student is in which course.
-- Create a table where both StudentID and CourseID are needed
-- to uniquely identify each enrollment:
CREATE TABLE enrollments
(
  studentid INT,
  courseid INT,
  enrollmentdate DATE,
  PRIMARY KEY (studentid, courseid) -- 👈 Composite Key
);

-- Now:
-- - One student can enroll in multiple courses 
-- - One course can have multiple students 
-- - But a **student cannot enroll in the same course more than once** 

-- ===============================================================
-- Why use Composite Key?
-- ===============================================================
-- Enforce uniqueness on combinations (not single columns)
-- Represent many-to-many relationships
-- Useful in junction/link tables
-- You can still create FOREIGN KEYS pointing to other tables:
-- For example:
-- StudentID → Students(StudentID)
-- CourseID  → Courses(CourseID)
-- ===============================================================



-- ===============================================================
-- SECTION: DATABASE SCHEMA IN SQL
-- ===============================================================
-- DEFINITION:
-- A **database schema** is the **blueprint or structure** of a database.
-- It defines **how the data is organized** and how the relationships between tables are managed.
-- Think of a schema as the **layout or skeleton** of a database.
-- It includes:
-- Tables
-- Columns (with data types)
-- Relationships (keys: primary & foreign)
-- Indexes
-- Views, Triggers, Stored Procedures (in advanced cases)

-- ===============================================================
-- WHY IS SCHEMA IMPORTANT?
-- ===============================================================
-- Helps organize and manage complex data
-- Makes it easier for developers to understand the data model
-- Maintains data integrity and avoids redundancy

-- ===============================================================
-- EXAMPLE SCHEMA (SIMPLE)
-- ===============================================================
-- Imagine a School Database Schema with:
-- - Students table
-- - Courses table
-- - Enrollments table (to link students and courses)
-- Schema Design:
CREATE TABLE students
(
  studentid INT PRIMARY KEY,
  NAME VARCHAR(100),
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

-- This is a basic schema for a school system.
-- ===============================================================
-- SCHEMA VS DATABASE:
-- ===============================================================
-- DATABASE: The container that holds everything (tables, data, users)
-- SCHEMA: The **structure/plan** inside the database
-- You can have **multiple schemas** inside one database (e.g., for different modules).
-- In SQL Server, schemas can be named:
-- Example:
-- CREATE SCHEMA School;  -- Create a new schema
-- CREATE TABLE School.Students (...);  -- Table inside schema
-- ===============================================================




-- ===============================================================
-- SECTION: CURSOR IN SQL
-- ===============================================================
-- DEFINITION:
-- A **cursor** is a database object used to **retrieve and manipulate data row-by-row**
-- from a result set (like a loop in other programming languages).
-- Normally, SQL works with **sets of rows** (set-based operations).
-- But when you need to process **each row individually**, you use a **cursor**.
-- ===============================================================
-- WHEN TO USE CURSORS:
-- ===============================================================
-- When row-by-row processing is absolutely necessary
-- When you need to perform complex logic on each row
-- Try to avoid if possible — they can be **slow** and resource-heavy
-- ===============================================================
-- BASIC SYNTAX OF A CURSOR
-- ===============================================================
-- 1. Declare the cursor
-- 2. Open the cursor
-- 3. Fetch rows one by one
-- 4. Process the row (e.g., print, update)
-- 5. Close the cursor
-- 6. Deallocate the cursor
-- Example:
DECLARE @Name VARCHAR(100);
-- Step 1: Declare Cursor
DECLARE name_cursor CURSOR FOR
  SELECT NAME
FROM students;

-- Step 2: Open Cursor
OPEN name_cursor;

-- Step 3: Fetch First Row
FETCH next FROM name_cursor INTO @Name;

-- Step 4: Loop through rows
WHILE @@FETCH_STATUS = 0
  BEGIN
  PRINT 'Student Name: ' + @Name;

  -- Fetch next row
  FETCH next FROM name_cursor INTO @Name;
END;

-- Step 5: Close Cursor
CLOSE name_cursor;

-- Step 6: Deallocate Cursor
DEALLOCATE name_cursor;

-- ===============================================================
-- NOTE:
-- ===============================================================
-- Avoid using cursors when you can use **JOINs**, **aggregations**, or **window functions**.
-- Cursors are slower and more memory intensive.
-- Use only when row-wise logic is really needed.
-- ===============================================================



-- ===============================================================
-- FUNCTIONS IN SQL (SIMPLE EXPLANATION)
-- ===============================================================
-- A FUNCTION in SQL is used to perform a specific task
--     and return a value.
-- You can use built-in functions or create your own (user-defined).
-- ===============================================================
-- TYPES OF SQL FUNCTIONS
-- ===============================================================
-- 1. SINGLE-ROW (SCALAR) FUNCTIONS:
--     ➤ Work on one row at a time
--     ➤ Return one value for each row
--     Example:
--     SELECT UPPER('hello');       -- Returns: 'HELLO'
--     SELECT LEN('SQL');           -- Returns: 3
--     SELECT GETDATE();            -- Returns current date/time
--     Categories:
--     - String Functions: UPPER(), LOWER(), LEN(), SUBSTRING()
--     - Math Functions: ABS(), ROUND(), CEILING(), FLOOR()
--     - Date Functions: GETDATE(), DATEADD(), DATEDIFF()
--     - Conversion: CAST(), CONVERT()
-- 2. MULTI-ROW (AGGREGATE) FUNCTIONS:
--     ➤ Work on multiple rows at once
--     ➤ Return one result for a group
--     Example:
--     SELECT COUNT(*) FROM Students;        -- Total students
--     SELECT AVG(Age) FROM Students;        -- Average age
--     SELECT MAX(Age), MIN(Age) FROM Students;
-- ===============================================================
-- EXAMPLE USAGE
-- ===============================================================
-- Using multiple functions in a SELECT query:
SELECT Upper(firstname) AS UpperName,
  Len(email)       AS EmailLength,
  Getdate()        AS Today
FROM student;

-- Aggregate example:
SELECT Count(*) AS TotalStudents,
  Avg(age) AS AverageAge
FROM student;
-- ===============================================================



-- ===============================================================
-- USER-DEFINED FUNCTION (UDF) - Optional / Advanced
-- ===============================================================
-- You can also create your own function:
-- Example: Function to return full name
-- CREATE FUNCTION GetFullName (@fname VARCHAR(50), @lname VARCHAR(50))
-- RETURNS VARCHAR(100)
-- AS
-- BEGIN
--     RETURN @fname + ' ' + @lname;
-- END;
-- Use:
-- SELECT dbo.GetFullName('Kavi', 'Rajan');  -- Output: 'Kavi Rajan'
-- ===============================================================



-- ===============================================================
-- Keywords
-- ===============================================================
-- SELECT     : Retrieve data
-- FROM       : Specify the table
-- DISTINCT   : Return only unique (non-duplicate) values
-- TOP (n)    : Return only the first n rows (SQL Server syntax)
-- AS         : Rename a column or table temporarily (alias)
-- WHERE      : Filter records
-- ORDER BY   : Sort results
-- INSERT     : Add new records
-- UPDATE     : Modify existing records
-- DELETE     : Remove records
-- CREATE     : Create database/table
-- ALTER      : Modify structure
-- DROP       : Delete database/table
-- COMMIT     : Save transaction
-- ROLLBACK   : Undo transaction
-- GRANT      : Give permission
-- REVOKE     : Remove permission
-- ===============================================================
--            Data Types
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
--            Operators
-- ===============================================================
-- COMPARISON & ARITHMETIC OPERATORS:
-- =, !=, <>, <, >, <=, >=         : Basic comparisons
-- +, -, *, /, %                   : Arithmetic
-- LOGICAL OPERATORS & PREDICATES:
-- AND        : All conditions must be true
-- OR         : At least one condition must be true
-- NOT        : Negates a condition
-- BETWEEN    : Check if value is within a range
-- IN (...)   : Check if value matches any value in a list
-- LIKE       : Pattern matching using %, _
-- EXISTS     : Check if subquery returns any results
-- ALL        : Compare value to all values returned by subquery
-- ANY        : Compare value to any one value returned by subquery
-- SOME       : Same as ANY (interchangeable)
-- ===============================================================
--          AGGREGATION FUNCTIONS
-- ===============================================================
-- COUNT(), SUM(), AVG(), MIN(), MAX()
-- GROUP BY     : Used with aggregation
-- HAVING       : Filter on aggregation (like WHERE)
-- ===============================================================
-- TYPES OF SQL COMMANDS
-- ===============================================================
-- ---------------------------------------------------------------
-- 1. DDL (Data Definition Language)
-- ---------------------------------------------------------------
-- Used to define and manage database structures such as databases,
-- tables, schemas, indexes, etc.
-- Common commands: CREATE, ALTER, DROP, TRUNCATE
-- ===============================================================
-- Create a database
CREATE DATABASE sampledb;

-- Use the database (select it for use)
USE sampledb;

-- Create a table inside SampleDB
CREATE TABLE student
(
  studentid INT PRIMARY KEY,-- Unique ID for each student
  firstname VARCHAR(50) NOT NULL,-- Student's first name (max 50 characters)
  lastname VARCHAR(50) NOT NULL,-- Last name (required)
  age INT,-- Age (can be null if not provided)
  country VARCHAR(50),-- Country of origin
  email VARCHAR(100)-- Email address
);

-- Alter the table: Add a new column
ALTER TABLE student
  ADD mobilenumber VARCHAR(15);

-- New column to store phone number
-- Alter the table: Modify column data type
-- (Only works if existing data is compatible)
ALTER TABLE student
  ALTER COLUMN email VARCHAR(150);

-- Extend max email length
-- Rename a column (SQL Server syntax)
EXEC Sp_rename
  'Student.MobileNumber',
  'Phone',
  'COLUMN';

-- Drop a column
ALTER TABLE student
  DROP COLUMN age;

-- Drop the table
-- DROP TABLE Student;
-- Truncate the table (removes all rows but keeps structure)
-- TRUNCATE TABLE Student;
-- ===============================================================
-- 2. DML (Data Manipulation Language)
-- ---------------------------------------------------------------
-- Used to insert, update, or delete data in existing tables.
-- Common commands: INSERT, UPDATE, DELETE
-- ===============================================================
-- Insert a new student
INSERT INTO student
  (studentid,
  firstname,
  lastname,
  country,
  email,
  phone)
VALUES
  (1,
    'Arun',
    'Kumar',
    'India',
    'arun@example.com',
    '9876543210');

-- Insert another student
INSERT INTO student
  (studentid,
  firstname,
  lastname,
  country,
  email,
  phone)
VALUES
  (2,
    'Sneha',
    'Ravi',
    'USA',
    'sneha@example.com',
    '9988776655');

-- Update a student's information
UPDATE student
SET    email = 'arun.kumar@email.com'
WHERE  studentid = 1;

-- Delete a student record
-- DELETE FROM Student WHERE StudentID = 2;
-- ===============================================================
-- 3. DQL (Data Query Language)
-- ---------------------------------------------------------------
-- Used to query and retrieve data from the database.
-- Main command: SELECT
-- ===============================================================
-- View all data in Student table
SELECT *
FROM student;

-- Select specific columns
SELECT firstname,
  email
FROM student;

-- Use WHERE to filter rows
SELECT *
FROM student
WHERE  country = 'India';

-- Use LIKE for pattern matching
SELECT *
FROM student
WHERE  firstname LIKE 'A%';

-- Names starting with 'A'
-- Use ORDER BY to sort results
SELECT *
FROM student
ORDER  BY firstname ASC;

-- Use IN, BETWEEN
SELECT *
FROM student
WHERE  country IN ( 'India', 'USA' );

-- ===============================================================
-- 4. DCL (Data Control Language)
-- ---------------------------------------------------------------
-- Used to manage user access and permissions.
-- Common commands: GRANT, REVOKE
-- ===============================================================
-- These commands require user accounts and permissions set up.
-- [Username] refers to a database login/user account.
-- Example only; may not work in basic environments.
-- GRANT SELECT ON Student TO [Username];    -- Give read access
-- REVOKE SELECT ON Student FROM [Username]; -- Remove read access
-- ===============================================================
-- 5. TCL (Transaction Control Language)
-- ---------------------------------------------------------------
-- Used to manage transactions in SQL.
-- Common commands: COMMIT, ROLLBACK, SAVEPOINT
-- ===============================================================
-- Start a transaction
BEGIN TRANSACTION;

-- Make a change (e.g., update)
UPDATE student
SET    country = 'Canada'
WHERE  studentid = 1;

-- Commit to save changes permanently
COMMIT;
-- If something goes wrong, you can undo before commit
-- ROLLBACK;
-- ===============================================================
-- THANK YOU!
-- ===============================================================