-- Create the database tables
CREATE TABLE bd_stores (
    store_id INT NOT NULL,
    city VARCHAR(40) NOT NULL,
    store_mgr_id INT
);


CREATE TABLE bd_departments (
    department_id INT NOT NULL,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE bd_employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    soc_ins_no CHAR(9) NOT NULL,
    pension_contr NUMBER(1) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    job_class VARCHAR(1) DEFAULT 'T',
    job_level DECIMAL(1,0) NOT NULL,
    salary DECIMAL(9,2) NOT NULL,
    bonus DECIMAL(9,2),
    commission DECIMAL(9,2),
    coach_id INT,
    store_id INT NOT NULL,
    department_id INT DEFAULT 300 NOT NULL
);


CREATE TABLE bd_store_departments (
    store_id INT NOT NULL,
    department_id INT NOT NULL,
    dept_mgr_id INT
);

-- Add NOT NULL constraints
ALTER TABLE bd_stores
MODIFY (store_id INT,
        city VARCHAR(40));

-- Add DEFAULT constraints
ALTER TABLE bd_employees
MODIFY (hire_date DATE DEFAULT CURRENT_DATE,
        job_class VARCHAR(1) DEFAULT 'T',
        department_id INT DEFAULT 300);

-- Add PRIMARY KEY constraints
ALTER TABLE bd_stores
ADD CONSTRAINT pk_stores PRIMARY KEY (store_id);

ALTER TABLE bd_departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_id);

ALTER TABLE bd_employees
ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

-- Add FOREIGN KEY constraints
ALTER TABLE bd_employees
ADD CONSTRAINT fk_employees_store FOREIGN KEY (store_id)
REFERENCES bd_stores (store_id);

ALTER TABLE bd_employees
ADD CONSTRAINT fk_employees_department FOREIGN KEY (department_id)
REFERENCES bd_departments (department_id);

ALTER TABLE bd_store_departments
ADD CONSTRAINT fk_store_departments_store FOREIGN KEY (store_id)
REFERENCES bd_stores (store_id);

ALTER TABLE bd_store_departments
ADD CONSTRAINT fk_store_departments_department FOREIGN KEY (department_id)
REFERENCES bd_departments (department_id);

-- Add UNIQUE constraints
ALTER TABLE bd_employees
ADD CONSTRAINT uk_employees_soc_ins_no UNIQUE (soc_ins_no);

-- Add CHECK constraints
ALTER TABLE bd_stores
ADD CONSTRAINT chk_stores_store_id CHECK (store_id BETWEEN 11 AND 99);

ALTER TABLE bd_departments
ADD CONSTRAINT chk_departments_department_id CHECK (department_id BETWEEN 300 AND 399);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_birth_date CHECK (birth_date >= DATE '1980-01-01');

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_soc_ins_no CHECK (soc_ins_no BETWEEN 1 AND 999999999);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_sex CHECK (sex IN ('F', 'M'));

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_pension_contr CHECK (pension_contr IN (0, 1));

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_hire_date CHECK (hire_date > birth_date);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_job_class CHECK (job_class IN ('T', 'J', 'C', 'M'));

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_job_level CHECK (job_level BETWEEN 1 AND 9);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_salary CHECK (salary <= 125000);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_salary_commission CHECK (salary > commission);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_bonus_commission CHECK (bonus IS NOT NULL OR commission IS NOT NULL);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_bonus_commission_not_zero CHECK (bonus <> 0 OR commission <> 0);

ALTER TABLE bd_employees
ADD CONSTRAINT chk_employees_commission CHECK (commission < (salary * 0.085));


INSERT ALL
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (11, 304, 201)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (11, 300, 212)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 303, 202)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 304, NULL)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 305, 205)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 306, 206)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (33, 300, 210)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (33, 304, 208)
SELECT 1 FROM DUAL;

-- Populate departments table
INSERT ALL
INTO bd_departments (department_id, department_name) VALUES (300, 'New Hire')
INTO bd_departments (department_id, department_name) VALUES (301, 'IT')
INTO bd_departments (department_id, department_name) VALUES (302, 'Administration')
INTO bd_departments (department_id, department_name) VALUES (303, 'Men''s Clothing')
INTO bd_departments (department_id, department_name) VALUES (304, 'Women''s Clothing')
INTO bd_departments (department_id, department_name) VALUES (305, 'Kids')
INTO bd_departments (department_id, department_name) VALUES (306, 'Toys')
SELECT 1 FROM DUAL;

-- Populate employees table
-- (employee_id, first_name, last_name, birth_date, soc_ins_no, sex, pension_contr, hire_date, coach_id, store_id,
--  department_id, job_class, job_level, salary, bonus, commission )
INSERT ALL
INTO bd_employees VALUES (201, 'Lauren', 'Alexander', '1980-02-10', 749583756, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 94500, 12000,    0)
INTO bd_employees VALUES (202, 'Lisa',   'James',     '1988-06-16', 396812058, 'F', 0, '2013-12-15', NULL, 22, 303, 'M', 6, 52000,  7500,    0)
INTO bd_employees VALUES (203, 'Dave',   'Bernard',   '1990-04-28', 184759364, 'M', 1, '2014-05-10', 202,  22, 303, 'C', 3, 24000,     0,  500)
INTO bd_employees VALUES (204, 'Betty',  'Smith',     '1980-05-15', 744963756, 'F', 1, '2015-10-18', NULL, 22, 304, 'M', 8, 84500,  9200,    0)
INTO bd_employees VALUES (205, 'Amy',    'Albert',    '1988-09-26', 396396858, 'F', 0, '2016-02-22', NULL, 22, 305, 'J', 6, 42000,  7500,    0)
INTO bd_employees VALUES (206, 'Peter',  'Alan',      '1990-08-15', 181957464, 'M', 1, '2017-11-11', NULL, 22, 306, 'C', 5, 24000,     0,  500)
INTO bd_employees VALUES (207, 'Alice',  'Manis',     '1980-03-08', 840681248, 'F', 1, '2015-08-21', NULL, 33, 300, 'M', 8, 84500, 12000,    0)
INTO bd_employees VALUES (208, 'Brook',  'Payne',     '1988-10-01', 185038596, 'F', 0, '2016-10-14', NULL, 33, 304, 'M', 6, 62000,  7500,    0)
INTO bd_employees VALUES (209, 'Terry',  'Russell',   '1990-06-20', 205837501, 'M', 1, '2017-04-09', 207,  33, 300, 'T', 3, 24000,     0,  500)
INTO bd_employees VALUES (210, 'Carol',  'Brown',     '1980-02-25', 740149284, 'F', 1, '2015-08-08', 207,  33, 300, 'T', 3, 24500,     0, 2080)
INTO bd_employees VALUES (211, 'Casey',  'Emery',     '1988-03-16', 749127485, 'F', 0, '2016-04-12', 206,  22, 300, 'T', 3, 25000,     0,  800)
INTO bd_employees VALUES (212, 'Bill',   'Jewel',     '1990-05-05', 385012745, 'M', 1, '2017-10-12', 205,  11, 300, 'T', 3, 24500,     0,  500)
SELECT 1 FROM DUAL;

-- Populate stores table
INSERT INTO bd_stores (store_id, city) VALUES (11,'Sarnia');
INSERT INTO bd_stores (store_id, city) VALUES (22,'London');
INSERT INTO bd_stores (store_id, city) VALUES (33,'Toronto');  

UPDATE bd_stores
SET store_mgr_id = 201
WHERE store_id = 11;

UPDATE bd_stores
SET store_mgr_id = 204
WHERE store_id = 22;

UPDATE bd_stores
SET store_mgr_id = 207
WHERE store_id = 33;


-- Constraint Testing

-- Attempt to insert an employee with a birth date before 1980-01-01 (should fail)
INSERT INTO bd_employees VALUES (999, 'John', 'Doe', '1975-12-31', '123456789', 'M', 1, '2020-01-01', NULL, 11, 300, 'T', 3, 50000, NULL, NULL);


-- Attempt to insert an employee with an invalid pension contribution value (should fail)
INSERT INTO bd_employees VALUES (998, 'Jane', 'Smith', '1990-01-01', '987654321', '2', 'F', 1, '2020-01-01', NULL, 11, 300, 'T', 3, 50000, NULL, NULL);


-- Attempt to insert an employee with a commission higher than their salary (should fail)
INSERT INTO bd_employees VALUES (997, 'Alice', 'Brown', '1985-01-01', '555444333', '0', 'F', 1, '2020-01-01', NULL, 11, 300, 'T', 3, 30000, NULL, 35000);


-- Attempt to insert an employee with an invalid social insurance number (should fail)
INSERT INTO bd_employees VALUES (996, 'Mark', 'Johnson', '1987-05-15', '12345678X', '1', 'M', 1, '2020-01-01', NULL, 11, 300, 'T', 3, 60000, NULL, NULL);


-- Attempt to insert an employee with a hire date earlier than their birth date (should fail)
INSERT INTO bd_employees VALUES (995, 'Sarah', 'Miller', '1995-03-20', '876543210', '0', 'F', 1, '1990-01-01', NULL, 11, 300, 'T', 3, 40000, NULL, NULL);


-- Attempt to insert an employee with an invalid job level (outside the range 1-9, should fail)
INSERT INTO bd_employees VALUES (994, 'Michael', 'Brown', '1980-10-10', '456789012', '1', 'M', 1, '2020-01-01', NULL, 11, 300, 'T', 10, 70000, NULL, NULL);


-- Attempt to insert an employee with a store ID that does not exist in the bd_stores table (should fail)
INSERT INTO bd_employees VALUES (993, 'Emily', 'Davis', '1988-08-08', '234567890', '1', 'F', 1, '2020-01-01', NULL, 99, 300, 'T', 3, 45000, NULL, NULL);


-- Attempt to insert an employee with a department ID that does not exist in the bd_departments table (should fail)
INSERT INTO bd_employees VALUES (992, 'David', 'Wilson', '1990-09-25', '543210987', '0', 'M', 1, '2020-01-01', NULL, 11, 400, 'T', 3, 55000, NULL, NULL);


DROP TABLE bd_stores CASCADE CONSTRAINTS;
DROP TABLE bd_departments CASCADE CONSTRAINTS;
DROP TABLE bd_employees CASCADE CONSTRAINTS;
DROP TABLE bd_store_departments CASCADE CONSTRAINTS;