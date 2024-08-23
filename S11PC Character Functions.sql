SELECT dealer_name AS "Dealer",
       UPPER(dealer_address) AS "Address"
FROM dealers
WHERE dealer_id IN (101, 407, 120)
ORDER BY dealer_name;

SELECT LOWER(previous_owner_name) AS "Previous Owner",
       LOWER(previous_owner_address) AS "Address"
FROM previous_owners
WHERE owner_id BETWEEN 1010 AND 1015
ORDER BY previous_owner_name;

SELECT CONCAT('Previous owner: ', UPPER(previous_owner_last_name)) AS "Previous Owners"
FROM previous_owners
WHERE UPPER(previous_owner_state) = 'MI' 
  AND UPPER(previous_owner_city) = 'ANN ARBOR'
ORDER BY previous_owner_last_name;

SELECT DISTINCT UPPER(city) AS "CITY",
                LENGTH(city) AS "CITY_LENGTH"
FROM previous_owners
ORDER BY UPPER(city);

SELECT dealer_name AS "DEALER_NAME",
       manager_id AS "MANAGER_ID"
FROM dealers
WHERE manager_id IS NOT NULL
ORDER BY dealer_name;

SELECT dealer_name AS "DEALER_NAME"
FROM dealers
WHERE manager_id IS NULL
ORDER BY dealer_name;

SELECT model_year AS "Cars with no previous owner",
       car_make,
       car_model
FROM cars
WHERE previous_owner_id IS NULL
ORDER BY model_year;

SELECT previous_owner_name AS "NAME"
FROM previous_owners
WHERE UPPER(city) = UPPER(:ENTER_CITY)
ORDER BY previous_owner_last_name DESC;

SELECT previous_owner_name AS "PREVIOUS_OWNER",
       city AS "CITY"
FROM previous_owners
WHERE UPPER(city) LIKE 'B%'
ORDER BY previous_owner_name;

SELECT model_year AS "MODEL_YEAR",
       car_make AS "CAR_MAKE",
       car_model AS "CAR_MODEL",
       CONCAT('$', selling_price) AS "SELLING_PRICE"
FROM cars
WHERE car_make IN ('Dodge', 'Nissan', 'Lincoln')
  AND selling_price BETWEEN 71000 AND 74000
ORDER BY model_year, car_make, car_model, selling_price DESC;

SELECT CONCAT(previous_owner_first_name, ' ', previous_owner_last_name) AS "NAME"
FROM P_PREVIOUS_OWNERS
WHERE LOWER(previous_owner_first_name) LIKE '%at%' OR LOWER(previous_owner_last_name) LIKE '%at%'
ORDER BY previous_owner_last_name;

