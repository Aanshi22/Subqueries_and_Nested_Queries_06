USE Ecommerce;
 -- 1. Subquery in SELECT clause (Scalar Subquery)
 SELECT name,
    (SELECT COUNT(*) FROM `Order` o WHERE o.customer_id = c.customer_id) AS total_orders
FROM Customer c;

-- 2. Subquery in WHERE clause using IN
SELECT name FROM Customer
WHERE customer_id IN (
    SELECT customer_id FROM `Order` WHERE status = 'Delivered'
);

-- 3. Subquery in WHERE clause using EXISTS
SELECT name FROM Customer c
WHERE EXISTS (
    SELECT 1 FROM `Order` o
    WHERE o.customer_id = c.customer_id AND o.status = 'Cancelled'
);

-- 4. Scalar Subquery using =
SELECT name FROM Customer
WHERE customer_id = (
    SELECT customer_id FROM `Order` ORDER BY order_date ASC LIMIT 1
);

-- 5. Subquery in FROM clause (Derived Table)
SELECT customer_id, total_spent FROM (
    SELECT o.customer_id, SUM(p.amount) AS total_spent
    FROM Payment p
    JOIN `Order` o ON o.order_id = p.order_id
    GROUP BY o.customer_id
) AS customer_payment
WHERE total_spent > 30000;

-- 6. Correlated Subquery with Comparison
SELECT name FROM Customer c
WHERE (
    SELECT COUNT(*) FROM `Order` o
    WHERE o.customer_id = c.customer_id
) >= 2;

--  7. Subquery in WHERE with aggregate
SELECT name FROM Customer
WHERE customer_id IN (
    SELECT customer_id FROM `Order`
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

--  8. Nested Subqueries
SELECT name FROM Customer
WHERE customer_id IN (
    SELECT customer_id FROM `Order`
    WHERE order_id IN (
        SELECT order_id FROM Payment WHERE status = 'Paid'
    )
);