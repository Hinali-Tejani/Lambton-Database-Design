SELECT ROUND(845.553, 1) AS rounded_number FROM dual;
SELECT TO_CHAR(ROUND(845.553, 1), '999.9') AS rounded_number FROM dual;
SELECT ROUND(30695.348, 2) AS rounded_number FROM dual;
SELECT TO_CHAR(ROUND(30695.348, 2), '99999.99') AS rounded_number FROM dual;
SELECT ROUND(30695.348, -2) AS rounded_number FROM dual;
SELECT TRUNC(2.3587, 1) AS truncated_number FROM dual;

SELECT MOD(34, 8) AS RESULT FROM dual;

SELECT 
    EMPLOYEE_NAME AS EMPLOYEE, 
    TO_CHAR(MONTHLY_SALARY * 12, '$999,999.00') AS YEARLY_SALARY
FROM 
    B_EMPLOYEES
WHERE 
    MONTHLY_SALARY * 12 > 75000
ORDER BY 
    YEARLY_SALARY DESC;

SELECT 
    EMPLOYEE_NAME AS EMPLOYEE, 
    MONTHLY_SALARY * 12 AS CURRENT_SALARY, 
    ROUND(MONTHLY_SALARY * 12 * 1.0345, 2) AS NEW_SALARY
FROM 
    B_EMPLOYEES
WHERE 
    ROUND(MONTHLY_SALARY * 12 * 1.0345, 2) > 80000
ORDER BY 
    NEW_SALARY DESC;


SELECT 
    EMPLOYEE_NAME AS NAME, 
    TO_CHAR(MONTHLY_SALARY * 12, '$999,999.00') AS CURRENT_SALARY, 
    TO_CHAR(ROUND(MONTHLY_SALARY * 12 * 1.0345, 2), '$999,999.00') AS NEW_SALARY
FROM 
    B_EMPLOYEES
WHERE 
    ROUND(MONTHLY_SALARY * 12 * 1.0345, 2) > 80000
ORDER BY 
    ROUND(MONTHLY_SALARY * 12 * 1.0345, 2) DESC;


SELECT 
    CITY,
    CUSTOMER_NAME,
    TO_CHAR(CREDIT_LIMIT, '$999,999.00') AS CURRENT_LIMIT,
    TO_CHAR(ROUND(CREDIT_LIMIT * 1.0525, 2), '$999,999.00') AS NEW_LIMIT
FROM 
    B_CUSTOMERS
WHERE 
    ROUND(CREDIT_LIMIT * 1.0525, 2) BETWEEN 60000 AND 75000
ORDER BY 
    ROUND(CREDIT_LIMIT * 1.0525, 2) DESC;

 SELECT 
    PRODUCT_CODE, 
    TO_CHAR(ORIGINAL_PRICE, '$999,999.00') AS ORIGINAL_PRICE,
    TO_CHAR(FLOOR(ORIGINAL_PRICE), '$999,999.00') AS MONDAY_PRICE,
    TO_CHAR(CEIL(ORIGINAL_PRICE), '$999,999.00') AS TUESDAY_PRICE
FROM 
    B_PRICES;

VARIABLE ENTER_NUMBER NUMBER
EXEC :ENTER_NUMBER := 222;

SELECT 
    CASE 
        WHEN MOD(:ENTER_NUMBER, 2) = 0 THEN 'Even number'
        ELSE 'Odd number'
    END AS RESULT
FROM dual;


SELECT 
    TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(LAST_DAY(SYSDATE), 'YYYY-MM-DD') AS "LAST DAY OF MONTH"
FROM dual;

SELECT 
    TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(NEXT_DAY(SYSDATE, 'SATURDAY'), 'YYYY-MM-DD') AS NEXT_SATURDAY
FROM dual;

SELECT 
    EMPLOYEE_NAME AS NAME,
    TO_DATE('2025-01-01', 'YYYY-MM-DD') AS TODAY,
    HIRE_DATE,
    MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) AS MONTHS_EMPLOYED
FROM 
    B_EMPLOYEES
WHERE 
    MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) >= 252
ORDER BY 
    MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) DESC;

SELECT 
    EMPLOYEE_NAME AS NAME,
    TO_DATE('2025-01-01', 'YYYY-MM-DD') AS TODAY,
    HIRE_DATE,
    ROUND(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) / 12, 2) AS YEARS_EMPLOYED
FROM 
    B_EMPLOYEES
WHERE 
    ROUND(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) / 12, 2) >= 20
ORDER BY 
    ROUND(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) / 12, 2) DESC;

SELECT 
    EMPLOYEE_NAME AS NAME,
    TO_DATE('2025-01-01', 'YYYY-MM-DD') AS TODAY,
    HIRE_DATE,
    FLOOR(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) / 12) AS YEARS,
    MOD(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE), 12) AS MONTHS,
    MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) AS TOTAL_MONTHS
FROM 
    B_EMPLOYEES
WHERE 
    FLOOR(MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), HIRE_DATE) / 12) >= 20
ORDER BY 
    YEARS DESC, MONTHS DESC;

SELECT 
    TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(ADD_MONTHS(CURRENT_DATE, 6), 'YYYY-MM-DD') AS APPOINTMENT
FROM 
    dual;

SELECT 
    TO_CHAR(TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(ADD_MONTHS(TO_DATE('2025-02-28', 'YYYY-MM-DD'), 4), 'YYYY-MM-DD') AS APPOINTMENT
FROM 
    dual;

SELECT 
    TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(LAST_DAY(CURRENT_DATE), 'YYYY-MM-DD') AS DEADLINE
FROM 
    dual;

SELECT 
    TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD') AS TODAY,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(CURRENT_DATE, 6) - 1, 'FRIDAY'), 'YYYY-MM-DD') AS "Friday Date"
FROM 
    dual;


SELECT 
    EMPLOYEE_NAME AS NAME,
    TO_CHAR(HIRE_DATE, 'Month DD, YYYY') AS "Hire Date"
FROM 
    B_EMPLOYEES
WHERE 
    EXTRACT(YEAR FROM HIRE_DATE) BETWEEN 2000 AND 2003
ORDER BY 
    EMPLOYEE_NAME;


SELECT 
    EMPLOYEE_NAME AS NAME,
    TO_CHAR(MONTHLY_SALARY * 12, '999,999.00') AS "Current Yearly Salary",
    TO_CHAR((MONTHLY_SALARY + 100) * 12, '999,999.00') AS "New Yearly Salary"
FROM 
    B_EMPLOYEES
WHERE 
    EMPLOYEE_ID = 25;


SELECT 
    CUSTOMER_NAME,
    ADDRESS,
    TO_CHAR(CURRENT_DISCOUNT, '999.9%') AS CURRENT_DISCOUNT,
    TO_CHAR(COALESCE(CURRENT_DISCOUNT, 5), '999.9%') AS NEW_DISCOUNT
FROM 
    B_CUSTOMERS
WHERE 
    STATE IN ('CA', 'NY', 'SC')
ORDER BY 
    CUSTOMER_NAME;


SELECT 
    CUSTOMER_NAME,
    ADDRESS,
    TO_CHAR(CURRENT_DISCOUNT, '999.9%') AS CURRENT_DISCOUNT,
    TO_CHAR(
        CASE 
            WHEN CURRENT_DISCOUNT IS NULL THEN 1.5
            ELSE CURRENT_DISCOUNT * 1.10
        END, 
        '999.9%') AS NEW_DISCOUNT
FROM 
    B_CUSTOMERS
WHERE 
    STATE IN ('CA', 'NY', 'SC')
ORDER BY 
    CUSTOMER_NAME;


SELECT 
    CATEGORY_CODE,
    DESCRIPTION,
    TO_CHAR(ORIGINAL_PRICE, '999,999.99') AS "Original Price",
    TO_CHAR(
        CASE 
            WHEN CATEGORY_CODE = 'HW' THEN ORIGINAL_PRICE * 1.25
            WHEN CATEGORY_CODE = 'LA' THEN ORIGINAL_PRICE * 1.50
            WHEN CATEGORY_CODE = 'SG' THEN ORIGINAL_PRICE * 1.75
        END, 
        '999,999.99') AS "New Price"
FROM 
    B_PRODUCTS
WHERE 
    (CATEGORY_CODE = 'HW' AND ORIGINAL_PRICE * 1.25 > 100.00) OR
    (CATEGORY_CODE = 'LA' AND ORIGINAL_PRICE * 1.50 BETWEEN 2500.00 AND 4000.00) OR
    (CATEGORY_CODE = 'SG' AND ORIGINAL_PRICE * 1.75 < 3000.00)
ORDER BY 
    CATEGORY_CODE,
    "New Price" DESC;



