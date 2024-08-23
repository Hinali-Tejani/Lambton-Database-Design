SELECT customer_name, credit_limit, balance FROM Customers WHERE balance BETWEEN 40000 AND 80000 ORDER BY customer_name DESC;
SELECT prod_description, price FROM B_PRODUCTS WHERE category = 'SA' AND price > 200.00 ORDER BY price DESC;
SELECT customer_name, credit_limit, balance FROM Customers WHERE customer_id = 130;
SELECT customer_name, location, (credit_limit - balance) AS available_credit FROM Customers WHERE (credit_limit - balance) > 30000 ORDER BY available_credit DESC;
SELECT product_code, qoh FROM B_INVENTORY WHERE qoh BETWEEN 20 AND 30 ORDER BY qoh DESC;
SELECT customer_name, address FROM Customers WHERE balance BETWEEN 40000.00 AND 60000.00 ORDER BY customer_name;
SELECT order_date, order_id FROM Orders WHERE order_date BETWEEN '2020-10-20' AND '2020-11-20' ORDER BY order_date, order_id DESC;
SELECT category_code, prod_description FROM Products WHERE category_code IN ('SG', 'HW', 'LA') ORDER BY category_code, prod_description;
SELECT category_code, prod_description FROM Products WHERE category_code NOT IN ('SG', 'HW', 'LA') ORDER BY category_code, prod_description;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Employees WHERE manager_id IS NULL ORDER BY last_name;
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name, manager_id FROM Employees WHERE manager_id IS NOT NULL ORDER BY last_name;
SELECT category_code, prod_description, price FROM Products WHERE prod_description LIKE '%maker%' ORDER BY category_code, prod_description;
SELECT warehouse_id, product_code, qoh FROM B_INVENTORY WHERE qoh > 40 ORDER BY warehouse_id, product_code;
SELECT order_id, customer_id, ship_date FROM Orders WHERE ship_date < '2020-10-20' ORDER BY order_id DESC;
SELECT location, customer_id, customer_name FROM Customers WHERE customer_name LIKE 'B%' ORDER BY location, customer_id;
SELECT prod_description FROM Products WHERE prod_description LIKE '%Range%' ORDER BY prod_description;
SELECT name FROM Employees WHERE last_name LIKE '%s%' AND last_name LIKE '%i%' ORDER BY last_name;
SELECT customer_name, location FROM Customers WHERE customer_name LIKE '%B%g%i%' OR customer_name LIKE '%B%i%g%' ORDER BY customer_name;
SELECT customer_name, cust_city FROM Customers WHERE cust_city IN ('Colorado Springs', 'Las Vegas', 'San Diego') ORDER BY cust_city;
SELECT seller_id, order_date, order_id FROM Orders WHERE seller_id IN (105, 115, 125) AND order_date > '2020-09-16' ORDER BY seller_id, order_date, order_id;
SELECT customer_name, cust_city FROM Customers WHERE credit_limit BETWEEN 30000 AND 60000 AND state IN ('CA', 'CO') ORDER BY customer_name;
SELECT category_code, product_code, prod_description FROM Products WHERE category_code NOT IN ('LA', 'SA') ORDER BY category_code, product_code;
SELECT order_id, product_code, quantity, price_paid, (quantity * price_paid) AS extended_price FROM OrderDetails WHERE product_code IN ('CD52', 'DR93', 'KV29') ORDER BY order_id, extended_price DESC;
SELECT prod_description, price FROM B_PRODUCTS WHERE category = 'SA' AND price > 200.00 ORDER BY price DESC;
SELECT DISTINCT cust_city FROM Customers WHERE state IN ('NY', 'CO') ORDER BY cust_city;


