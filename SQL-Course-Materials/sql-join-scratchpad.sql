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