CREATE DATABASE SaleOrder

use SaleOrder

CREATE TABLE dbo.Customer (
    CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CustomerFirstName VARCHAR(50) NOT NULL,
    CustomerLastName VARCHAR(50) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerSuburb VARCHAR(50) NULL,
    CustomerCity VARCHAR(50) NOT NULL,
    CustomerPostCode VARCHAR(10) NULL,
    CustomerPhoneNumber CHAR(12) NULL
);

-- 2. Inventory Table
CREATE TABLE dbo.Inventory (
    InventoryID TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    InventoryName VARCHAR(50) NOT NULL,
    InventoryDescription VARCHAR(255) NULL
);

-- 3. Employee Table
CREATE TABLE dbo.Employee (
    EmployeeID TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeExtension CHAR(4) NULL
);

-- 4. Sale Table
CREATE TABLE dbo.Sale (
    SaleID TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL REFERENCES dbo.Customer(CustomerID),
    InventoryID TINYINT NOT NULL REFERENCES dbo.Inventory(InventoryID),
    EmployeeID TINYINT NOT NULL REFERENCES dbo.Employee(EmployeeID),
    SaleDate DATE NOT NULL,
    SaleQuantity INT NOT NULL,
    SaleUnitPrice SMALLMONEY NOT NULL
);

-- 5. EmployeeDemographics Table
CREATE TABLE dbo.EmployeeDemographics (
    EmployeeID TINYINT NOT NULL PRIMARY KEY REFERENCES dbo.Employee(EmployeeID),
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NULL,
    MaritalStatus VARCHAR(20) NULL,
    Nationality VARCHAR(50) NULL
);

-- 6. EmployeeSalary Table
CREATE TABLE dbo.EmployeeSalary (
    EmployeeID TINYINT NOT NULL PRIMARY KEY REFERENCES dbo.Employee(EmployeeID),
    BaseSalary MONEY NOT NULL,
    Bonus MONEY NULL,
    SalaryEffectiveDate DATE NOT NULL
);

-- -------------------------
-- Insert Customers (15+)
-- -------------------------
INSERT INTO dbo.Customer (CustomerFirstName, CustomerLastName, CustomerAddress, CustomerSuburb, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
VALUES 
('John', 'Doe', '123 Elm St', 'Northside', 'New York', '1001', '123456789001'),
('Jane', 'Smith', '456 Oak Ave', 'Westend', 'Los Angeles', '9002', '123456789002'),
('Alice', 'Johnson', '789 Pine Rd', NULL, 'Chicago', NULL, '123456789003'),
('Bob', 'Lee', '101 Maple St', 'Downtown', 'Houston', '77001', '123456789004'),
('Carol', 'King', '202 Cedar St', 'Southside', 'Phoenix', '85001', '123456789005'),
('David', 'Wright', '303 Birch Ln', NULL, 'Philadelphia', NULL, '123456789006'),
('Emma', 'Stone', '404 Aspen Blvd', 'Eastside', 'San Diego', '92101', '123456789007'),
('Frank', 'Castle', '505 Spruce Dr', 'Northwest', 'Dallas', '75201', '123456789008'),
('Grace', 'Hall', '606 Walnut Way', 'Westhill', 'San Jose', '95101', '123456789009'),
('Henry', 'Ford', '707 Chestnut Ct', NULL, 'Austin', NULL, '123456789010'),
('Ivy', 'Brooks', '808 Poplar St', 'Old Town', 'Jacksonville', '32099', '123456789011'),
('Jack', 'Davis', '909 Hickory Ave', 'Lakeside', 'San Francisco', '94101', '123456789012'),
('Karen', 'Lopez', '111 Sycamore Ln', NULL, 'Columbus', NULL, '123456789013'),
('Leo', 'Nguyen', '222 Fir Ct', 'Highland', 'Fort Worth', '76101', '123456789014'),
('Mia', 'Turner', '333 Larch Rd', 'Greenfield', 'Charlotte', '28201', '123456789015'),
('Nate', 'Young', '444 Dogwood Dr', NULL, 'Seattle', NULL, '123456789016');

-- -------------------------
-- Insert Inventory (5�10 items)
-- -------------------------
INSERT INTO dbo.Inventory (InventoryName, InventoryDescription)
VALUES 
('Laptop', '15-inch high-performance laptop'),
('Smartphone', 'Latest 5G-enabled smartphone'),
('Tablet', '10-inch touchscreen tablet'),
('Monitor', '24-inch LED display'),
('Keyboard', 'Mechanical keyboard'),
('Mouse', 'Wireless optical mouse'),
('Printer', 'All-in-one color printer'),
('Webcam', 'HD video webcam'),
('Router', 'Dual-band Wi-Fi router'),
('Headphones', 'Bluetooth noise-cancelling headphones');

-- -------------------------
-- Insert Employees (15+)
-- -------------------------
INSERT INTO dbo.Employee (EmployeeFirstName, EmployeeLastName, EmployeeExtension)
VALUES
('Emily', 'Taylor', '1001'),
('Michael', 'Brown', '1002'),
('Sara', 'Wilson', '1003'),
('Thomas', 'Clark', '1004'),
('Rachel', 'Martinez', '1005'),
('Daniel', 'Lewis', '1006'),
('Natalie', 'Harris', '1007'),
('Peter', 'Walker', '1008'),
('Olivia', 'Scott', '1009'),
('James', 'Hall', '1010'),
('Sophia', 'Green', '1011'),
('Logan', 'Baker', '1012'),
('Zoe', 'Adams', '1013'),
('Ethan', 'Nelson', '1014'),
('Lily', 'Carter', '1015'),
('Aiden', 'Reed', '1016');

-- -------------------------
-- Insert Employee Demographics
-- -------------------------
INSERT INTO dbo.EmployeeDemographics (EmployeeID, DateOfBirth, Gender, MaritalStatus, Nationality)
VALUES
(1, '1990-06-01', 'Female', 'Single', 'American'),
(2, '1985-08-12', 'Male', 'Married', 'American'),
(3, '1992-11-20', 'Female', 'Single', 'Canadian'),
(4, '1988-01-15', 'Male', 'Married', 'British'),
(5, '1991-07-22', 'Female', 'Single', 'American'),
(6, '1983-04-11', 'Male', 'Divorced', 'Australian'),
(7, '1995-12-30', 'Female', 'Single', 'Canadian'),
(8, '1989-03-17', 'Male', 'Married', 'Irish'),
(9, '1990-09-10', 'Female', 'Single', 'American'),
(10, '1987-05-18', 'Male', 'Married', 'New Zealander'),
(11, '1993-10-27', 'Female', 'Single', 'American'),
(12, '1986-08-05', 'Male', 'Married', 'American'),
(13, '1994-02-23', 'Female', 'Single', 'Canadian'),
(14, '1982-11-02', 'Male', 'Married', 'British'),
(15, '1996-06-09', 'Female', 'Single', 'Australian'),
(16, '1991-03-30', 'Male', 'Single', 'American');

-- -------------------------
-- Insert Employee Salary
-- -------------------------
INSERT INTO dbo.EmployeeSalary (EmployeeID, BaseSalary, Bonus, SalaryEffectiveDate)
VALUES
(1, 60000, 5000, '2024-01-01'),
(2, 70000, 6000, '2024-01-01'),
(3, 55000, 4000, '2024-01-01'),
(4, 62000, 5500, '2024-01-01'),
(5, 59000, 3000, '2024-01-01'),
(6, 73000, 7000, '2024-01-01'),
(7, 56000, 3500, '2024-01-01'),
(8, 64000, 4500, '2024-01-01'),
(9, 58000, 3200, '2024-01-01'),
(10, 69000, 4800, '2024-01-01'),
(11, 61000, 4100, '2024-01-01'),
(12, 72000, 6700, '2024-01-01'),
(13, 54000, 2900, '2024-01-01'),
(14, 76000, 7100, '2024-01-01'),
(15, 55000, 3000, '2024-01-01'),
(16, 57000, 3500, '2024-01-01');

-- -------------------------
-- Insert Sales (20 rows)
-- -------------------------
INSERT INTO dbo.Sale (CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES
(1, 1, 1, '2024-01-10', 1, 1200),
(2, 2, 2, '2024-01-11', 2, 800),
(3, 3, 3, '2024-01-12', 1, 600),
(4, 4, 4, '2024-01-13', 1, 200),
(5, 5, 5, '2024-01-14', 3, 100),
(6, 6, 6, '2024-01-15', 2, 250),
(7, 7, 7, '2024-01-16', 1, 450),
(8, 8, 8, '2024-01-17', 1, 300),
(9, 9, 9, '2024-01-18', 4, 150),
(10, 10, 10, '2024-01-19', 2, 500),
(11, 1, 11, '2024-01-20', 1, 1200),
(12, 2, 12, '2024-01-21', 2, 800),
(13, 3, 13, '2024-01-22', 1, 600),
(14, 4, 14, '2024-01-23', 1, 200),
(15, 5, 15, '2024-01-24', 3, 100),
(16, 6, 16, '2024-01-25', 2, 250),
(3, 7, 1, '2024-01-26', 1, 450),
(5, 8, 2, '2024-01-27', 1, 300),
(6, 9, 3, '2024-01-28', 4, 150),
(7, 10, 4, '2024-01-29', 2, 500);

