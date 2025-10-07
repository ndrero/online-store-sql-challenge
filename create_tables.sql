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
