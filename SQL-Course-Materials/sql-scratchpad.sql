USE sql_store;
SHOW TABLES;

SELECT
	`name`,
	 unit_price AS `unit price`,
	 (unit_price * 1.1) AS `new price`
FROM products;

-- SELECT orders placed after a certain date or year
SELECT *
FROM orders
-- WHERE YEAR(order_date) >= '2018';
WHERE order_date >= '2019-01-01' -- YYYY-MM-DD

-- AND operator example
SELECT * 
FROM order_items 
-- WHERE order_id = 6 AND unit_price < 30;
WHERE order_id = 6 AND (quantity * unit_price) > 30;

-- IN operator example
SELECT * 
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- BETWEEN operator example
SELECT * 
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- LIKE operator example
SELECT * 
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

-- LIKE operator example
SELECT * 
FROM customers
WHERE phone LIKE '%9';

-- REGEXP operator example
SELECT * 
FROM customers
-- WHERE first_name REGEXP 'elka|ambur';
-- WHERE last_name REGEXP 'ey$|on$';
-- WHERE last_name REGEXP '^my|se';
WHERE last_name REGEXP 'b[ru]';

-- NULL operator example
SELECT * 
FROM orders
WHERE shipped_date IS NULL 

-- ORDER BY operator example
SELECT *, (quantity * unit_price) AS price
FROM order_items
WHERE order_id = 2
ORDER BY price DESC;

SELECT *
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC 

-- LIMIT operator example
SELECT * 
FROM customers
LIMIT 3;

-- LIMIT operator example pagination & offset
SELECT * 
FROM customers
LIMIT 6, 3; -- skips first 6 and picks 3

SELECT *
FROM customers
ORDER BY points DESC 
LIMIT 3;
