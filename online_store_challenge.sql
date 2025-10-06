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
ADD CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES products(id);

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


-- Insert data into order_items table
-- Order 5 (customer 5)
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES
(5, 2, 1, 299.00, 299.00);

-- Order 6 (customer 6)
INSERT INTO order_items VALUES
(DEFAULT, 6, 3, 1, 899.00, 899.00);

-- Order 7
INSERT INTO order_items VALUES
(DEFAULT, 7, 4, 2, 29.90, 59.80),
(DEFAULT, 7, 1, 1, 79.90, 79.90);

-- Order 8
INSERT INTO order_items VALUES
(DEFAULT, 8, 1, 1, 79.90, 79.90);

-- Order 9
INSERT INTO order_items VALUES
(DEFAULT, 9, 5, 1, 159.90, 159.90),
(DEFAULT, 9, 2, 1, 299.00, 299.00);

-- Order 10
INSERT INTO order_items VALUES
(DEFAULT, 10, 4, 2, 29.90, 59.80),
(DEFAULT, 10, 1, 1, 79.90, 79.90),
(DEFAULT, 10, 4, 1, 29.90, 29.90);

-- Order 11
INSERT INTO order_items VALUES
(DEFAULT, 11, 2, 1, 299.00, 299.00);

-- Order 12
INSERT INTO order_items VALUES
(DEFAULT, 12, 3, 1, 899.00, 899.00),
(DEFAULT, 12, 4, 2, 29.90, 59.80),
(DEFAULT, 12, 1, 1, 79.90, 79.90);

-- Order 13
INSERT INTO order_items VALUES
(DEFAULT, 13, 4, 2, 29.90, 59.80);

-- Order 14
-- (canceled order, no items)

-- Order 15
INSERT INTO order_items VALUES
(DEFAULT, 15, 5, 1, 159.90, 159.90);

-- Order 16
INSERT INTO order_items VALUES
(DEFAULT, 16, 1, 1, 79.90, 79.90);

-- Order 17
INSERT INTO order_items VALUES
(DEFAULT, 17, 3, 1, 899.00, 899.00),
(DEFAULT, 17, 4, 1, 29.90, 29.90);

-- Order 18
INSERT INTO order_items VALUES
(DEFAULT, 18, 5, 1, 159.90, 159.90),
(DEFAULT, 18, 1, 1, 79.90, 79.90),
(DEFAULT, 18, 4, 1, 29.90, 29.90);

-- Order 19
INSERT INTO order_items VALUES
(DEFAULT, 19, 2, 1, 299.00, 299.00),
(DEFAULT, 19, 4, 1, 29.90, 29.90);

-- Order 20
INSERT INTO order_items VALUES
(DEFAULT, 20, 5, 1, 159.90, 159.90),
(DEFAULT, 20, 4, 1, 29.90, 29.90);

-- Order 21
INSERT INTO order_items VALUES
(DEFAULT, 21, 4, 2, 29.90, 59.80);

-- Order 22
INSERT INTO order_items VALUES
(DEFAULT, 22, 3, 1, 899.00, 899.00),
(DEFAULT, 22, 2, 1, 299.00, 299.00),
(DEFAULT, 22, 4, 2, 29.90, 59.80);

-- Order 23
INSERT INTO order_items VALUES
(DEFAULT, 23, 1, 1, 79.90, 79.90);

-- Order 24
INSERT INTO order_items VALUES
(DEFAULT, 24, 5, 1, 159.90, 159.90),
(DEFAULT, 24, 4, 1, 29.90, 29.90);
