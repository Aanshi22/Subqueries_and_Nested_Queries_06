## Subqueries and Nested Queries – Task 06 
## (E-commerce SQL Project)

### This project demonstrates advanced SQL concepts such as **subqueries**, **scalar queries**, **correlated subqueries**, and **derived tables** using an E-commerce database. It is part of a structured learning task to master complex data filtering and logic construction using SQL.
---

## Objective
## Learn to use subqueries within SELECT, FROM, and WHERE clauses to perform advanced filtering, aggregation, and data transformation.

---

## Tools Used
- MySQL Workbench / DB Browser for SQLite  
- SQL (Structured Query Language)  
- ER Diagram Visualizer  
- Git & GitHub for version control

---
## Files Included

| File Name                                      | Description                                                       |
|------------------------------------------------|-------------------------------------------------------------------|
| `ecommerce_database.sql`                       | SQL script to create and populate the E-commerce database         |
| `Subqueries and Nested Queries_06.sql`         | Contains all subquery implementations (SELECT, WHERE, FROM)       |
| `Scalar Subquery using =.csv`                  | Output of a scalar subquery inside SELECT clause                  |
| `Subquery in SELECT clause (Scalar Subquery).csv` | Output of scalar subquery for customer order counts           |
| `Subquery in FROM clause (Derived Table).csv`  | Output of a derived table subquery used for aggregation           |
| `Subquery in WHERE clause using IN.csv`        | Result showing use of subquery within `IN` clause                 |
| `Subquery in WHERE clause using EXISTS.csv`    | Result showing correlated subquery with `EXISTS` logic            |
| `ER Diagram.png`                               | Entity-Relationship diagram of the E-commerce schema              |

---

## Key Concepts
-- Subqueries
    - Queries within queries
    - Used for filtering, aggregation, and row selection
-- Scalar Subqueries
    - Returns a single value
    - Typically used inside SELECT or as a comparison
-- Correlated Subqueries
      - Inner query depends on outer query
      - Often used with EXISTS

-- Derived Tables
    - Subquery used in the FROM clause
    - Acts like a temporary table

## Sample SQL Snippets
### Scalar Subquery (SELECT clause)
sql
`` SELECT 
    name,
    (SELECT COUNT(*) 
     FROM `Order` o 
     WHERE o.customer_id = c.customer_id) AS order_count
FROM Customer c; ``
### Subquery with EXISTS (WHERE clause)
sql
`` SELECT name
FROM Customer c
WHERE EXISTS (
    SELECT 1 
    FROM `Order` o 
    WHERE o.customer_id = c.customer_id AND o.status = 'Shipped'
); ``
### Derived Table (FROM clause)
sql
``
SELECT customer_id, total_amount
FROM (
    SELECT o.customer_id, SUM(p.amount) AS total_amount
    FROM `Order` o
    JOIN Payment p ON o.order_id = p.order_id
    GROUP BY o.customer_id
) AS customer_payments; ``

## Outcome
- advanced SQL skills including:
- Nested query handling
- Filtering data using conditional subqueries
- Creating derived logic for reports
