SELECT 
    SERVICE_ID,
    TO_CHAR(ORIGINAL_PRICE, '$999.99') AS ORIGINAL_PRICE,
    TO_CHAR(FLOOR(ORIGINAL_PRICE), '$999.99') AS MONDAY_PRICE,
    TO_CHAR(CEIL(ORIGINAL_PRICE), '$999.99') AS TUESDAY_PRICE
FROM 
    B_PRICES
ORDER BY 
    SERVICE_ID;


SELECT 
    CAR_MAKE,
    MODEL_YEAR,
    TO_CHAR(OLD_SELLING_PRICE, '$999,999.00') AS OLD_SELLING_PRICE,
    TO_CHAR(OLD_SELLING_PRICE * 1.0575, '$999,999.00') AS NEW_SELLING_PRICE
FROM 
    B_CARS
WHERE 
    OLD_SELLING_PRICE * 1.0575 > 78000.00
ORDER BY 
    NEW_SELLING_PRICE DESC;


SELECT 
    CAR_MAKE,
    TO_CHAR(DATE_PURCHASED, 'MM/DD/YYYY') AS DATE_PURCHASED,
    TO_CHAR(SELLING_PRICE, '$999,999.00') AS SELLING_PRICE
FROM 
    B_CARS
WHERE 
    DATE_PURCHASED BETWEEN DATE '2021-01-01' AND DATE '2023-12-31'
    AND SELLING_PRICE BETWEEN 70000 AND 71400
ORDER BY 
    DATE_PURCHASED;


SELECT 
    CAR_MAKE,
    YEAR_ACQUIRED,
    TO_CHAR(OLD_SELLING_PRICE, '$999,999.00') AS OLD_SELLING_PRICE,
    TO_CHAR(
        CASE 
            WHEN YEAR_ACQUIRED IN (2021, 2023) THEN OLD_SELLING_PRICE * 1.10
            WHEN YEAR_ACQUIRED IN (2022, 2024) THEN OLD_SELLING_PRICE * 1.05
        END, 
        '$999,999.00'
    ) AS NEW_SELLING_PRICE
FROM 
    B_CARS
WHERE 
    CAR_MAKE = 'Red'  -- Assuming CAR_MAKE indicates color; adjust if needed
    AND YEAR_ACQUIRED IN (2021, 2022, 2023, 2024)
ORDER BY 
    NEW_SELLING_PRICE DESC;


SELECT 
    CAR_MAKE,
    MODEL_YEAR,
    TO_CHAR(SELLING_PRICE, '$999,999.00') AS SELLING_PRICE,
    CASE 
        WHEN SELLING_PRICE > 73000 THEN 'Like new'
        WHEN SELLING_PRICE BETWEEN 72000 AND 72999 THEN 'Great Value'
        WHEN SELLING_PRICE BETWEEN 71000 AND 71999 THEN 'Low-cost transportation'
        WHEN SELLING_PRICE BETWEEN 70000 AND 79999 THEN 'Bargain deals'
    END AS CATEGORY
FROM 
    B_CARS
WHERE 
    CAR_MAKE IN ('Buick', 'Lincoln', 'Honda', 'Oldsmobile', 'Land Rover')
ORDER BY 
    CAR_MAKE,
    CATEGORY,
    SELLING_PRICE;


SELECT 
    SERVICE_ID,
    DESCRIPTION,
    TO_CHAR(OLD_PRICE, '$999.00') AS OLD_PRICE,
    TO_CHAR(
        CASE 
            WHEN MOD(FLOOR(OLD_PRICE), 2) = 0 THEN OLD_PRICE
            ELSE CEIL(OLD_PRICE)
        END, 
        '$999.00'
    ) AS NEW_PRICE
FROM 
    B_SERVICES
WHERE 
    OLD_PRICE >= 50.00
ORDER BY 
    SERVICE_ID;


SELECT 
    CAR_ID,
    TO_CHAR(NEXT_SERVICE_DATE, 'Day, Month DD, YYYY') AS NEXT_SERVICE
FROM 
    B_CARS
WHERE 
    EXTRACT(YEAR FROM NEXT_SERVICE_DATE) = :ENTER_YEAR
    AND EXTRACT(MONTH FROM NEXT_SERVICE_DATE) = :ENTER_MONTH
ORDER BY 
    CAR_ID;


SELECT 
    CAR_MAKE,
    MODEL_YEAR,
    COALESCE(PREVIOUS_OWNER, 'No previous owner on record') AS PREVIOUS_OWNER
FROM 
    B_CARS
ORDER BY 
    CAR_MAKE, 
    MODEL_YEAR;


SELECT 
    CAR_ID,
    CAR_MAKE,
    CAR_MODEL,
    FLOOR((TO_DATE('2026-01-01', 'YYYY-MM-DD') - DATE_ACQUIRED) / 7) AS WEEKS_ON_LOT
FROM 
    B_CARS
WHERE 
    FLOOR((TO_DATE('2026-01-01', 'YYYY-MM-DD') - DATE_ACQUIRED) / 7) > 250
ORDER BY 
    WEEKS_ON_LOT DESC;


SELECT 
    CAR_MAKE,
    CAR_MODEL,
    TO_CHAR(DATE_ACQUIRED, 'Day, Month DD, YYYY') AS ACQUIRED
FROM 
    B_CARS
WHERE 
    EXTRACT(YEAR FROM DATE_ACQUIRED) = 2023
ORDER BY 
    EXTRACT(MONTH FROM DATE_ACQUIRED),
    EXTRACT(DAY FROM DATE_ACQUIRED);


