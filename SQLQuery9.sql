-- Retrieve the Top 3 Customers with the Highest Scores

SELECT TOP 3 *
FROM customers
ORDER BY score DESC

-- Retrieve the Lowest 2 Customers with the Highest Scores

SELECT TOP 2 *
FROM customers
ORDER BY score ASC

-- Get the Two Most Recent Order

SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC
