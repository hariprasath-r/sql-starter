USE sql_store;

-- INNER JOIN example
SELECT order_id, p.product_id, p.name, o.quantity, o.unit_price
FROM order_items o
INNER JOIN products p
	ON o.product_id = p.product_id
ORDER BY order_id;

-- Joining table across databases
SELECT order_id, p.product_id, p.name, o.quantity, o.unit_price
FROM sql_store.order_items o
INNER JOIN sql_inventory.products p
	ON o.product_id = p.product_id
ORDER BY order_id;

-- Self Join
SELECT
	e.employee_id,
	e.first_name AS employee_name,
	m.first_name AS manager_name
FROM sql_hr.employees e
JOIN sql_hr.employees m
	ON e.employee_id = m.employee_id;
	
-- Joining multiple tables
SELECT
	o.order_id,
	c.first_name,
	c.last_name,
	o.order_date,
	os.name AS order_status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.`status` = os.order_status_id;
	
USE sql_invoicing;
SELECT
	p.date AS payment_date,
	i.invoice_id,
	c.name AS client_name,
	i.invoice_total,
	pm.name AS payment_method
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN invoices i
	ON p.invoice_id = i.invoice_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
	
-- Composite Join Conditions
SELECT 
	oi.order_id,
	oi.product_id,
	oi.quantity,
	oi.unit_price,
	oin.note
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_Id
	AND oi.product_id = oin.product_id
	
-- Implicit Join Syntax
SELECT
	o.order_id,
	c.first_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;

SELECT 
	o.order_id,
	c.first_name
FROM orders o, customers c
WHERE o.customer_id = c.customer_id; -- ignoring this where clause will result in CROSS JOIN. Hence avoid implicit join statements

-- LEFT OUTER JOIN
SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.order_date
FROM customers c
LEFT OUTER JOIN orders o
	ON c.customer_id = o.customer_id;
	
-- RIGHT OUTER JOIN
SELECT 
	c.customer_id,
	c.first_name,
	o.order_id,
	o.order_date
FROM orders o
RIGHT JOIN customers c
	ON o.customer_id = c.customer_id;
	
-- Get all products and their order id
SELECT
	p.product_id,
	p.name,
	oi.order_id,
	oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
	
-- OUTER JOIN Multiple Tables
SELECT
	o.order_id,
	o.order_date,
	c.first_name,
	os.name AS order_status
--	s.name AS shipper
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN order_statuses os
	ON o.order_id = os.order_status_id
LEFT JOIN shippers s
	ON o.shipper_id = s.shipper_id;


-- SELF OUTER JOIN
USE sql_hr;

SELECT
	e.employee_id,
	e.first_name,
	m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;


-- USING clause example
USE sql_store;

SELECT
	c.first_name,
	o.order_date,
	s.name AS shipper
FROM customers c
LEFT JOIN orders o
--	ON c.customer_id = o.customer_id
	USING (customer_id)
LEFT JOIN shippers s
	USING (shipper_id);

SELECT *
FROM order_items oi
JOIN order_item_notes oin
--	ON oi.order_id = oin.order_Id AND oi.product_id = oin.product_id
	USING (order_id, product_id);

USE sql_invoicing;
SELECT
	c.name AS client_name,
	p.date AS payment_date,
	p.amount,
	pm.name AS payment_type
FROM payments p
JOIN clients c
--	ON p.client_id = c.client_id
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;



