-- Find all customers whose first name starts with 'M'

SELECT *
FROM customers
WHERE first_name LIKE 'm%';


-- Find all customers whose first name ends with 'n'

SELECT *
FROM customers
WHERE first_name LIKE '%n';


-- Find all customers whose first name contains 'r'

SELECT *
FROM customers
WHERE first_name LIKE '%r%';


-- Find all customers whose first name
-- has 'r' the third position

SELECT *
FROM customers
WHERE first_name LIKE '__r%';