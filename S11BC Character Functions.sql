SELECT customer_name AS "Customer Name",
       UPPER(customer_address) AS "Customer Address"
FROM customers
WHERE customer_address LIKE '%WI%'
   OR customer_address LIKE '%SC%'
   OR customer_address LIKE '%NY%'
ORDER BY customer_name;


SELECT LOWER(employee_name) AS "Employee Name",
       LOWER(employee_address) AS "Address"
FROM employees
WHERE employee_id BETWEEN 104 AND 109
ORDER BY employee_name;

SELECT CONCAT('Customer id ', customer_id) AS "Customer id",
       UPPER(customer_name) AS "Customer Name"
FROM customers
WHERE customer_address LIKE '%SAN DIEGO%'
ORDER BY customer_name;


SELECT DISTINCT UPPER(city) AS "City",
                LENGTH(city) AS "City Length"
FROM addresses
ORDER BY city;

SELECT manager_id AS "Manager Id",
       employee_name AS "Employee Name"
FROM employees
WHERE manager_id IN (110, 111, 114)
ORDER BY manager_id, employee_last_name;

SELECT employee_name AS "NAME",
       hire_date AS "HIRE_DATE"
FROM employees
WHERE manager_id = :Enter_manager_id
ORDER BY employee_last_name DESC;

SELECT customer_name AS "Customer",
       city AS "City"
FROM customers
WHERE UPPER(city) LIKE 'S%'
ORDER BY customer_name;

SELECT LENGTH('Database Design and SQL') AS "Length"
FROM dual;


SELECT 'Database ' || 'Design ' || 'and SQL' AS "TITLE"
FROM dual;


SELECT LPAD(RPAD('Database', 13, '*'), 18, '*') || 
       RPAD('Internet', 13, '*') || 
       RPAD('Academy', 13, '*') AS "DIA"
FROM dual;

SELECT RPAD('Database', 11, '$') || 
       RPAD('Internet', 11, '$') || 
       'Academy' AS "DIA"
FROM dual;

SELECT REPLACE('Database Internet Academy', 'Internet', 'Worldwide') AS "Course"
FROM dual;


SELECT product_code AS "PRODUCT_CODE",
       prod_description AS "PROD_DESCRIPTION",
       CONCAT('$', price) AS "PRICE"
FROM B_PRODUCTS
WHERE price > 1500.00
ORDER BY price DESC;

SELECT product_code AS "PRODUCT_CODE",
       prod_description AS "PROD_DESCRIPTION",
       price AS "PRICE"
FROM B_PRODUCTS
WHERE UPPER(category) = UPPER(:Enter_category_code)
  AND price BETWEEN 2400.00 AND 6000.00
ORDER BY product_code;







