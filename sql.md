---
layout: default
title: SQL
parent: Languages Library
nav_order: 4
---

# SQL Syntax

## 8.4.3 SQL Syntax Overview

Like all programming languages, SQL has a standard syntax and a set of reserved words.

**Important:**  
There is an official SQL standard (SQL-92), but in practice many database systems treat it as a starting point rather than a strict rulebook. Most DBMSs implement their own SQL “flavor,” optimized for specific use cases and database designs. As a result, SQL code may not be fully portable across systems.

Using proprietary SQL features can improve performance, but it also creates vendor lock-in and may require rewriting code if the database system changes.

These notes use the SQL flavor implemented by **DuckDB**.

While the Tidyverse uses *functions as verbs* to manipulate data, SQL relies on **statements**, which are composed of clauses, expressions, and other syntactic building blocks.

---

### SQL Language Building Blocks

| Type | Examples | Role / Purpose |
|----|----|----|
| Statements | SELECT, INSERT, UPDATE, DELETE, CREATE, DROP | Complete SQL commands that tell the database what action to perform. |
| Clauses | FROM, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, JOIN | Sub-components of statements that define how the action is carried out. |
| Expressions | CASE, arithmetic (`a + b`), boolean (`x > 5`), concatenation | Return a single value, often used inside clauses. |
| Functions | Aggregate: `SUM()`, `AVG()`, `COUNT()`<br>Scalar: `ROUND()`, `UPPER()`, `NOW()` | Built-in operations that transform values or sets of values. |
| Modifiers | DISTINCT, ALL, TOP, AS | Adjust or qualify clause or expression behavior. |
| Predicates | IN, BETWEEN, LIKE, IS NULL, EXISTS | Conditions that return TRUE/FALSE. |
| Operators | =, <, >, AND, OR, NOT, +, -, *, / | Compare or combine values. |
| Keywords | NULL, PRIMARY KEY, FOREIGN KEY, DEFAULT, CHECK | Reserved words defining grammar and constraints. |

A **statement** is a complete executable command.  
A **clause** is a phrase within a statement.  
An **expression** is a formula inside a clause.  
A **function** performs a calculation.  
**Modifiers** adjust behavior.  
**Predicates** evaluate conditions.  
**Operators** perform comparisons or calculations.  
**Keywords** define SQL’s grammar.

---

### Structure of a SQL Statement

SQL Statement (e.g., SELECT)
│
├── Clauses (parts of the statement)
│   ├── FROM (which tables?)
│   ├── WHERE (filter rows before grouping)
│   │   └── Predicates (IN, BETWEEN, LIKE, IS NULL, EXISTS)
│   │       └── Expressions (x > 5, col1 + col2)
│   ├── GROUP BY (form groups)
│   ├── HAVING (filter groups after aggregation)
│   │   └── Aggregate Functions (SUM, AVG, COUNT, MIN, MAX)
│   ├── SELECT (choose fields/expressions to return)
│   │   ├── Expressions (CASE, arithmetic, concatenation)
│   │   │   └── Functions (ROUND, UPPER, NOW, SQRT, etc.)
│   │   └── Modifiers (DISTINCT, AS alias)
│   ├── ORDER BY (sort results)
│   └── LIMIT / OFFSET (restrict result size)
│
├── Operators (math: +, -, *, / ; logic: AND, OR, NOT ; comparison: =, <, >)
│
└── Keywords (NULL, DEFAULT, PRIMARY KEY, FOREIGN KEY, CHECK, etc.)


---

### Where SQL Is Used

- **Database setup:** CREATE DATABASE, CREATE TABLE  
- **Data management:** INSERT, UPDATE, DELETE, DROP TABLE, ALTER TABLE  
- **Data retrieval and analysis:** SELECT  

This course focuses primarily on **SELECT** statements.

---

## 8.4.4 The SELECT Statement

The `SELECT` statement is the core SQL tool for retrieving and manipulating data, similar to combining `select()`, `filter()`, `arrange()`, and `summarise()` in `dplyr`.

Key components:

- **FROM**: identifies the table(s) used.
- **WHERE**: filters rows (like `filter()`).
- **ORDER BY**: sorts rows (like `arrange()`).
- **GROUP BY**: groups data for aggregation (like `group_by()`).
- **Aggregate functions**: `SUM()`, `AVG()`, `COUNT()`, etc.

Common modifiers:

- **AS**: rename columns or tables.
- **IN**: test membership.
- **DISTINCT**: remove duplicates.
- **LIMIT**: restrict output size.

### SELECT Operators

- Use `=` for comparison (not `==`).
- Use `!=` for “not equal.”
- SQL uses `NULL` instead of `NA`.
- Test missing values with `IS NULL` or `IS NOT NULL`.
- Logical operators: `AND`, `OR`, `NOT`.

---

## 8.4.5 SQL Syntax Rules to Remember

**Case sensitivity**
- SQL keywords are case-insensitive.
- Best practice: keywords in **UPPERCASE**, table and column names in lowercase.

**Order matters**
- Clauses must follow this order:
- SELECT → FROM → WHERE → GROUP BY → ORDER BY


**Whitespace and formatting**
- SQL ignores extra spaces and line breaks.
- Best practice: place each clause on its own line and align keywords.

**Quoting rules**
- String values: single quotes (`'NYC'`).
- Identifiers: double quotes (`"first name"`) if they contain spaces or special characters.

**Comments**
- Single-line: `-- comment`
- Multi-line: `/* comment */`

**Statement termination**
- Some databases require semicolons (`;`).
- Best practice: always include `;`.

Together, these rules make SQL rigid in structure but forgiving in formatting.


# SQL: Basic Commands

Welcome to the SQL Pages. This section covers the fundamental commands needed to interact with a database: creating tables, inserting data, and querying information.

* **DQL (Data Query Language):** Getting data out (`SELECT`).
* **DML (Data Manipulation Language):** Putting data in and changing it (`INSERT`, `UPDATE`, `DELETE`).
* **DDL (Data Definition Language):** defining the structure (`CREATE`, `DROP`).

---

## 1. Retrieving Data (SELECT)

The most common operation in SQL. Use `SELECT` to specify columns and `FROM` to specify the table.

### Select All Columns
Retrieve every column and every row from a table.

```sql
SELECT * FROM users;
Select Specific Columns
Retrieve only specific columns (more efficient).

SELECT first_name, email 
FROM users;
Select Distinct
Return unique values only (removes duplicates).

SELECT DISTINCT country 
FROM users;
```

## 2. Filtering Data (WHERE)
Use the WHERE clause to filter rows that meet specific conditions.

Basic Comparison
Filter using standard operators: =, >, <, >=, <=, <> (not equal).

```sql
SELECT * FROM products 
WHERE price > 50;
```

Logical Operators (AND, OR, NOT)
Combine multiple conditions.

```sql
-- Both conditions must be true
SELECT * FROM users 
WHERE age > 18 AND city = 'New York';

-- At least one condition must be true
SELECT * FROM users 
WHERE city = 'New York' OR city = 'London';
```

Pattern Matching (LIKE)
Search for a specified pattern in a column.

* % represents zero, one, or multiple characters.
* _ represents a single character.

```sql

-- Finds names starting with 'A'
SELECT * FROM users 
WHERE name LIKE 'A%';

-- Finds emails ending in '.com'
SELECT * FROM users 
WHERE email LIKE '%.com';
```

IN Operator
Specify multiple possible values for a column.

```sql
SELECT * FROM users 
WHERE country IN ('USA', 'Canada', 'Mexico');
```

## 3. Sorting and Limiting
Order By
Sort the result set in ascending (ASC) or descending (DESC) order.

```sql
SELECT * FROM products 
ORDER BY price DESC;
```

Limit
Restrict the number of rows returned (useful for large tables).

```sql
-- Get the top 5 most expensive products
SELECT * FROM products 
ORDER BY price DESC 
LIMIT 5;
```

## 4. Modifying Data (DML)
Insert
Add new rows to a table.

```sql
INSERT INTO users (first_name, email, age) 
VALUES ('John', 'john@example.com', 30);
```

Update
Modify existing data. Always use a WHERE clause, or you will update every row!

```sql
UPDATE users 
SET age = 31 
WHERE email = 'john@example.com';
```

Delete
Remove rows from a table. Always use a WHERE clause!

```sql
DELETE FROM users 
WHERE id = 5;
```

## 5. Defining Tables (DDL)
Create Table
Create a new table with specific data types.

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    created_at DATE
);
```

Drop Table
Delete a table and all of its data permanently.

```sql
DROP TABLE users;
```

---

# SQL: Intermediate Commands
Once you master the basics, intermediate SQL allows you to analyze data and combine information from different parts of your database.

## 6. Joins (Connecting Tables)
Joins allow you to combine rows from two or more tables based on a related column between them.

Inner Join
Returns records that have matching values in both tables.

```sql
SELECT orders.id, users.username
FROM orders
INNER JOIN users ON orders.user_id = users.id;
```

Left (Outer) Join
Returns all records from the left table, and the matched records from the right table. If no match, results from the right side are NULL.

```sql
SELECT users.username, orders.id
FROM users
LEFT JOIN orders ON users.id = orders.user_id;
```

Right (Outer) Join
Returns all records from the right table, and the matched records from the left table.

```sql
SELECT orders.id, employees.name
FROM orders
RIGHT JOIN employees ON orders.employee_id = employees.id;
```

## 7. Aggregate FunctionsThese functions perform a calculation on a set of values and return a single value.

| Function | Description |
| :--- | :--- |
| `COUNT()` | Returns the number of rows that match a specified criterion. |
| `SUM()` | Returns the total sum of a numeric column. |
| `AVG()` | Returns the average value of a numeric column. |
| `MIN()` | Returns the smallest value of the selected column. |
| `MAX()` | Returns the largest value of the selected column. |

```sql
-- Get the total number of orders
SELECT COUNT(*) FROM orders;

-- Get the average price of all products
SELECT AVG(price) FROM products;
```

## 8. Grouping Data (GROUP BY)
The GROUP BY statement groups rows that have the same values into summary rows. It is almost always used with aggregate functions.
Basic Grouping

```sql
-- Count how many users are in each city
SELECT city, COUNT(id)
FROM users
GROUP BY city;
```

Filtering Groups (HAVING)
Use HAVING instead of WHERE when you need to filter based on the result of an aggregate function.

```sql
-- Show cities with more than 10 users
SELECT city, COUNT(id)
FROM users
GROUP BY city
HAVING COUNT(id) > 10;
```

## 9. Aliases (AS)
Aliases are used to give a table or a column a temporary name to make headings more readable or to shorten long table names.

```sql
-- Column Alias
SELECT first_name AS "Name", last_name AS "Surname"
FROM users;

-- Table Alias (Useful for Joins)
SELECT u.username, o.order_date
FROM users AS u
JOIN orders AS o ON u.id = o.user_id;
```

## 10. Constraints
Constraints are rules applied to columns to limit the type of data that can go into a table.

* NOT NULL: Ensures a column cannot have a NULL value.
* UNIQUE: Ensures all values in a column are different.
* PRIMARY KEY: A combination of NOT NULL and UNIQUE.
* FOREIGN KEY: Prevents actions that would destroy links between tables.
* DEFAULT: Sets a default value for a column if no value is specified.

```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) DEFAULT 0.00,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
```

---

# SQL: Advanced Commands
Advanced SQL moves beyond simple data retrieval into sophisticated analysis, hierarchical data, and performance optimization.

## 11. Common Table Expressions (CTEs)
A CTE is a temporary result set that you can reference within another SELECT, INSERT, UPDATE, or DELETE statement. It makes complex queries much more readable than nested subqueries.

```sql
-- Define the CTE using "WITH"
WITH MonthlySales AS (
    SELECT 
        product_id, 
        SUM(amount) AS total_revenue
    FROM orders
    WHERE order_date >= '2024-01-01'
    GROUP BY product_id
)
-- Use the CTE in your main query
SELECT p.name, ms.total_revenue
FROM products p
JOIN MonthlySales ms ON p.id = ms.product_id
WHERE ms.total_revenue > 1000;
```

## 12. Window Functions
Window functions perform calculations across a set of table rows that are related to the current row. Unlike GROUP BY, they do not collapse rows into a single output.

| Function | Purpose |
| :--- | :--- |
| `ROW_NUMBER()` | Assigns a unique sequential integer to rows within a partition. |
| `RANK()` | Assigns a rank to each row; leaves gaps in the ranking sequence if there are ties. |
| `DENSE_RANK()` | Assigns a rank to each row; does **not** skip numbers after ties. |
| `LAG()` | Accesses data from a previous row in the same result set without a self-join. |
| `LEAD()` | Accesses data from a subsequent row in the same result set. |

Example: Running Total

```sql
SELECT 
    order_date, 
    amount,
    SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
```

Example: Ranking Products by Price

```sql
SELECT 
    name, 
    category, 
    price,
    RANK() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
FROM products;
```

## 13. Case Expressions (Conditional Logic)
The CASE statement is SQL's version of if-then-else logic.

```sql
SELECT name, price,
    CASE 
        WHEN price > 100 THEN 'Expensive'
        WHEN price > 50 THEN 'Moderate'
        ELSE 'Budget'
    END AS price_category
FROM products;
```

## 14. Performance & Optimization
Indexing
Indexes are used to retrieve data from the database more quickly.

```sql
-- Create an index on frequently searched columns
CREATE INDEX idx_user_email ON users(email);
```

Explain Plan
Use EXPLAIN before a query to see how the database engine intends to execute it. This is vital for finding slow "Full Table Scans."

```sql
EXPLAIN SELECT * FROM users WHERE email = 'test@example.com';
```

## 15. Resources & Practice

To keep improving your skills, use these open-source schemas and practice platforms to test your queries.

---

### Open Source Schemas (Skeemas)
These are famous "sample databases" you can download to practice complex queries against realistic data structures.

* **[James Bond Movie Dataset](https://github.com/IpayeBabatunde/SQL-DATABASE-James-Bond-Movie-till-date-):** A specialized database including years, producers, directors, and box office sales for every Bond film.
* **[James Bond Gadgets DB](https://github.com/shadsluiter/JamesBondGadgets):** A fun SQL database containing over 300 items and gadgets featured throughout the franchise.
* **[Chinook Database](https://github.com/lerocha/chinook-database):** Represents a digital media store (artists, albums, tracks). Excellent for practicing complex `JOIN` logic.
* **[Northwind & Sakila](https://github.com/pthom/northwind_psql):** The industry standard "Classic ERP" and DVD rental store schemas used in almost all SQL textbooks.

---

### Places to Practice
1.  **[SQLZoo](https://sqlzoo.net/):** Interactive, step-by-step tutorials that allow you to write queries directly in the browser. Great for absolute beginners.
2.  **[HackerRank (SQL)](https://www.hackerrank.com/domains/sql):** Offers a wide range of challenges categorized by difficulty from Easy to Advanced.
3.  **[LeetCode (Database)](https://leetcode.com/problemset/database/):** The best platform for practicing "Interview Style" logic and performance-heavy problems.
4.  **[SQL Fiddle](https://sqlfiddle.com/):** A useful tool for sharing snippets or testing schema builds without needing to install a local database.