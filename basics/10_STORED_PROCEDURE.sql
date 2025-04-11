-- =============================================================================
-- 📘 FULLY ORGANIZED SQL STRUCTURE: STORED PROCEDURE
-- =============================================================================
-- A Stored Procedure is a saved SQL program that performs operations like:
-- 🔹 Inserting, updating, selecting, or deleting data
-- 🔹 Accepting parameters
-- 🔹 Reusable and helps reduce repetition
-- =============================================================================


-- =============================================================================
-- 🧱 STEP 1: CREATE A BASE TABLE
-- =============================================================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    JoinDate DATE,
    Salary DECIMAL(10,2)
);


-- =============================================================================
-- 📥 STEP 2: INSERT SAMPLE DATA
-- =============================================================================

INSERT INTO Employees (EmpID, EmpName, Department, JoinDate, Salary) VALUES
(1, 'Alice Johnson',  'HR',        '2020-01-15', 70000.00),
(2, 'Bob Smith',      'Finance',   '2019-03-10', 68000.00),
(3, 'Charlie Brown',  'IT',        '2021-06-23', 72000.00),
(4, 'David Lee',      'IT',        '2022-09-30', 69000.00),
(5, 'Eva Green',      'Marketing', '2021-11-11', 71000.00);


-- =============================================================================
-- ⚙️ STEP 3: CREATE A STORED PROCEDURE — GET EMPLOYEE BY DEPARTMENT
-- =============================================================================

-- NOTE: Syntax may vary slightly based on SQL system (e.g., MySQL vs SQL Server)

-- Example for SQL Server / PostgreSQL (adjust BEGIN/END syntax for MySQL)

DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN deptName VARCHAR(50))
BEGIN
    SELECT EmpID, EmpName, Department, Salary
    FROM Employees
    WHERE Department = deptName;
END $$

DELIMITER ;


-- =============================================================================
-- 🧪 STEP 4: CALL THE STORED PROCEDURE
-- =============================================================================

CALL GetEmployeesByDepartment('IT');

-- 📋 Expected Output:
-- +--------+---------------+------------+----------+
-- | EmpID  | EmpName       | Department | Salary   |
-- +--------+---------------+------------+----------+
-- | 3      | Charlie Brown | IT         | 72000.00 |
-- | 4      | David Lee     | IT         | 69000.00 |
-- +--------+---------------+------------+----------+


-- =============================================================================
-- 🧪 STEP 5: ANOTHER STORED PROCEDURE — GIVE BONUS BY DEPARTMENT
-- =============================================================================

DROP PROCEDURE IF EXISTS GiveBonusToDepartment;

DELIMITER $$

CREATE PROCEDURE GiveBonusToDepartment(IN dept VARCHAR(50), IN bonus DECIMAL(10,2))
BEGIN
    UPDATE Employees
    SET Salary = Salary + bonus
    WHERE Department = dept;
END $$

DELIMITER ;


-- ▶️ Execute the bonus procedure:
CALL GiveBonusToDepartment('Marketing', 2000);

-- ✅ Check results:
SELECT * FROM Employees WHERE Department = 'Marketing';

-- 📋 Output:
-- +--------+-----------+------------+------------+----------+
-- | EmpID  | EmpName   | Department | JoinDate   | Salary   |
-- +--------+-----------+------------+------------+----------+
-- | 5      | Eva Green | Marketing  | 2021-11-11 | 73000.00 |
-- +--------+-----------+------------+------------+----------+


-- =============================================================================
-- ❌ STEP 6: DROP PROCEDURES IF NEEDED
-- =============================================================================

DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
DROP PROCEDURE IF EXISTS GiveBonusToDepartment;


-- =============================================================================
-- 🎉 THANK YOU FOR LEARNING SQL!
-- =============================================================================
