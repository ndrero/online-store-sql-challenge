-- Create view that join customer on order
CREATE VIEW vw_customers_orders AS
SELECT 
    CONCAT(c.firstname, ' ', c.lastname) AS client_name,
    o.id AS id_order, 
    o.order_date, 
    o.status,
    o.total
FROM orders o
JOIN customers c
ON c.id = o.customer_id

-- Create view that join orders on orders_items
CREATE VIEW vw_orders_with_products AS
SELECT
    o.id AS id_order,
    p.name AS product,
    p.price AS product_price,
    oi.quantity AS quantity_pursached,
    o.total AS total_by_order
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.id
JOIN orders o 
    ON oi.order_id = o.id
