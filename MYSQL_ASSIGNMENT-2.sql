USE employee;

SELECT * FROM employees;


SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM location;

SELECT DISTINCT salary
FROM employees;

SELECT *
FROM employees
WHERE salary > 50000;

SELECT *
FROM employees
WHERE hire_date > '2016-01-01';

SELECT *
FROM employees
WHERE designation IS NULL;

UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT *
FROM employees
WHERE designation = 'Data Scientist';

SELECT COUNT(*) FROM employees;

SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;

SELECT *
FROM employees
WHERE YEAR(hire_date) = 2018
LIMIT 5;

SELECT SUM(salary) AS Total_Finance_Salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Minimum_Age
FROM employees;

SELECT
    l.location_name,
    MAX(e.salary) AS Maximum_Salary
FROM employees e
INNER JOIN location l
ON e.location_id = l.location_id
GROUP BY l.location_name;

SELECT
    designation,
    AVG(salary) AS Average_Salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Employee_Count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) < 3;

SELECT
    l.location_name,
    AVG(e.age) AS Average_Age
FROM employees e
INNER JOIN location l
ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location_name
HAVING AVG(e.age) < 30;

SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

SELECT
    l.location_name,
    e.employee_name
FROM employees e
RIGHT JOIN location l
ON e.location_id = l.location_id;
