-- Retrieve customers with a score not equal to 0


SELECT
	first_name,
	country
FROM customers
WHERE score != 0

-- Retrieve customers from Germany

SELECT
	first_name,
	score
FROM customers
WHERE country = 'Germany'