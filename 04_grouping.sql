SELECT department_id
FROM employees
GROUP BY department_id;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT DISTINCT first_name
FROM employees;

SELECT *
FROM employees
GROUP BY department_id;

SELECT *
FROM employees;

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

SELECT DISTINCT department_id, SUM(salary)
FROM employees;

SELECT *
FROM employees
GROUP BY first_name;

SELECT id, salary, salary / 2
FROM employees
WHERE salary > 1000;

SELECT *
FROM products;

SELECT * 
FROM book_library.authors;

SELECT COUNT(id), COUNT(middle_name), COUNT(*)
FROM book_library.authors;

SELECT department_id, COUNT(id) AS 'Number of employees'
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT * FROM departments;

SELECT * FROM employees;

INSERT INTO employees(first_name, last_name, department_id)
VALUES 
	('Pesho', 'Petrov', 4),
	('Ivan', 'Ivanov', 4),
	('Maria', 'Mariova', 4);

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id;

SELECT 
	department_id, 
    ROUND(AVG(salary), 3), 
    ROUND(SUM(salary) / COUNT(salary), 3),
    ROUND(SUM(salary) / COUNT(*), 3)
FROM employees
GROUP BY department_id;

SELECT department_id, MIN(salary)
FROM employees
WHERE salary > 800 -- filters the rows befor grouping has started
GROUP BY department_id;

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 700;

SELECT department_id, MIN(salary) AS 'Min Salary'
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 700
ORDER BY `Min Salary`;

SELECT department_id, COUNT(*) AS 'Number of employees'
FROM employees
GROUP BY department_id
ORDER BY department_id, `Number of employees`;

SELECT e.id AS 'E ID', d.id AS 'D ID'
FROM employees e, departments d;

SELECT department_id AS 'did'
FROM employees
GROUP BY `did`;

-- Check
SELECT department_id as 'did', first_name
FROM employees
WHERE did = 2;

SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id;

SELECT department_id, ROUND(MIN(salary), 2) AS 'MinSalary'
FROM employees
GROUP BY department_id
HAVING `MinSalary` > 800;

SELECT * FROM categories;
SELECT * FROM products;

SELECT COUNT(*)
FROM products
WHERE category_id = 2 AND price > 8;

SELECT 
	category_id, 
    ROUND(AVG(price), 2) AS 'Average Price',
    MIN(price) AS 'Cheapest Product',
    MAX(price) AS 'Most Expensive Product'
FROM products
GROUP BY category_id;
