SELECT * FROM B_PRODUCTS;
SELECT product_code, prod_description, category_code, price FROM B_PRODUCTS;
SELECT customer_name, CAST(credit_limit AS INT), CAST(balance AS DECIMAL(10,2)) FROM B_CUSTOMERS;
SELECT customer_name, CAST(credit_limit AS DECIMAL(10,2)), CAST(balance AS INT) FROM B_CUSTOMERS;
SELECT customer_name FROM B_CUSTOMERS;
SELECT customer_name, credit_limit * 1.12 AS NEW_CREDIT_LIMIT FROM B_CUSTOMERS;
SELECT customer_name AS "Customer Name", customer_city AS "City" FROM B_CUSTOMERS;
SELECT customer_name, credit_limit AS OLD_CREDIT_LIMIT, credit_limit * 1.12 AS NEW_CREDIT_LIMIT FROM B_CUSTOMERS;
SELECT customer_id AS "Customer", customer_name AS "Customer Name", (credit_limit - balance) AS "Available Credit" FROM B_CUSTOMERS;
SELECT customer_name, customer_city, customer_state, customer_country, CONCAT(customer_city, ', ', customer_state, ', ', customer_country) AS ADDRESS FROM B_CUSTOMERS;
SELECT customer_name, customer_city, customer_state, customer_country, CONCAT(customer_city, customer_state, customer_country) AS ADDRESS FROM B_CUSTOMERS;
SELECT CONCAT(customer_name, ' has a balance of ', FORMAT(balance, 2)) AS "Customer Balance" FROM B_CUSTOMERS;
SELECT CONCAT('Customer ', customer_id, ' is located in ', customer_city, ', ', customer_state) AS "Customer Location" FROM B_CUSTOMERS;
SELECT customer_city AS CITY FROM B_CUSTOMERS;
SELECT COUNT(customer_city) AS Num_Cities FROM B_CUSTOMERS;
SELECT DISTINCT customer_city AS CITY FROM B_CUSTOMERS;
SELECT COUNT(DISTINCT customer_city) AS Num_Cities FROM B_CUSTOMERS;



