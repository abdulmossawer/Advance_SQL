-- Retrieve all customers from either Germany OR USA

SELECT *
FROM customers
WHERE country IN('Germany', 'USA')


-- Retrieve all customers from not either Germany OR USA

SELECT *
FROM customers
WHERE country NOT IN('Germany', 'USA')