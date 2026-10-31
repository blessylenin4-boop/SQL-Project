CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
SHOW TABLES;
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);
SHOW TABLES;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    age INT CHECK (age >= 18),
    designation VARCHAR(50),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,

    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
SHOW TABLES;

ALTER TABLE Employees
ADD email VARCHAR(100);
SHOW TABLES;

ALTER TABLE Employees
MODIFY designation VARCHAR(100);
SHOW TABLES;

ALTER TABLE Employees
DROP COLUMN age;
SHOW TABLES;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;

SHOW TABLES;
