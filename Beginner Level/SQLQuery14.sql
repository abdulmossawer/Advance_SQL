-- Change the score of customer with ID 6 to O

UPDATE customers
SET score = 0
WHERE id = 9;

SELECT * 
FROM customers
WHERE id = 9;

UPDATE customers
SET first_name = 'Lucifer'
WHERE id = 6;


-- Change the score of customer with ID 10 to O and
-- update the country to 'UK' --

UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 10;


-- Update all customers with a NULL score
-- by setting their score to O

UPDATE customers
SET score = 0
WHERE score IS NULL;


-- Delete all customers with an ID greater than 5

DELETE FROM customers
WHERE id > 5;

-- Always check before deleting your query was right !

SELECT * 
FROM customers
WHERE id > 5;