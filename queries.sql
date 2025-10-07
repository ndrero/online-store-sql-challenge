-- Selects the 10 customers who spent the most money in total
SELECT 
    CONCAT(c.firstname, ' ', c.lastname) AS name,
    SUM(o.total) as total_spent,
    COUNT(o.id) as total_orders
FROM order_items AS oi
INNER JOIN orders o
ON o.id = oi.order_id
INNER JOIN customers c
ON c.id = o.customer_id
GROUP BY CONCAT(c.firstname, ' ', c.lastname)
ORDER BY total_spent DESC
LIMIT 10

-- Returns the names of all products that have never been sold
SELECT p.name
FROM products p
WHERE p.id NOT IN (
    SELECT oi.product_id
    FROM order_items oi
)


-- Shows the average value of orders for each customer
SELECT 
    CONCAT(c.firstname, ' ', c.lastname) AS name,
    ROUND(AVG(o.total),2)
FROM orders o 
LEFT JOIN customers c 
ON c.id = o.customer_id
GROUP BY CONCAT(c.firstname, ' ', c.lastname)