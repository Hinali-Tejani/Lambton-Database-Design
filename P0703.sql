-- DROP statements
DROP TABLE IF EXISTS rp_order_lines;
DROP TABLE IF EXISTS rp_orders;
DROP TABLE IF EXISTS rp_customers;
DROP TABLE IF EXISTS rp_reps;
DROP TABLE IF EXISTS rp_inventory;
DROP TABLE IF EXISTS rp_warehouse;
DROP TABLE IF EXISTS rp_products;

-- CREATE statements for tables

CREATE TABLE rp_products (
    product_code VARCHAR(10) PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    category VARCHAR(2) NOT NULL CHECK (category IN ('HW', 'SG', 'AP')),
    cost_price DECIMAL(10,2) NOT NULL CHECK (cost_price >= 20.00 AND cost_price <= 2000.00)
);

CREATE TABLE rp_reps (
    rep_id INT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    rep_city VARCHAR(50) NOT NULL,
    rep_state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    commission DECIMAL(10,2) DEFAULT 0.00,
    rate DECIMAL(4,3) DEFAULT 0.04 CHECK (rate >= 0.03 AND rate <= 0.07)
);




CREATE TABLE rp_warehouse (
    warehouse_id INT PRIMARY KEY,
    whse_city VARCHAR(50) NOT NULL
);

CREATE TABLE rp_inventory (
    warehouse_id INT NOT NULL,
    product_code VARCHAR(10) NOT NULL,
    qoh INT NOT NULL,
    PRIMARY KEY (warehouse_id, product_code),
    FOREIGN KEY (warehouse_id) REFERENCES rp_warehouse(warehouse_id)
);

CREATE TABLE rp_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    cust_city VARCHAR(50) NOT NULL,
    cust_state CHAR(2) NOT NULL CHECK (cust_state IN ('MI', 'IL', 'ON')),
    zip VARCHAR(10) NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    credit_limit DECIMAL(10,2) DEFAULT 5000.00 CHECK (credit_limit <= 18000.00),
    rep_id INT NOT NULL,
    FOREIGN KEY (rep_id) REFERENCES rp_reps(rep_id)
);


CREATE TABLE rp_orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL CHECK (order_date > '2021-01-01'),
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES rp_customers(customer_id)
);

CREATE TABLE rp_order_lines (
    order_id INT NOT NULL,
    product_code VARCHAR(10) NOT NULL,
    qty_ordered INT NOT NULL,
    price_paid DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_code),
    FOREIGN KEY (order_id) REFERENCES rp_orders(order_id),
    FOREIGN KEY (product_code) REFERENCES rp_products(product_code)
);


INSERT INTO rp_warehouse (warehouse_id, whse_city) VALUES
(100, 'Chicago'),
(200, 'Detroit'),
(300, 'Toronto');

INSERT INTO rp_reps (rep_id, last_name, first_name, street, rep_city, rep_state, zip, commission, rate) VALUES
(20, 'Culp', 'Betty', '1275 Main St', 'Detroit', 'MI', '48288', 20542.50, 0.05),
(35, 'Manis', 'Richard', '532 Jackson', 'Toronto', 'ON', 'M5V2K1', 39216.00, 0.07),
(65, 'Large', 'Tom', '1626 Taylor', 'Chicago', 'IL', '60099', 23487.00, 0.05);

INSERT INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id) VALUES
(148, 'Al''s Appliance and Sport', '2837 Greenway', 'Detroit', 'MI', '48244', 6550.00, 7500.00, 20),
(282, 'Brookings Direct', '3827 Devon', 'Toronto', 'ON', 'M5V7F5', 431.50, 10000.00, 35),
(356, 'Ferguson''s', '382 Wildwood', 'Northfield', 'MI', '33146', 5785.00, 7500.00, 20),
(408, 'The Everything Shop', '1828 Raven', 'Crystal', 'IL', '60082', 4285.25, 5000.00, 65),
(462, 'Bargains Galore', '3829 Central', 'Toronto', 'ON', 'M5V9G4', 3412.00, 10000.00, 35),
(524, 'Kline''s', '838 Ridgeland', 'Lakeside', 'IL', '60091', 12762.00, 15000.00, 65),
(608, 'Johnson''s Department Store', '372 Oxford', 'Toronto', 'ON', 'M5V9S4', 2106.00, 10000.00, 35),
(687, 'Lee''s Sport and Appliance', '282 Evergreen', 'Troy', 'MI', '48283', 2851.00, 5000.00, 20),
(725, 'Deerfield''s Four Seasons', '282 Columbia', 'Toronto', 'ON', 'M5V9J5', 248.00, 7500.00, 35),
(842, 'All Season', '28 Lakeview', 'Grove City', 'IL', '60081', 6221.00, 7500.00, 65);

INSERT INTO rp_inventory (warehouse_id, product_code, qoh) VALUES
(100, 'AT94', 43),
(100, 'BV06', 24),
(100, 'CD52', 21),
(100, 'DL71', 11),
(100, 'DR93', 31),
(100, 'DW11', 12),
(100, 'FD21', 12),
(100, 'KL62', 34),
(100, 'KT03', 23),
(100, 'KV29', 25),
(200, 'AT94', 43),
(200, 'BV06', 34),
(200, 'CD52', 11),
(200, 'DL71', 41),
(200, 'DR93', 21),
(300, 'DW11', 42),
(300, 'FD21', 52),
(300, 'KL62', 14),
(300, 'KT03', 53),
(300, 'KV29', 35);

INSERT INTO rp_orders (order_id, order_date, customer_id) VALUES
(21608, '2021-01-20', 148),
(21610, '2021-02-20', 356),
(21613, '2021-02-21', 408),
(21614, '2021-03-21', 282),
(21617, '2021-03-22', 608),
(21619, '2021-04-23', 148),
(21623, '2021-04-23', 608);

INSERT INTO rp_products (product_code, description, category, cost_price) VALUES
('AT94', 'Iron', 'HW', 24.95),
('BV06', 'Home Gym', 'SG', 794.95),
('CD52', 'Microwave Oven', 'AP', 165.00),
('DL71', 'Cordless Drill', 'HW', 129.95),
('DR93', 'Gas Range', 'AP', 495.00),
('DW11', 'Washer', 'AP', 399.99),
('FD21', 'Stand Mixer', 'HW', 159.95),
('KL62', 'Dryer', 'AP', 349.95),
('KT03', 'Dishwasher', 'AP', 595.00),
('KV29', 'Treadmill', 'SG', 1390.00);

INSERT INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid) VALUES
(21608, 'AT94', 11, 21.95),
(21610, 'DR93', 1, 495.00),
(21610, 'DW11', 1, 399.99),
(21613, 'KL62', 4, 329.95),
(21614, 'KT03', 2, 595.00),
(21617, 'BV06', 2, 794.95),
(21617, 'CD52', 4, 150.00),
(21619, 'DR93', 1, 495.00),
(21623, 'KV29', 2, 1290.00);



