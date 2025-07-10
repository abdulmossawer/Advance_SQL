-- Combine the Name data from
-- employees and customers into one table.

SELECT 
	e.FirstName,
	e.LastName
FROM Sales.Employees AS e
UNION
SELECT 
	c.FirstName,
	c.LastName
FROM Sales.Customers AS c

-- Combine the Name data from
-- employees and customers into one table,
-- including duplicates.

SELECT 
	e.FirstName,
	e.LastName
FROM Sales.Employees AS e
UNION ALL
SELECT 
	c.FirstName,
	c.LastName
FROM Sales.Customers AS c

-- Find employees who are not customers at the same time

SELECT 
	e.FirstName,
	e.LastName
FROM Sales.Employees AS e
EXCEPT
SELECT 
	c.FirstName,
	c.LastName
FROM Sales.Customers AS c

-- Find employees who are also customers

SELECT 
	e.FirstName,
	e.LastName
FROM Sales.Employees AS e
INTERSECT
SELECT 
	c.FirstName,
	c.LastName
FROM Sales.Customers AS c

-- Orders are stored in separate tables (Orders and OrdersArchive).
-- Combine all orders into one report without duplicates.

SELECT 'Orders' AS SourceTable
	  ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION 
SELECT 'OrdersArchive' AS SourceTable
	  ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID
