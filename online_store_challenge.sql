-- Create the database if it does not exist
CREATE DATABASE online_store;

-- Select the database to use
USE online_store;

-- Create customers table 
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
)

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price NUMERIC(10,2),
    quantity INTEGER,
    register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

-- Create orders table
CREATE TYPE order_status AS ENUM('pending', 'shipped', 'delivered', 'canceled');

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status order_status DEFAULT 'pending',
    total NUMERIC(10,2) 
)

-- Add foreign keys to create relationships between tables
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Create order_items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    subtotal NUMERIC(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
)

-- Insert data into customers table
INSERT INTO customers (firstname, lastname, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765'),
('Bob', 'Williams', 'bob.williams@example.com', '555-4321'),
('Michael', 'Brown', 'michael.brown@example.com', '555-1111'),
('Emily', 'Davis', 'emily.davis@example.com', '555-2222'),
('David', 'Miller', 'david.miller@example.com', '555-3333'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '555-4444'),
('Chris', 'Moore', 'chris.moore@example.com', '555-5555'),
('Olivia', 'Taylor', 'olivia.taylor@example.com', '555-6666'),
('Daniel', 'Anderson', 'daniel.anderson@example.com', '555-7777'),
('Sophia', 'Thomas', 'sophia.thomas@example.com', '555-8888'),
('James', 'Jackson', 'james.jackson@example.com', '555-9999'),
('Isabella', 'White', 'isabella.white@example.com', '555-1010'),
('Matthew', 'Harris', 'matthew.harris@example.com', '555-1212'),
('Ava', 'Martin', 'ava.martin@example.com', '555-1313'),
('Ethan', 'Thompson', 'ethan.thompson@example.com', '555-1414'),
('Mia', 'Garcia', 'mia.garcia@example.com', '555-1515'),
('Lucas', 'Martinez', 'lucas.martinez@example.com', '555-1616'),
('Charlotte', 'Robinson', 'charlotte.robinson@example.com', '555-1717');

-- Insert data into products table
INSERT INTO products (name, description, price, quantity) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse with USB receiver', 79.90, 100),
('Mechanical Keyboard', 'RGB backlit mechanical keyboard', 299.00, 50),
('HD Monitor', '27-inch Full HD monitor', 899.00, 30),
('USB-C Cable', '1.5m USB-C to USB-A cable', 29.90, 200),
('Laptop Stand', 'Adjustable aluminum stand for laptops', 159.90, 40),
('Bluetooth Headphones', 'Noise-canceling over-ear headphones with Bluetooth 5.0', 499.00, 60),
('Gaming Chair', 'Ergonomic gaming chair with adjustable height and lumbar support', 899.00, 25),
('Smartwatch', 'Fitness smartwatch with heart rate and sleep tracking', 699.00, 40),
('External Hard Drive 1TB', 'Portable USB 3.0 hard drive, 1TB storage', 399.00, 80),
('Webcam HD 1080p', 'High-definition webcam with built-in microphone', 249.00, 70),
('Microphone USB', 'Cardioid condenser microphone for streaming and podcasting', 379.00, 35),
('Desk Lamp LED', 'Adjustable LED desk lamp with touch controls and brightness levels', 129.00, 100),
('Wireless Charger', 'Fast wireless charger compatible with Qi devices', 199.00, 90),
('Portable Speaker', 'Bluetooth waterproof speaker with 12h battery life', 329.00, 50),
('Graphic Tablet', 'Drawing tablet with pressure-sensitive stylus', 599.00, 20),
('Smartphone Stand', 'Foldable aluminum stand for smartphones and tablets', 89.00, 150),
('HDMI Cable 2m', 'High-speed HDMI cable, supports 4K UHD resolution', 39.90, 300),
('USB Hub 4-Port', 'Compact USB 3.0 hub with 4 ports', 149.00, 120),
('Mechanical Pencil Set', 'Professional drafting pencil set with extra leads', 49.90, 200),
('Office Chair', 'Ergonomic office chair with mesh backrest', 749.00, 30);

-- Insert data into orders table
INSERT INTO orders (customer_id, order_date, status, total) VALUES
(1, '2025-10-07 09:00:00', 'pending',   499.00),
(2, '2025-10-07 09:20:00', 'delivered', 899.00),
(3, '2025-10-07 09:40:00', 'shipped',   159.80),
(4, '2025-10-07 10:00:00', 'pending',   699.00),
(5, '2025-10-07 10:20:00', 'delivered', 299.00),
(6, '2025-10-07 10:40:00', 'pending',   349.80),
(7, '2025-10-07 11:00:00', 'shipped',   379.00),
(8, '2025-10-07 11:20:00', 'delivered', 978.90),
(9, '2025-10-07 11:40:00', 'pending',   89.90),
(10, '2025-10-07 12:00:00', 'canceled',  0.00),
(11, '2025-10-07 12:20:00', 'pending',   199.00),
(12, '2025-10-07 12:40:00', 'shipped',   599.00),
(13, '2025-10-07 13:00:00', 'delivered', 928.90),
(14, '2025-10-07 13:20:00', 'pending',   259.80),
(15, '2025-10-07 13:40:00', 'delivered', 329.00),
(16, '2025-10-07 14:00:00', 'shipped',   189.80),
(17, '2025-10-07 14:20:00', 'pending',   59.80),
(18, '2025-10-07 14:40:00', 'delivered', 1048.90),
(19, '2025-10-07 15:00:00', 'pending',   79.90),
(20, '2025-10-07 15:20:00', 'shipped',   188.70),
(1, '2025-08-15 09:30:00', 'delivered', 749.00),
(2, '2025-07-10 14:45:00', 'delivered', 899.00),
(3, '2025-06-25 16:10:00', 'pending', 299.00),
(4, '2025-04-12 11:50:00', 'delivered', 129.00),
(5, '2025-09-02 17:20:00', 'shipped', 329.00),
(6, '2025-05-03 10:00:00', 'pending', 749.00),
(7, '2025-02-18 13:25:00', 'delivered', 199.00),
(8, '2025-09-29 18:40:00', 'delivered', 399.00),
(9, '2025-08-22 08:20:00', 'pending', 379.00),
(10, '2025-07-30 09:15:00', 'shipped', 299.00),
(11, '2025-06-05 15:40:00', 'delivered', 129.00),
(12, '2025-05-28 20:10:00', 'delivered', 849.00),
(13, '2025-09-10 09:50:00', 'pending', 599.00),
(14, '2025-09-01 15:10:00', 'delivered', 249.00),
(15, '2025-03-20 08:30:00', 'delivered', 999.00),
(16, '2025-09-26 19:15:00', 'shipped', 399.00),
(17, '2025-06-10 11:30:00', 'pending', 649.00),
(18, '2025-04-17 10:20:00', 'delivered', 599.00),
(19, '2025-09-23 14:55:00', 'delivered', 899.00),
(20, '2025-08-28 07:45:00', 'shipped', 749.00);

-- Insert data into order_items table
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES
(1, 6, 1, 499.00, 499.00),

(2, 7, 1, 899.00, 899.00),

(3, 4, 2, 29.90, 59.80),
(3, 1, 1, 79.90, 79.90),

(4, 8, 1, 699.00, 699.00),

(5, 2, 1, 299.00, 299.00),

(6, 5, 1, 159.90, 159.90),
(6, 4, 2, 29.90, 59.80),
(6, 1, 1, 79.90, 79.90),

(7, 11, 1, 379.00, 379.00),

(8, 3, 1, 899.00, 899.00),
(8, 4, 2, 29.90, 59.80),
(8, 1, 1, 19.90, 19.90),

(9, 16, 1, 89.00, 89.00),

(10, 14, 1, 329.00, 329.00),

(11, 13, 1, 199.00, 199.00),

(12, 15, 1, 599.00, 599.00),

(13, 3, 1, 899.00, 899.00),
(13, 4, 1, 29.90, 29.90),

(14, 5, 1, 159.90, 159.90),
(14, 4, 1, 29.90, 29.90),
(14, 1, 1, 69.90, 69.90),

(15, 10, 1, 249.00, 249.00),
(15, 4, 2, 39.90, 79.80),

(16, 5, 1, 159.90, 159.90),
(16, 4, 1, 29.90, 29.90),

(17, 4, 2, 29.90, 59.80),

(18, 3, 1, 899.00, 899.00),
(18, 2, 1, 299.00, 299.00),
(18, 4, 2, 29.90, 59.80),

(19, 1, 1, 79.90, 79.90),

(20, 5, 1, 159.90, 159.90),
(20, 4, 1, 29.90, 29.90),

(21, 20, 1, 749.00, 749.00),

(22, 7, 1, 899.00, 899.00),

(23, 2, 1, 299.00, 299.00),

(24, 12, 1, 129.00, 129.00),

(25, 14, 1, 329.00, 329.00),

(26, 20, 1, 749.00, 749.00),

(27, 13, 1, 199.00, 199.00),

(28, 9, 1, 399.00, 399.00),

(29, 11, 1, 379.00, 379.00),

(30, 2, 1, 299.00, 299.00),

(31, 12, 1, 129.00, 129.00),

(32, 7, 1, 849.00, 849.00),

(33, 15, 1, 599.00, 599.00),

(34, 10, 1, 249.00, 249.00),

(35, 7, 1, 999.00, 999.00),

(36, 9, 1, 399.00, 399.00),

(37, 6, 1, 649.00, 649.00),

(38, 15, 1, 599.00, 599.00),

(39, 3, 1, 899.00, 899.00),

(40, 20, 1, 749.00, 749.00);


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
FROM products.id NOT IN (
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


-- Create VIEW for all joins
SELECT *
FROM order_items

--
SELECT customers
FROM customers