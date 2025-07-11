---	Manipulation ---
-- Concatenate first name and country into one column

SELECT 
	first_name,
	country,
	CONCAT(first_name,' ',country) AS name_country
FROM customers;

-- Convert the first name to lowercase

SELECT 
	LOWER(first_name) AS lower_first
FROM customers;

-- Convert the first name to uppercase

SELECT 
	UPPER(first_name) AS lower_first
FROM customers;

-- Find customers whose first name
-- contains leading or trailing spaces

SELECT 
	first_name,
	LEN(first_name) AS len_first,
	LEN(TRIM(first_name)) AS trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) FLAG
FROM customers
WHERE LEN(first_name) != LEN(TRIM(first_name));
--WHERE first_name != TRIM(first_name)

-- Remove dashes (-) from a phone number

SELECT
'784-895-257' AS phoneNum,
REPLACE('784-895-257', '-', '') AS cleanNum;

-- Replace File Extence from txt to csv

SELECT 
'customer.txt' AS excel,
REPLACE('customer.txt', '.txt', '.csv') AS CSV;


--- Calculation ---

--- Calculate the length of each customer's first name ---

SELECT 
	first_name,
	LEN(TRIM(first_name)) AS name_len 
FROM customers;



--- String Extraction ---

--- Retrieve the first two characters of each first name ---
--- Retrieve the last two characters of each first name ---

SELECT 
	first_name,
	LEFT(TRIM(first_name), 2) AS first_two,
	RIGHT(TRIM(first_name), 2) AS last_two
FROM customers;

--- Retrieve a list of customers first names after
--- removing the first character

SELECT 
	first_name,
	SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM customers;