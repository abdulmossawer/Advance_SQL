-- Retrieve all customers from Germany

SELECT *
FROM customers
WHERE country = 'Germany'


--Retrieve all customers who are not from Germany

SELECT *
FROM customers
WHERE country != 'Germany'


-- Retrieve all customers with a score greaterthan 500

SELECT *
FROM customers
WHERE score > 500

-- Retrieve all customers with a score greaterthan or equal 500

SELECT *
FROM customers
WHERE score >= 500


-- Retrieve all customers with a score lessthan 500

SELECT *
FROM customers
WHERE score < 500


-- Retrieve all customers with a score lessthan or equal 500

SELECT *
FROM customers
WHERE score <= 500
