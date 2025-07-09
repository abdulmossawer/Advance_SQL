--- Using SalesDB, Retrieve a list of all orders, along with
--- the related customer, product, and employee details.
--- For each order, display:
---- Order ID
---- Customerls name
---- Product name
---- Product price
---- Salesperson's name

SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName AS customerFirstName,
	c.LastName AS customerLastName,
	p.Product AS productName,
	p.Price,
	e.FirstName AS employeeFirstName,
	e.LastName AS employeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID





