-- e.employee_id, e.first_name, t.name 
SELECT COUNT(*) AS 'count'
FROM employees e
	JOIN addresses a ON e.address_id = a.address_id
    JOIN towns t ON a.town_id = t.town_id
WHERE t.name = 'Plovdiv';

SELECT NOW(), RAND(), CONCAT('asd', 'eee');
SELECT 5;



DELIMITER $$
DROP FUNCTION ufn_count_employees_by_town;
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE e_count INT;
    SET e_count := (SELECT COUNT(*) AS 'count'
		FROM employees e
			JOIN addresses a ON e.address_id = a.address_id
			JOIN towns t ON a.town_id = t.town_id
		WHERE t.name = town_name);
    
    RETURN e_count;
END$$
DELIMITER ;

DELIMITER $$
DROP FUNCTION IF EXISTS ufn_multiple_columns_result;
CREATE FUNCTION ufn_multiple_columns_result()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	RETURN (
		SELECT first_name FROM employees LIMIT 10
    );
END$$
DELIMITER ;

SELECT NOW();
-- SELECT NOW()$$
SELECT ufn_count_employees_by_town('Sofia');
SELECT ufn_multiple_columns_result();

DELIMITER $$
CREATE PROCEDURE usp_select_employees()
BEGIN
	SELECT first_name, last_name FROM employees;
END$$
DELIMITER ;

CALL usp_select_employees();

SELECT @@collation_database;

SELECT @asd;
SET @asd = 10;
SELECT @asd;
SET @asd = 'Now Text';
SELECT @asd;
-- SET @asd = NULL;
-- SELECT @asd;

SET @emp_count = (SELECT COUNT(*) FROM employees);
SELECT @emp_count;

DELIMITER $$
DROP PROCEDURE IF EXISTS usp_with_out_param;
CREATE PROCEDURE usp_with_out_param(OUT answer INT)
BEGIN
	DECLARE result INT;
    SET result := FLOOR(RAND() * 10); 
	
    SET answer = result;
END$$
DELIMITER ;

CALL usp_with_out_param(@asd);
SELECT @asd;

CALL usp_with_out_param(@brand_new);
SELECT @brand_new;

SELECT e.first_name, e.salary
FROM employees e 
	JOIN departments d ON e.department_id = d.department_id
WHERE d.name = 'Finance'
ORDER BY e.first_name, e.salary;

UPDATE employees e
SET e.salary = e.salary * 1.05
WHERE e.department_id = (
	SELECT d.department_id FROM departments d WHERE d.name = 'Finance'
);

DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN
	UPDATE employees e
	SET e.salary = e.salary * 1.05
	WHERE e.department_id = (
		SELECT d.department_id 
        FROM departments d 
        WHERE d.name = department_name
	);
    
    SELECT e.first_name, e.salary
	FROM employees e 
		JOIN departments d ON e.department_id = d.department_id
	WHERE d.name = department_name
	ORDER BY e.first_name, e.salary;
END$$
DELIMITER ;

CALL usp_raise_salaries('Finance');

SELECT * FROM employees WHERE employee_id = 43;

UPDATE employees
SET salary = salary * 1.05
WHERE employee_id = 43;

DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(user_id INT)
BEGIN
	DECLARE e_cnt INT;
    SET e_cnt := (SELECT COUNT(*) FROM employees WHERE employee_id = user_id);
    
    -- e_cnt = 1 => update; e_cnt = 0 => abort
    START TRANSACTION;
	
    UPDATE employees
	SET salary = salary * 1.05
	WHERE employee_id = user_id;
    
    IF (e_cnt = 0) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END$$
DELIMITER ;

CALL usp_raise_salary_by_id(432112);

DELIMITER $$
CREATE TRIGGER tr_add_town_address
AFTER INSERT
ON towns
FOR EACH ROW
BEGIN
	INSERT INTO addresses(address_text, town_id)
		VALUES (CONCAT(NEW.name, ' Center'), NEW.town_id);
END$$
DELIMITER ;

INSERT INTO towns(name) VALUES ('New'), ('Old');

SELECT * 
FROM towns 
ORDER BY town_id DESC;

SELECT *
FROM addresses
ORDER BY address_id DESC;

CREATE TABLE deleted_employees AS
SELECT
	employee_id
	first_name, 
    middle_name, 
    last_name,
    job_title,
    department_id,
    salary
FROM employees;
TRUNCATE deleted_employees;

ALTER TABLE deleted_employees
ADD COLUMN employee_id INT;

DELIMITER $$
CREATE TRIGGER tr_deleted_employee
AFTER DELETE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees
		(first_name, middle_name, last_name, job_title, department_id, salary)
		VALUES (
			OLD.first_name, 
            OLD.middle_name, 
            OLD.last_name,
            OLD.job_title,
            OLD.department_id,
            OLD.salary
		);
END$$
DELIMITER ;

SELECT *
FROM employees e 
LEFT JOIN employees_projects ep ON e.employee_id = ep.employee_id
WHERE ep.employee_id IS NULL;

DELETE FROM employees
WHERE employee_id = 2;

SELECT * FROM deleted_employees;

DESCRIBE employees;

CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    job_title VARCHAR(50),
    department_id INT,
    salary DECIMAL(19, 4)
);