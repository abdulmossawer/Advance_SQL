/* find the average score for each country
	considerlng only customers with a score not equa to 0
	and return only those countries with an average score
	greater than 430
*/

SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430