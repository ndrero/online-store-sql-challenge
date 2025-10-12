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

-- List the customers whose total spending is greater than the overall average of all customers
SELECT 
    CONCAT(c.firstname, ' ', c.lastname) AS client,
    SUM(o.total) total_spent
FROM order_items oi
INNER JOIN orders o
ON o.id = oi.order_id
FULL JOIN products p
ON p.id = oi.product_id
FULL JOIN customers c
ON c.id = o.customer_id
GROUP BY CONCAT(c.firstname, ' ', c.lastname)
HAVING SUM(o.total) > (
    SELECT 
        AVG(o2.total)
    FROM orders o2
) 

/* Classify the products into two groups: 'Trending' if sold more than 10 times, 
and 'Low demand' if sold fewer than 3 times */
SELECT 
    p.name AS product_name,
    COUNT(oi.product_id) AS product_count,
    CASE 
        WHEN COUNT(oi.product_id) > 10 THEN  'Em alta'
        WHEN COUNT(oi.product_id) < 5 THEN  'Em baixa'
        ELSE 'Neutro'
    END AS status
FROM order_items oi
INNER JOIN products p
ON p.id = oi.product_id
GROUP BY(p.name)


-- Lists all orders whose total value is higher than the average total of all orders in the same month.
WITH avg_total_by_month AS (
    SELECT 
    id_order,
    client_name,
    total,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(
        AVG(total) OVER (PARTITION BY 
            EXTRACT(MONTH FROM order_date))
        ,2) AS avg_total_by_month
    FROM vw_customers_orders
)
SELECT * 
FROM avg_total_by_month a
WHERE a.total > a.avg_total_by_month;


-- Shows the most sold product
SELECT
    product,
    SUM(quantity_pursached) AS quantity_pursached
FROM vw_orders_with_products
GROUP BY product
ORDER BY quantity_pursached DESC
LIMIT 1

/* calculates an estimated profit for each product (assumed to be 25% of the sale price) 
and identifies the top 5 most profitable products based on the total quantity sold*/
SELECT 
    name,
    ROUND(price * 0.25,2) AS estimated_profit ,
    ROUND(SUM((p.price * oi.quantity* 0.25)),2) AS total_estimated_profit 
FROM order_items oi
JOIN products p
ON p.id = oi.product_id
GROUP BY name, price
ORDER BY total_estimated_profit DESC
LIMIT 5

-- Increases the price by 10% for all products that have been sold more than 10 times in total
SELECT 
    SUM(oi.quantity) AS quantity_sold,
    p.id
FROM order_items oi
JOIN products p
ON p.id = oi.product_id
GROUP BY p.id
HAVING SUM(oi.quantity) > 10

UPDATE products
SET price = price + price * 0.10
WHERE products.id IN (
    SELECT p.id
    FROM order_items oi
    JOIN products p
    ON p.id = oi.product_id
    GROUP BY p.id
    HAVING SUM(oi.quantity) > 10
)