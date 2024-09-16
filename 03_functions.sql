SELECT * FROM authors;
SELECT * FROM books;

SELECT 
	id, 
    SUBSTRING(title, 5)
FROM books;

SELECT SUBSTRING('abcdefg', 3);
SELECT SUBSTRING('abcdefg', 3, 2);
SELECT SUBSTRING('abcdefg' FROM 3 FOR 2);

SELECT SUBSTRING('The title', 1, 3);

SELECT title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;

SELECT REPLACE('Some string', 'str', 'spr');
SELECT REPLACE('Some string', 'Str', 'spr');
SELECT REPLACE('Some string', 'Som', 'spr');
SELECT REPLACE('Some string', 'som', 'spr');

SELECT 
    REPLACE(title, 'The', '***') AS 'title'
FROM books
WHERE SUBSTR(title, 1, 3) = 'the'
ORDER BY id;

SELECT 
	REPLACE(
		REPLACE('The Dead Zone', 'The', '***'), -- '*** Dead Zone'
        'Zone',
        '****'
	);
    
SELECT REPLACE(LOWER('The Dead Zone'), 'the', '***');
    
SELECT '    text', LTRIM('    text');
SELECT 'text    ', RTRIM('text     ');
SELECT LTRIM(RTRIM('  text  '));
SELECT '		tabs', LTRIM('		tabs');

SELECT LEFT('Some title', 2);
SELECT LEFT('The title', 3);

SELECT RIGHT('The end', 3);

SELECT LOWER('ThE');
SELECT LOWER('The') = 'the';

SELECT UPPER('the');

SELECT REVERSE('Some string');

SELECT REPEAT('Re', 3);

SELECT LOCATE('de', 'The Dead Zone');
SELECT LOCATE('de', 'The Dead Zone', 6);

SELECT INSERT('Simple string', 1, 6, 'Complex');
SELECT INSERT('Simple string', 1, 0, 'Complex');
SELECT INSERT('Simple string', 7, 0, 'Complex');

SELECT INSERT(
	'Simple string',
    LOCATE('Simple', 'Simple string'),
    6,
    'Complex'
);


SELECT 5 + 2;

SELECT 5 DIV 2, 5 / 2, 5 % 2, 5 MOD 2;
SELECT 13 % 5;
SELECT 57 % 10;

SELECT 20 % 2, 21 % 2;

SELECT PI();

SELECT ABS(5), ABS(-10);

SELECT SQRT(36), SQRT(15);

SELECT POW(6, 2), POW(3, 7);

SELECT CONV(13, 10, 2), CONV(1101, 2, 10);
SELECT CONV(28, 10, 16), CONV('1C', 16, 10);

SELECT ROUND(SQRT(15), 3), FLOOR(SQRT(15)), CEILING(SQRT(15));
SELECT FLOOR(-4.23), CEILING(-4.23);

-- [0; 2] -> 0, 1, 2
-- [0; 2) -> 0, 1
-- (0; 2] -> 1, 2
-- [0; 1) -> 0, 0.1.., 0.2..., 0.9999999999..

-- [0; 1) + 5 -> [5; 6)

-- [0; 1) * 6 -> [0; 6)
-- [0; 5) + 5 -> [5; 11)
-- FLOOR([5; 11)) -> [5; 10]

-- [5; 10]
-- [n; m]

-- [0; 1) * 11 -> [0; 11) + FLOOR -> [0; 10]


SELECT FLOOR(RAND() * 6) + 5;

SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(DAY FROM NOW());
SELECT EXTRACT(DAY_MINUTE FROM '2022-10-02 16:53:22');

SELECT TIMESTAMPDIFF(DAY, NOW(), '2022-10-02 16:53:22');
SELECT TIMESTAMPDIFF(DAY, '2022-10-02 16:53:22', NOW());

SELECT * FROM authors;

SELECT
    CONCAT_WS(' ', first_name, last_name) AS 'Full Name',
    TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived'
FROM authors;

DROP VIEW Person;
CREATE VIEW Person AS 
	SELECT CONCAT_WS(' ', first_name, last_name) AS 'Full Name', 
    IF(died IS NULL, NULL, DATEDIFF(died, born))  AS 'Days Lived' 
FROM authors; 

SELECT * FROM Person;

SELECT DATE_FORMAT('2017/05/31', '%Y %b %D');
SELECT DATE_FORMAT('2017-05-31', '%Y %b %D');
SELECT DATE_FORMAT('2017-5-31', '%Y %b %D');
SELECT DATE_FORMAT('05-05-2017', '%Y %b %D');
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y');

SELECT NOW();

SELECT title
FROM books
WHERE title LIKE 'harry potter%';

SELECT title
FROM books
WHERE title LIKE '%Harry%';

SELECT *
FROM authors
WHERE first_name LIKE 'a%' OR first_name LIKE 'd%';

SELECT *
FROM authors
WHERE first_name REGEXP '^[ad]'; -- ^ = starts with

SELECT *
FROM authors
WHERE first_name REGEXP '[ad]';

SELECT * FROM authors;

SELECT *
FROM authors
WHERE first_name REGEXP '[^lve]';

SELECT 
	ROUND(SUM(cost), 2) AS 'Total Price'
FROM books;

SELECT 3.87 * 9.63;
SELECT 3.87 + 9.63;
