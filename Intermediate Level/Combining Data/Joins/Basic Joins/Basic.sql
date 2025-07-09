--- INNER Join ----
--- Get all customers along with their orders,
--- but only for customers who have placed an order

SELECT 
	c.id,
	C.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

--- LEFT Join ---
--- Get all customers along with their orders,
--- including those without orders

SELECT 
	c.id,
	C.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

--- Get all customers along with their orders,
--- including orders without matching customers

SELECT 
	c.id,
	C.first_name,
	o.customer_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id;

--- RIGHT Join ---
--- Get all customers along with their orders,
--- including orders without matching customers

SELECT 
	c.id,
	C.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

--- FULL Join ---
---	Get all customers and all orders,
---	even if there's no match

SELECT 
	c.id,
	C.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id;