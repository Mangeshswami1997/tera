-- Switch to the target database
USE mydatabase;

-- Create a table for users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data into users table
INSERT INTO users (name, email) VALUES
('mahesh', 'mangesh@gmail.com'),
('bharat', 'bharat@yahoo.com'),
('ashwin', 'ashwin@gmail.com');

-- Insert sample data into orders table
INSERT INTO orders (user_id, product_name, quantity) VALUES
(1, 'INNOVA', 1),
(2, 'FORTUNER', 2),
(3, 'MG', 1);

-- Verify data
SELECT * FROM users;
SELECT * FROM orders;