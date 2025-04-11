-- ===============================================================
-- Basic of SQL Explanation with Examples
-- Author: Kavirajan S
-- Description: Learn SQL Concepts and Commands with Practical Usage
-- Suitable for: Beginner to intermediate using SQL Server
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

-- ================================================================
-- 🎉 THANK YOU
-- ================================================================
