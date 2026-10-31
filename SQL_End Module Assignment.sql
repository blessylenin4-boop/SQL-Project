CREATE DATABASE elearning;
SHOW DATABASES;
USE elearning;
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);
SHOW TABLES;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);
SHOW TABLES;

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
SHOW TABLES;

DESCRIBE learners;
DESCRIBE courses;
DESCRIBE purchases;

INSERT INTO learners (learner_id, full_name, country) VALUES
(1, 'Arun Kumar', 'India'),
(2, 'Priya Sharma', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Maria Garcia', 'Spain'),
(5, 'David Lee', 'Singapore');
SELECT * FROM learners;

INSERT INTO courses (course_id, course_name, category, unit_price) VALUES
(101, 'Python Programming', 'Programming', 499.00),
(102, 'Data Analytics', 'Data Science', 699.00),
(103, 'SQL for Beginners', 'Database', 399.00),
(104, 'Power BI Basics', 'Data Visualization', 599.00),
(105, 'Machine Learning', 'Data Science', 899.00);
SELECT * FROM courses;

INSERT INTO purchases
(purchase_id, learner_id, course_id, quantity, purchase_date) VALUES
(1, 1, 101, 1, '2026-07-01'),
(2, 1, 102, 1, '2026-07-03'),
(3, 2, 103, 2, '2026-07-05'),
(4, 3, 102, 1, '2026-07-08'),
(5, 3, 105, 1, '2026-07-10'),
(6, 4, 104, 2, '2026-07-12'),
(7, 5, 101, 1, '2026-07-15'),
(8, 5, 102, 2, '2026-07-18');
SELECT * FROM purchases;

SELECT
    l.full_name,
    c.course_name,
    c.category,
    p.quantity,
    p.quantity * c.unit_price AS total_amount,
    p.purchase_date
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id;

SELECT
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id;
    
    SELECT
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT
    l.full_name AS learner_name,
    p.purchase_id,
    p.quantity,
    p.purchase_date
FROM learners AS l
LEFT JOIN purchases AS p
    ON l.learner_id = p.learner_id;
    
    SELECT
    l.full_name,
    p.purchase_id,
    p.quantity
FROM purchases AS p
RIGHT JOIN learners AS l
    ON p.learner_id = l.learner_id;
    
    SELECT
    l.full_name AS learner_name,
    l.country,
    p.quantity * c.unit_price AS purchase_amount
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id;
    
    SELECT
    l.full_name AS learner_name,
    l.country,
    SUM(p.quantity * c.unit_price) AS total_spending
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country;

SELECT
    l.full_name AS learner_name,
    l.country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spending
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
ORDER BY SUM(p.quantity * c.unit_price) DESC;

SELECT
    c.course_name,
    SUM(p.quantity) AS total_quantity_sold
FROM courses AS c
INNER JOIN purchases AS p
    ON c.course_id = p.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT
    c.category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses AS c
INNER JOIN purchases AS p
    ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY total_revenue DESC;

SELECT
    l.full_name AS learner_name,
    COUNT(DISTINCT c.category) AS category_count
FROM learners AS l
INNER JOIN purchases AS p
    ON l.learner_id = p.learner_id
INNER JOIN courses AS c
    ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1;

SELECT
    c.course_id,
    c.course_name,
    c.category
FROM courses AS c
LEFT JOIN purchases AS p
    ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;


    






