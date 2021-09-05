-- UNION Example
-- Order status ACTIVE / ARCHIVED
SELECT
	order_id,
	order_date,
	'ACTIVE' AS status
FROM orders
WHERE year(order_date) >= '2019'
UNION
SELECT
	order_id,
	order_date,
	'ARCHIVED' AS status
FROM orders
WHERE year(order_date) < '2019';

-- Customer type GOLD / SILVER / BRONZE
SELECT
	customer_id,
	first_name,
	points,
	'GOLD' AS type
FROM customers
WHERE points >= 3000
UNION 
SELECT
	customer_id,
	first_name,
	points,
	'SILVER' AS type
FROM customers
WHERE points < 3000 AND points >= 2000
UNION 
SELECT
	customer_id,
	first_name,
	points,
	'BRONZE' AS type
FROM customers
WHERE points < 2000
ORDER BY first_name;