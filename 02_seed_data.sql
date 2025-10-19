-- -----------------------------
-- Table: customers
-- -----------------------------
INSERT INTO customers 
(customer_id, full_name, email, join_date)
VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '2023-01-15'),
(2, 'Brian Smith', 'brian.smith@example.com', '2023-02-20'),
(3, 'Chinwe Okafor', 'chinwe.okafor@example.com', '2023-03-05'),
(4, 'David Lee', 'david.lee@example.com', '2023-03-18'),
(5, 'Emeka Nwosu', 'emeka.nwosu@example.com', '2023-04-12'),
(6, 'Fatima Bello', 'fatima.bello@example.com', '2023-05-25'),
(7, 'George Adewale', 'george.adewale@example.com', '2023-06-07'),
(8, 'Hannah Kim', 'hannah.kim@example.com', '2023-07-14'),
(9, 'Ibrahim Musa', 'ibrahim.musa@example.com', '2023-08-22'),
(10, 'Jessica White', 'jessica.white@example.com', '2023-09-30'),
(11, 'Kemi Adebayo', 'kemi.adebayo@example.com', '2023-10-10'),
(12, 'Leo Fernandez', 'leo.fernandez@example.com', '2023-11-05'),
(13, 'Mariam Yusuf', 'mariam.yusuf@example.com', '2023-11-20'),
(14, 'Nathan Okeke', 'nathan.okeke@example.com', '2023-12-01'),
(15, 'Olivia Brown', 'olivia.brown@example.com', '2023-12-15');

-- -----------------------------
-- Table: products
-- -----------------------------
INSERT INTO products 
(product_id, product_name, category, price) 
VALUES
(1, 'Wireless Mouse', 'Electronics', 4500),
(2, 'Bluetooth Speaker', 'Electronics', 12000),
(3, 'Smart Lamp', 'Home', 8000),
(4, 'Cookware Set', 'Home', 15000),
(5, 'Formal Shirt', 'Fashion', 7000),
(6, 'Sneakers', 'Fashion', 12000),
(7, 'Green Tea', 'Groceries', 1500),
(8, 'Phone Case', 'Electronics', 2500),
(9, 'Backpack', 'Fashion', 9000),
(10, 'LED TV 32\"', 'Electronics', 55000),
(11, 'Hair Dryer', 'Beauty', 6000),
(12, 'Coffee Maker', 'Home', 20000),
(13, 'Sunglasses', 'Fashion', 8000),
(14, 'Rice Cooker', 'Home', 12000),
(15, 'T-shirt', 'Fashion', 4000),
(16, 'Water Bottle', 'Home', 2000),
(17, 'Gaming Keyboard', 'Electronics', 15000),
(18, 'Running Shorts', 'Fashion', 5000),
(19, 'External HDD', 'Electronics', 20000),
(20, 'Powerbank', 'Electronics', 8000);

-- -----------------------------
-- Table: orders
-- -----------------------------
INSERT INTO orders 
(order_id, customer_id, order_date, total_amount) 
VALUES
(1, 1, '2023-01-20', 16500),
(2, 2, '2023-02-25', 26500),
(3, 3, '2023-03-10', 10500),
(4, 4, '2023-03-22', 23000),
(5, 5, '2023-04-15', 7000),
(6, 6, '2023-05-30', 18000),
(7, 7, '2023-06-10', 1500),
(8, 8, '2023-07-20', 59000),
(9, 9, '2023-08-25', 12000),
(10, 10, '2023-09-05', 55000),
(11, 11, '2023-10-12', 6000),
(12, 12, '2023-11-10', 22000),
(13, 13, '2023-11-25', 16000),
(14, 14, '2023-12-05', 5000),
(15, 15, '2023-12-18', 35000);

-- -----------------------------
-- Table: order_items
-- -----------------------------
INSERT INTO order_items 
(order_item_id, order_id, product_id, quantity, line_total) 
VALUES
(1, 1, 1, 2, 9000),
(2, 1, 7, 5, 7500),
(3, 2, 2, 2, 24000),
(4, 2, 8, 1, 2500),
(5, 3, 5, 1, 7000),
(6, 3, 7, 1, 1500),
(7, 3, 16, 1, 2000),
(8, 4, 4, 1, 15000),
(9, 4, 3, 1, 8000),
(10, 5, 5, 1, 7000),
(11, 6, 6, 1, 12000),
(12, 6, 11, 1, 6000),
(13, 7, 7, 1, 1500),
(14, 8, 10, 1, 55000),
(15, 8, 15, 1, 4000),
(16, 9, 9, 1, 9000),
(17, 9, 7, 2, 3000),
(18, 10, 10, 1, 55000),
(19, 11, 11, 1, 6000),
(20, 12, 12, 1, 20000),
(21, 12, 16, 1, 2000),
(22, 13, 14, 1, 12000),
(23, 13, 15, 1, 4000),
(24, 14, 18, 1, 5000),
(25, 15, 17, 1, 15000),
(26, 15, 19, 1, 20000);

-- -----------------------------
-- Table: loyalty_points
-- -----------------------------
INSERT INTO loyalty_points 
(customer_id, points_earned, transaction_date, source) 
VALUES
(1, 150, '2023-01-21', 'Order'),
(1, 50, '2023-02-05', 'Promotion'),
(2, 300, '2023-02-26', 'Order'),
(3, 100, '2023-03-11', 'Order'),
(3, 20, '2023-03-12', 'Referral'),
(4, 200, '2023-03-23', 'Order'),
(5, 50, '2023-04-16', 'Order'),
(6, 180, '2023-05-31', 'Order'),
(7, 10, '2023-06-11', 'Order'),
(8, 190, '2023-07-21', 'Order'),
(9, 120, '2023-08-26', 'Order'),
(10, 500, '2023-09-06', 'Order'),
(11, 70, '2023-10-13', 'Promotion'),
(12, 220, '2023-11-11', 'Order'),
(13, 90, '2023-11-26', 'Order'),
(14, 30, '2023-12-06', 'Order'),
(15, 250, '2023-12-19', 'Order');
