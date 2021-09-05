--- INNER JOIN example
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
