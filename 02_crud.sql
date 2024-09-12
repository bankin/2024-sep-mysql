SELECT *
FROM employees;

SELECT id, first_name, last_name, job_title, department_id, salary
FROM employees;	

SELECT id, first_name, last_name, job_title
FROM employees
ORDER BY id;

SELECT 
	id AS '#',
    first_name AS 'First Name',
    last_name AS 'Last Name',
    job_title AS 'Title'
FROM employees;

SELECT *
FROM hotel.employees;

SELECT *
FROM intro_test.employees;

SELECT 
	employees.id,
    employees.first_name,
    employees.last_name
FROM hotel.employees;

SELECT 
	e.id,
    e.first_name,
    e.last_name
FROM hotel.employees AS e;

SELECT 
	id, 
    CONCAT(first_name, ' ', last_name, ' - ', salary, 'lv.') AS 'Full Info'
FROM employees;

SELECT
	id,
    CONCAT_WS(' >> ', first_name, last_name, job_title, salary) AS 'Separated Info'
FROM employees;

SELECT
	salary,
	last_name,
    first_name,
    id
FROM employees;

SELECT 
	id,
    CONCAT(first_name, ' ', last_name) as 'full_name',
    job_title,
    salary
FROM employees
WHERE salary > 1000
ORDER BY id;

SELECT 
	id, first_name
FROM employees
WHERE 2 > 10;

SELECT 
	id, first_name
FROM employees
WHERE department_id = 1;

SELECT 
	id,
    job_title,
    salary
FROM employees
WHERE salary > 1000
ORDER BY id;

SELECT DISTINCT
	id, first_name
FROM employees;

SELECT DISTINCT
	first_name
FROM employees;

-- After changing John salary from 880 -> 900
SELECT DISTINCT
	first_name, salary
FROM employees;

SELECT *
FROM employees
WHERE salary > 1000 AND department_id = 4;

SELECT *
FROM employees
WHERE department_id = 3 OR department_id = 4;

SELECT *
FROM employees
WHERE salary > 1100 AND salary < 2000;

SELECT *
FROM employees
WHERE salary BETWEEN 1100 AND 2000;

SELECT *
FROM employees
WHERE department_id = 4 AND salary >= 1000
ORDER BY id;

SELECT *
FROM employees
WHERE 
	department_id = 3 OR 
	department_id = 4 OR 
    department_id = 5 OR 
    department_id = 6;
    
SELECT *
FROM employees
WHERE 
	department_id IN (3, 4, 5, 6);
    
SELECT *
FROM employees
WHERE first_name = 'jOHN';

-- <> !=
SELECT *
FROM employees
WHERE NOT first_name = 'jOHN';

SELECT *
FROM employees
WHERE NOT (first_name = 'john' OR department_id = 3);

SELECT *
FROM employees
ORDER BY salary DESC, department_id DESC;

SELECT 
	id AS 'No.',
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    salary as 'Salary'
FROM employees
WHERE department_id = 1 OR department_id = 2
ORDER BY first_name, last_name;

CREATE VIEW `v_dept_1_2_info` AS
	SELECT 
		id AS 'No.',
		CONCAT(first_name, ' ', last_name) AS 'Full Name',
		salary as 'Salary'
	FROM employees
	WHERE department_id = 1 OR department_id = 2
	ORDER BY first_name, last_name;

SELECT * FROM v_dept_1_2_info;

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

CREATE VIEW `v_top_paid_employee` AS 
	SELECT *
	FROM employees
	ORDER BY salary DESC
	LIMIT 1;

SELECT * FROM v_top_paid_employee;

-- Error no info for job_title
INSERT INTO `employees`(`first_name`, `last_name`, `salary`)
VALUES ('New', 'Entry', 2000);

INSERT INTO `employees`(
	`first_name`, `last_name`, `salary`, `job_title`, `department_id`
)
VALUES ('New', 'Entry', 2000, NULL, NULL);

INSERT INTO departments
VALUES (5, 'New dept');

SELECT * FROM departments;

INSERT INTO departments(id) VALUES (6);

INSERT INTO departments(name)
VALUES 
	('Sales'),
    ('R&D'),
    ('Cloud');

SELECT * FROM departments;

INSERT INTO departments(name) VALUES (NULL);

SELECT first_name, last_name, 1
FROM employees
WHERE department_id = 4;

INSERT INTO clients(first_name, last_name, room_id)
	SELECT first_name, last_name, 1
	FROM employees
	WHERE department_id = 4;
    
SELECT * FROM clients;

CREATE TABLE `selected_filtered_employees` AS
SELECT id, first_name, last_name 
	FROM employees
    WHERE department_id = 3;

SELECT * FROM selected_employees;

SELECT * FROM selected_filtered_employees;

SELECT first_name, last_name FROM intro_test.employees;

CREATE TABLE hotel.`intro_employees_copy` AS
SELECT first_name, last_name FROM intro_test.employees;

SELECT * FROM intro_employees_copy;

SELECT id, salary * 1.10
FROM employees
WHERE department_id = 3;

UPDATE employees
SET salary = salary * 1.1
WHERE department_id = 3;

SELECT * FROM employees;

SELECT *
FROM employees
WHERE job_title = 'Manager';

UPDATE employees
SET salary = salary + 100
WHERE job_title = 'manager';

SELECT salary FROM employees;

SELECT * FROM departments;

SELECT * FROM departments
WHERE id IN (5, 6, 7, 8, 9, 10);

DELETE FROM departments
WHERE id IN (5, 6, 7, 8, 9, 10);

DELETE FROM departments
WHERE id = 3;

-- department_id = 1 OR department_id = 2
SELECT * 
FROM employees
WHERE department_id IN (1, 2);

DELETE FROM employees
WHERE department_id IN (1, 2);

SELECT * 
FROM employees 
ORDER BY id;