

SELECT 
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING  SUM(score) > 800