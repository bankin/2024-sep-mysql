SELECT * FROM employees;
SELECT * FROM addresses;

SELECT employee_id, first_name, addresses.address_id, address_text
FROM employees
INNER JOIN addresses;

SELECT first_name, last_name, address_text
FROM employees
INNER JOIN addresses
ON employees.address_id = addresses.address_id;

SELECT 
	e.employee_id, 
    e.first_name, 
    e.last_name, 
    a.address_id, 
    a.address_text
FROM employees AS e
INNER JOIN addresses AS a
	ON e.address_id = a.address_id;

SELECT 
	e.employee_id, 
    e.first_name, 
    e.last_name, 
    a.address_id, 
    a.address_text
FROM employees e
INNER JOIN addresses a
	ON e.address_id = a.address_id;
    

SELECT * FROM employees;

SELECT 
	e.employee_id, 
    e.first_name, 
    e.last_name,
    e.manager_id,
    m.employee_id,
    m.first_name,
    m.last_name
FROM employees e
INNER JOIN employees m
	ON e.manager_id = m.employee_id;
    
SELECT * FROM employees;
    
SELECT e.employee_id, e.first_name, a.address_id, a.address_text
FROM employees e, addresses a
WHERE e.address_id = a.address_id
ORDER BY e.employee_id;

SELECT COUNT(*) FROM departments;

SELECT COUNT(DISTINCT department_id)
FROM employees;

INSERT INTO departments(name, manager_id)
VALUES("Empty Dept", 1);

SELECT * FROM departments;

SELECT 
	e.employee_id,
    e.first_name, 
    e.department_id,
    d.department_id,
    d.name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
ORDER BY d.department_id DESC;
    

SELECT employee_id, last_name
FROM employees
WHERE first_name LIKE 'z%'
UNION
SELECT name, department_id 
FROM departments
WHERE name LIKE 'r%';

INSERT INTO towns(name) VALUES('Empty Dept');

SELECT COUNT(*) FROM towns;

SELECT name
FROM departments
WHERE name LIKE 'e%'
UNION
SELECT name
FROM towns
WHERE name LIKE 'e%';

SELECT e.employee_id, a.address_id
FROM employees e
CROSS JOIN addresses a;

SELECT e.employee_id, a.address_id
FROM employees e
JOIN addresses a;

SELECT e.employee_id, a.address_id
FROM employees e, addresses a;
    
SELECT * FROM employees;

SELECT 
	e.employee_id,
    CONCAT_WS(' ', first_name, last_name) AS 'full_name',
    d.department_id,
    d.name AS 'department_name'
FROM employees e
JOIN departments d
	ON e.employee_id = d.manager_id
ORDER BY employee_id
LIMIT 5;

SELECT
	e.employee_id,
    e.first_name,
    m.employee_id,
    m.first_name
FROM employees e
RIGHT JOIN employees m
	ON e.manager_id = m.employee_id
ORDER BY m.employee_id;

SELECT employee_id, first_name FROM employees
WHERE first_name LIKE 'z%';

SELECT * FROM employees 
WHERE manager_id IN (90, 25);

SELECT * FROM employees 
WHERE manager_id IN (
	SELECT employee_id FROM employees
	WHERE first_name LIKE 'z%'
);

SELECT employee_id, first_name FROM employees
WHERE first_name LIKE 'za%';

SELECT * FROM employees 
WHERE manager_id = (
	SELECT employee_id FROM employees
	WHERE first_name LIKE 'za%'
    LIMIT 1
);

SELECT 
	ROUND(
		(SELECT COUNT(*) FROM employees) /
        (SELECT COUNT(*) FROM departments),
	2);
    
SELECT AVG(salary) FROM employees;

SELECT COUNT(*) AS 'count'
FROM employees
WHERE salary > (
	SELECT AVG(salary) FROM employees
);

SELECT * 
FROM towns 
WHERE name IN ('San Francisco', 'Sofia', 'Carnation');

SELECT
	t.town_id, 
    t.name AS 'town_name', 
    a.address_text
FROM towns t
INNER JOIN addresses a
	 ON t.town_id = a.town_id 
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.town_id, a.address_id;

SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE manager_id IS NULL;

SELECT * 
FROM employees e
JOIN towns t
	ON e.first_name = t.name;

SELECT e.first_name, t.name
FROM employees e
JOIN addresses a
	ON e.address_id = a.address_id
JOIN towns t
	ON t.town_id = a.town_id
ORDER BY e.employee_id;

SELECT * FROM employees;
SELECT * FROM addresses WHERE address_id = 166;
SELECT * FROM towns WHERE town_id = 12;

SELECT * FROM projects;
 