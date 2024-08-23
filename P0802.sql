-- CREATE TABLES
CREATE TABLE rp_warehouses (
    warehouse_id INT NOT NULL,
    Whse_city VARCHAR(15) NOT NULL,
    PRIMARY KEY (warehouse_id)
);

CREATE TABLE rp_inventory (
    warehouse_id INT NOT NULL,
    product_code VARCHAR(4) NOT NULL,
    qoh DECIMAL(5,0) NOT NULL,
    PRIMARY KEY (warehouse_id, product_code),
    FOREIGN KEY (warehouse_id) REFERENCES rp_warehouses(warehouse_id),
    CONSTRAINT rp_inventory_qoh_ck CHECK (qoh BETWEEN 0 AND 150)
);

CREATE TABLE rp_products (
    product_code VARCHAR(4) NOT NULL,
    description_detailed VARCHAR(15) NOT NULL,
    category_of_products VARCHAR(2) NOT NULL,
    cost_price DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (product_code),
    CONSTRAINT rp_products_category_of_products_ck CHECK (category_of_products IN ('HW','SG','AP')),
    CONSTRAINT rp_products_cost_price_ck CHECK (cost_price BETWEEN 20.00 AND 2000.00)
);

CREATE TABLE rp_repe (
    rep_id INT GENERATED ALWAYS AS IDENTITY (START WITH 10 INCREMENT BY 5 NOCACHE) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    street VARCHAR(15) NOT NULL,
    rep_city VARCHAR(15) NOT NULL,
    rep_state VARCHAR(2) NOT NULL,
    zip VARCHAR(6) NOT NULL,
    commission DECIMAL(7,2),
    rate DECIMAL(3,2) DEFAULT 0.04,
    PRIMARY KEY (rep_id),
    CONSTRAINT rp_repe_state_ck CHECK (rep_state IN ('MI','IL','ON')),
    CONSTRAINT rp_repe_rate_ck CHECK (rate BETWEEN 0.03 AND 0.07)
);

CREATE TABLE rp_customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 10 NOCACHE) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    street VARCHAR(15) NOT NULL,
    cust_city VARCHAR(15) NOT NULL,
    cust_state VARCHAR(2) NOT NULL,
    zip VARCHAR(6) NOT NULL,
    balance DECIMAL(9,2),
    credit_limit DECIMAL(9,2) DEFAULT 5000.00,
    rep_id INT,
    PRIMARY KEY (customer_id),
    CONSTRAINT rp_customers_cust_state_ck CHECK (cust_state IN ('MI','IL','ON')),
    CONSTRAINT rp_customers_credit_limit_ck CHECK (credit_limit <= 18000),
    CONSTRAINT rp_customers_balance_LT_credit_limit_ck CHECK (balance < credit_limit),
    CONSTRAINT rp_customers_fk FOREIGN KEY (rep_id) REFERENCES rp_repe(rep_id)
);

CREATE TABLE rp_orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT rp_orders_order_date_ck CHECK (order_date >= DATE '2021-01-01'),
    CONSTRAINT rp_orders_fk FOREIGN KEY (customer_id) REFERENCES rp_customers(customer_id)
);

CREATE TABLE rp_order_lines (
    order_id INT NOT NULL,
    product_code VARCHAR(4) NOT NULL,
    qty_ordered DECIMAL(3) NOT NULL,
    price_paid DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (order_id, product_code),
    CONSTRAINT rp_order_lines_fk_order_id FOREIGN KEY (order_id) REFERENCES rp_orders(order_id),
    CONSTRAINT rp_order_lines_fk_product_code FOREIGN KEY (product_code) REFERENCES rp_products(product_code)
);

-- SEQUENCE
CREATE SEQUENCE RP_ORDER_ID_SEQ START WITH 1001 INCREMENT BY 1 NOCACHE;
ALTER SEQUENCE RP_ORDER_ID_SEQ INCREMENT BY 1;

-- ALTER TABLE
ALTER TABLE rp_orders MODIFY (order_id DEFAULT RP_ORDER_ID_SEQ.NEXTVAL);


-- Inserting individual rows into rp_repe table
INSERT INTO rp_repe (last_name, first_name, street, rep_city, rep_state, zip, commission, rate)
VALUES ('Culp', 'Betty', '1275 Main St', 'Detroit', 'MI', '48288', 20542.50, 0.05);

INSERT INTO rp_repe (last_name, first_name, street, rep_city, rep_state, zip, commission, rate)
VALUES ( 'Manis', 'Richard', '532 Jackson', 'Toronto', 'ON', 'M5V2K1', 39216.00, 0.07);

INSERT INTO rp_repe (last_name, first_name, street, rep_city, rep_state, zip, commission, rate)
VALUES ( 'Large', 'Tom', '1626 Taylor', 'Chicago', 'IL', '60099', 23487.00, 0.05);



-- Individual insert statements for rp_warehouses
INSERT INTO rp_warehouses VALUES (100, 'Chicago');
INSERT INTO rp_warehouses VALUES (200, 'Detroit');
INSERT INTO rp_warehouses VALUES (300, 'Toronto');


-- Batch insert statements for rp_customers
INSERT ALL
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (148, 'Al''s Appliance and Sport', '2837 Greenway', 'Detroit', 'MI', '48244', 6550.00, 7500.00, 20)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (282, 'Brookings Direct', '3827 Devon', 'Toronto', 'ON', 'M5V7F5', 431.50, 10000.00, 35)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (356, 'Ferguson''s', '382 Wildwood', 'Northfield', 'MI', '33146', 5785.00, 7500.00, 20)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (408, 'The Everything Shop', '1828 Raven', 'Crystal', 'IL', '60082', 4285.25, 5000.00, 65)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (462, 'Bargains Galore', '3829 Central', 'Toronto', 'ON', 'M5V9G4', 3412.00, 10000.00, 35)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (524, 'Kline''s', '838 Ridgeland', 'Lakeside', 'IL', '60091', 12762.00, 15000.00, 65)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (608, 'Johnson''s Department Store', '372 Oxford', 'Toronto', 'ON', 'M5V9S4', 2106.00, 10000.00, 35)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (687, 'Lee''s Sport and Appliance', '282 Evergreen', 'Troy', 'MI', '48283', 2851.00, 5000.00, 20)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (725, 'Deerfield''s Four Seasons', '282 Columbia', 'Toronto', 'ON', 'M5V9J5', 248.00, 7500.00, 35)
    INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
    VALUES (842, 'All Season', '28 Lakeview', 'Grove City', 'IL', '60081', 6221.00, 7500.00, 65)
SELECT * FROM DUAL;

-- Batch insert statements for rp_products
INSERT ALL
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('AT94', 'Iron', 'HW', 24.95)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('BV06', 'Home Gym', 'SG', 794.95)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('CD52', 'Microwave Oven', 'AP', 165.00)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('DL71', 'Cordless Drill', 'HW', 129.95)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('DR93', 'Gas Range', 'AP', 495.00)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('DW11', 'Washer', 'AP', 399.99)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('FD21', 'Stand Mixer', 'HW', 159.95)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('KL62', 'Dryer', 'AP', 349.95)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('KT03', 'Dishwasher', 'AP', 595.00)
    INTO rp_products (product_code, description, category, cost_price)
    VALUES ('KV29', 'Treadmill', 'SG', 1390.00)
SELECT * FROM DUAL;

-- Batch insert statements for rp_inventory
INSERT ALL
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'AT94', 43)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'BV06', 24)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'CD52', 21)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'DL71', 11)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'DR93', 31)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'DW11', 12)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'FD21', 12)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'KL62', 34)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'KT03', 23)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (100, 'KV29', 25)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (200, 'AT94', 43)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (200, 'BV06', 34)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (200, 'CD52', 11)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (200, 'DL71', 41)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (200, 'DR93', 21)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (300, 'DW11', 42)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (300, 'FD21', 52)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (300, 'KL62', 14)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (300, 'KT03', 53)
    INTO rp_inventory (warehouse_id, product_code, qoh)
    VALUES (300, 'KV29', 35)
SELECT * FROM DUAL;

-- Batch insert statements for rp_orders
INSERT ALL
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21608, DATE '2021-01-20', 148)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21610, DATE '2021-02-20', 356)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21613, DATE '2021-02-21', 408)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21614, DATE '2021-03-21', 282)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21617, DATE '2021-03-22', 608)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21619, DATE '2021-04-23', 148)
    INTO rp_orders (order_id, order_date, customer_id)
    VALUES (21623, DATE '2021-04-23', 608)
SELECT * FROM DUAL;

-- Batch insert statements for rp_order_lines
INSERT ALL
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21608, 'AT94', 11, 21.95)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21610, 'DR93', 1, 495.00)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21610, 'DW11', 1, 399.99)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21613, 'KL62', 4, 329.95)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21614, 'KT03', 2, 595.00)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21617, 'BV06', 2, 794.95)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21617, 'CD52', 4, 150.00)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21619, 'DR93', 1, 495.00)
    INTO rp_order_lines (order_id, product_code, qty_ordered, price_paid)
    VALUES (21623, 'KV29', 2, 1290.00)
SELECT * FROM DUAL;

-- Update statements for customer balances
UPDATE rp_customers SET balance = 4285.25 WHERE customer_id = 408;
UPDATE rp_customers SET balance = 6221.00 WHERE customer_id = 842;

-- Update statement to increase price of all products in class AP by 8.5%
UPDATE rp_products SET cost_price = cost_price * 1.085 WHERE category = 'AP';

-- Delete statement to remove product Cordless Drill from the database
DELETE FROM rp_products WHERE description = 'Cordless Drill';

-- Update statement to change the credit limit for Brookings Direct
UPDATE rp_customers SET credit_limit = 14500 WHERE customer_name = 'Brookings Direct';

-- Perform constraint testing
-- Testing customer credit limit DEFAULT constraint
INSERT INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, rep_id)
VALUES (999, 'Test Customer', '123 Test St', 'Test City', 'MI', '12345', 100.00, 20);
-- Expect credit_limit to be set to its default value

-- Testing customer state CHECK constraint
-- This should fail as 'XY' is not a valid state
BEGIN
  INSERT INTO rp_customers (customer_id, customer_name, street, cust_city, cust_state, zip, balance, credit_limit, rep_id)
  VALUES (998, 'Invalid State Customer', '123 Test St', 'Test City', 'XY', '12345', 100.00, 5000.00, 20);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Check constraint on cust_state failed as expected.');
END;

-- Testing rep rate CHECK constraint
-- This should fail as 0.1 is not a valid rate
BEGIN
  INSERT INTO rp_repe (rep_id, last_name, first_name, street, rep_city, rep_state, zip, commission, rate)
  VALUES (99, 'Test', 'Rep', '123 Test St', 'Test City', 'MI', '12345', 0.00, 0.1);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Check constraint on rep rate failed as expected.');
END;




-- DROP CONSTRAINT
ALTER TABLE rp_order_lines DROP CONSTRAINT rp_order_lines_fk_order_id;

-- DROP SEQUENCE
DROP SEQUENCE RP_ORDER_ID_SEQ;

DELETE FROM rp_customers;

-- DROP TABLES
DROP TABLE rp_order_lines CASCADE CONSTRAINTS;
DROP TABLE rp_orders CASCADE CONSTRAINTS;
DROP TABLE rp_customers CASCADE CONSTRAINTS;
DROP TABLE rp_repe CASCADE CONSTRAINTS;
DROP TABLE rp_products CASCADE CONSTRAINTS;
DROP TABLE rp_inventory CASCADE CONSTRAINTS;
DROP TABLE rp_warehouses CASCADE CONSTRAINTS;
