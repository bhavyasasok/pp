-- MySQL database schema for Price Comparison Website

CREATE DATABASE price_comparison;

USE price_comparison;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prices (
    price_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    store_name VARCHAR(100),
    price DECIMAL(10, 2),
    url VARCHAR(255),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Example data insertion
INSERT INTO products (product_name, description, category) VALUES ('iPhone 13', 'Latest Apple smartphone', 'Electronics');
INSERT INTO prices (product_id, store_name, price, url) VALUES (1, 'Amazon', 999.99, 'https://amazon.com/iphone13');
INSERT INTO prices (product_id, store_name, price, url) VALUES (1, 'Flipkart', 979.99, 'https://flipkart.com/iphone13');

-- Query to fetch product prices
SELECT p.product_name, pr.store_name, pr.price, pr.url 
FROM products p
JOIN prices pr ON p.product_id = pr.product_id
WHERE p.product_name LIKE '%iPhone%';
