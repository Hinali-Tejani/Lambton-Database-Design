-- P0701 : BLUEWATER CONSULTING

-- CREATE TABLE
CREATE TABLE BC_JOBS (
    job_id INT NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    charge_hour DECIMAL(7,2) DEFAULT 44.00
);

CREATE TABLE BC_EMPLOYEES (
    employee_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    job_id INT NOT NULL
);

CREATE TABLE BC_PROJECTS (
    project_id INT NOT NULL,
    project_name VARCHAR(50) NOT NULL,
    project_leader_id INT
);

CREATE TABLE BC_BILLINGS (
    project_id INT NOT NULL,
    employee_id INT NOT NULL,
    hours_billed DECIMAL(3,1)   
);


-- PRIMARY KEY
ALTER TABLE BC_JOBS
ADD CONSTRAINT bc_jobs_pk
PRIMARY KEY (job_id);

ALTER TABLE BC_EMPLOYEES
ADD CONSTRAINT bc_employees_pk
PRIMARY KEY (employee_id);

ALTER TABLE BC_PROJECTS
ADD CONSTRAINT bc_projects_pk
PRIMARY KEY (project_id);

ALTER TABLE BC_BILLINGS
ADD CONSTRAINT bc_billings_pk
PRIMARY KEY (project_id, employee_id);

-- UNIQUE KEY
ALTER TABLE BC_JOBS
ADD CONSTRAINT bc_jobs_job_title_uk
UNIQUE (job_title);

ALTER TABLE BC_PROJECTS
ADD CONSTRAINT bc_projects_project_name_uk
UNIQUE (project_name);

-- FOREIGN KEY
ALTER TABLE BC_EMPLOYEES
ADD CONSTRAINT bc_employees_job_id_fk
FOREIGN KEY (job_id)
REFERENCES BC_JOBS (job_id);

ALTER TABLE BC_PROJECTS
ADD CONSTRAINT bc_projects_project_leader_id_fk
FOREIGN KEY (project_leader_id)
REFERENCES BC_EMPLOYEES (employee_id);

ALTER TABLE BC_BILLINGS
ADD CONSTRAINT bc_billings_project_id_fk
FOREIGN KEY (project_id)
REFERENCES BC_PROJECTS (project_id);

ALTER TABLE BC_BILLINGS
ADD CONSTRAINT bc_billings_employee_id_uk
FOREIGN KEY (employee_id)
REFERENCES BC_EMPLOYEES (employee_id);


-- INSERT

-- BC_JOBS
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (501, 'Lead Programmer', 85.50);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (502, 'Database Designer', 105.00);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (503, 'Programmer', 37.75);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (504, 'Systems Analyst', 96.75);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (505, 'General Support', 18.36);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (506, 'DDS Analyst', 45.95);
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (507, 'Clerical Support', 26.87);

-- BC_EMPLOYEES
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (103, 'June', 'Arbough', 501);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (101, 'John', 'News', 502);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (105, 'Alice', 'Johnson', 502);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (106, 'William', 'Smith', 503);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (102, 'David', 'Senior', 504);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (114, 'Annelise', 'Jones', 503);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (118, 'James', 'Frommer', 505);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (104, 'Anne', 'Ramoras', 504);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (112, 'Darlene', 'Smithson', 506);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (113, 'Jen', 'Clarke', 503);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (111, 'Geoff', 'Wabash', 507);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (107, 'Maria', 'Alonzo', 503);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (115, 'Travis', 'Bawangi', 504);
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (108, 'Ralph', 'Washington', 504);

-- BC_PROJECTS
INSERT INTO BC_PROJECTS (project_id, project_name, project_leader_id) VALUES (15, 'Lakeview', NULL);
INSERT INTO BC_PROJECTS (project_id, project_name, project_leader_id) VALUES (18, 'Web App', NULL);
INSERT INTO BC_PROJECTS (project_id, project_name, project_leader_id) VALUES (22, 'Blue Light', NULL);
INSERT INTO BC_PROJECTS (project_id, project_name, project_leader_id) VALUES (25, 'Power Lite', NULL);

-- BC_BILLINGS
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (15, 103, 23.8);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (15, 101, 19.4);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (15, 105, 35.7);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (15, 106, 12.6);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (15, 102, 23.8);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (18, 114, 25.6);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (18, 118, 45.3);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (18, 104, 32.4);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (18, 112, 45.0);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (22, 105, 65.7);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (22, 104, 48.4);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (22, 113, 23.6);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (22, 111, 22.0);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 106, 12.8);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 107, 25.6);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 115, 45.8);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 101, 56.3);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 114, 33.1);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 108, 23.6);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 118, 30.5);
INSERT INTO BC_BILLINGS (project_id, employee_id, hours_billed) VALUES (25, 112, 41.4);

-- UPDATE
-- BC_PROJECTS
UPDATE BC_PROJECTS SET project_leader_id = 105 WHERE project_id = 15;
UPDATE BC_PROJECTS SET project_leader_id = 138 WHERE project_id = 18;

-- BC_BILLINGS
UPDATE BC_BILLINGS SET hours_billed = 49.5 WHERE project_id = 15 AND employee_id = 105;

-- DELETE
-- BC_EMPLOYEES
DELETE FROM BC_EMPLOYEES WHERE first_name = 'Darlene' AND last_name = 'Smithson';


-- Constraint Testing
-- Default Charge Per Hour
INSERT INTO BC_JOBS (job_id, job_title) VALUES (508, 'Test Job');
SELECT * FROM BC_JOBS WHERE job_id = 508;

-- Primary Key Constraint
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (501, 'Duplicate Job', 50.00);

-- NOT NULL Constraint
INSERT INTO BC_EMPLOYEES (employee_id, last_name, job_id) VALUES (120, 'NoFirstName', 501);

-- Unique Key Constraint
INSERT INTO BC_JOBS (job_id, job_title, charge_hour) VALUES (509, 'Lead Programmer', 60.00);

-- Foreign Key Constraint
INSERT INTO BC_EMPLOYEES (employee_id, first_name, last_name, job_id) VALUES (121, 'Invalid', 'JobID', 999);

-- DROP TABLES 
DROP TABLE BC_JOBS CASCADE CONSTRAINTS;
DROP TABLE BC_EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE BC_BILLINGS CASCADE CONSTRAINTS;
DROP TABLE BC_PROJECTS CASCADE CONSTRAINTS;

