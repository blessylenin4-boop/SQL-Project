# E-Learning Purchase Analysis

### SQL Database Design, Implementation and Business Insights

## 1. Project Overview

The E-Learning Purchase Analysis project focuses on developing a relational database using MySQL to analyse learner purchasing activities on an e-learning platform.

The project manages learner information, course details and purchase transactions. SQL queries are used to retrieve, combine and analyse data to identify purchasing patterns, course demand and revenue generation.

## 2. Database Design and Sample Data

The project uses a database named `elearning`, consisting of three related tables:

| Table | Description |
|---|---|
| learners | Stores learner details such as ID, name and country. |
| courses | Stores course names, categories and unit prices. |
| purchases | Records purchase details, quantities and purchase dates. |

**Database Relationships:**
- Primary keys uniquely identify records.
- Foreign keys connect the learners and courses tables with the purchases table.
- Each learner can have multiple purchases.
- Each course can appear in multiple purchase records.

**Sample Data:**
- 5 learners
- 5 courses
- 8 purchase transactions

## 3. SQL Retrieval and JOIN Operations

SQL queries are used to retrieve information from multiple related tables.

The following JOIN operations are implemented:

- **INNER JOIN:** Retrieves matching records from related tables.
- **LEFT JOIN:** Returns all records from the left table, including matching records from the right table.
- **RIGHT JOIN:** Returns all records from the right table, including matching records from the left table.

Calculated columns are also used to determine purchase amounts by multiplying quantity by course unit price.

## 4. Aggregations and Business Analysis

Aggregate functions and grouping techniques are used to analyse learner spending, course sales and category-wise revenue.

**SQL Concepts Implemented:**
- SUM()
- COUNT()
- COUNT(DISTINCT)
- GROUP BY
- HAVING
- ORDER BY
- FORMAT()

**Key Analysis Results:**

| Analysis | Result |
|---|---|
| Total Purchase Value | 6,689.00 |
| Highest Spending Learner | David Lee |
| Highest Spending | 1,897.00 |
| Most Purchased Course | Data Analytics |
| Units Sold | 4 |
| Highest Revenue Category | Data Science |
| Category Revenue | 3,695.00 |

Data Science generated the highest revenue, while Data Analytics recorded the highest purchase quantity.

## 5. Findings, Recommendations and Conclusion

**Key Findings:**
- David Lee recorded the highest total spending.
- Data Analytics was the most purchased course.
- Data Science generated the highest category-wise revenue.
- Arun Kumar and David Lee purchased courses from multiple categories.
- All five courses recorded purchases in the sample dataset.

**Recommendations:**
- Expand the dataset with additional purchase records.
- Apply appropriate constraints to improve data quality.
- Improve sorting when multiple courses have equal sales quantities.
- Consider indexes on foreign-key columns for larger databases.

**Conclusion:**

This project demonstrates the practical application of SQL in relational database management and business analysis. It covers database creation, table relationships, data retrieval, JOIN operations and aggregate functions.

The project helped strengthen practical knowledge of MySQL, database design and SQL-based data analysis.

---

**Project Title:** E-Learning Purchase Analysis  
**Database:** MySQL  
**Project Domain:** Database Management and Data Analysis
