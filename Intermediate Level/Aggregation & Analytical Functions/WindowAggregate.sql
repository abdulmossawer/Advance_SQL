/* ==============================================================================
   SQL Window Aggregate Functions
-------------------------------------------------------------------------------
   These functions allow you to perform aggregate calculations over a set 
   of rows without the need for complex subqueries. They enable you to compute 
   counts, sums, averages, minimums, and maximums while still retaining access 
   to individual row details.

   Table of Contents:
    1. COUNT
    2. SUM
    3. AVG
    4. MAX / MIN
    5. ROLLING SUM & AVERAGE Use Case
===============================================================================
*/

/* ============================================================
   SQL WINDOW AGGREGATION | COUNT
   ============================================================ */

/* TASK 1:
   Find the Total Number of Orders and the Total Number of Orders for Each Customer
*/

SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    COUNT(*) OVER() AS countCus,
    COUNT(*) OVER(PARTITION BY CustomerID) AS countCus2
FROM Sales.Orders;

/* TASK 2:
   - Find the Total Number of Customers
   - Find the Total Number of Scores for Customers
   - Find the Total Number of Countries
*/

SELECT 
    CustomerID,
    Score,
    COUNT(*) OVER() AS TotalCus,
    COUNT(Score) OVER() AS TotalSco,
    COUNT(Country) OVER() AS TotalCou
FROM Sales.Customers;

/* TASK 3:
   Check whether the table 'OrdersArchive' contains any duplicate rows
*/

SELECT
    *
FROM 
( 
SELECT 
    OrderID,
    COUNT(*) OVER(PARTITION BY OrderID) AS checkDup
FROM Sales.OrdersArchive
) t
WHERE checkDup > 1;

/* ============================================================
   SQL WINDOW AGGREGATION | SUM
   ============================================================ */

/* TASK 4:
   - Find the Total Sales Across All Orders 
   - Find the Total Sales for Each Product
*/

SELECT 
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER() AS TotalSales,
    SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProduct
FROM Sales.Orders;

/* TASK 5:
   Find the Percentage Contribution of Each Product's Sales to the Total Sales
*/

SELECT 
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER() AS TotalSales,
    ROUND(CAST(Sales AS FLOAT) /SUM(Sales) OVER() * 100, 2) AS TotalSalesByPercentage
FROM Sales.Orders;

/* ============================================================
   SQL WINDOW AGGREGATION | AVG
   ============================================================ */

/* TASK 6:
   - Find the Average Sales Across All Orders 
   - Find the Average Sales for Each Product
*/

SELECT
    OrderID,
    ProductID,
    Sales,
    AVG(Sales) OVER() AS AvgSales,
    AVG(Sales) OVER(PARTITION BY ProductID) ProdAvgSales
FROM Sales.Orders;

/* TASK 7:
   Find the Average Scores of Customers
*/

SELECT
    CustomerID,
    Score,
    COALESCE(Score, 0) AS CustomSc,
    AVG(Score) OVER() AS AvgScore,
    AVG(COALESCE(Score, 0)) OVER() AS AvgsCWithOutNull
FROM Sales.Customers;

/* TASK 8:
   Find all orders where Sales exceed the average Sales across all orders
*/

SELECT 
*
FROM (
    SELECT
        OrderID,
        ProductID,
        Sales,
        AVG(Sales) OVER() AS AvgSales
    FROM Sales.Orders
)t 
WHERE Sales > AvgSales;

/* ============================================================
   SQL WINDOW AGGREGATION | MAX / MIN
   ============================================================ */

/* TASK 9:
   Find the Highest and Lowest Sales across all orders
*/

SELECT
    MAX(Sales) AS MaxSales,
    MIN(Sales) AS MinSales
FROM Sales.Orders;

/* TASK 10:
   Find the Lowest Sales across all orders and by Product
*/

SELECT
    ProductID,
    OrderID,
    Sales,
    MIN(Sales) OVER() AS LowestSales,
    MIN(Sales) OVER(PARTITION BY ProductID) AS MinSalesByProd
FROM Sales.Orders;

/* TASK 11:
   Show the employees who have the highest salaries
*/

SELECT 
*
FROM (
    SELECT 
        *,
        MAX(Salary) OVER() AS HighSalary
    FROM Sales.Employees
)t
WHERE Salary = HighSalary;

/* TASK 12:
   Find the deviation of each Sale from the minimum and maximum Sales
*/

SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,
    MAX(Sales) OVER () AS HighestSales,
    MIN(Sales) OVER () AS LowestSales,
    Sales - MIN(Sales) OVER () AS DeviationFromMin,
    MAX(Sales) OVER () - Sales AS DeviationFromMax
FROM Sales.Orders;

/* ============================================================
   Use Case | ROLLING SUM & AVERAGE
   ============================================================ */

/* TASK 13:
   Calculate the moving average of Sales for each Product over time
*/

SELECT
    OrderDate,
    OrderID,
    ProductID,
    Sales,
    AVG(Sales) OVER() AS AvgSales,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) AS MovingAvg
FROM Sales.Orders;

/* TASK 14:
   Calculate the moving average of Sales for each Product over time,
   including only the next order
*/

SELECT
    OrderDate,
    OrderID,
    ProductID,
    Sales,
    AVG(Sales) OVER() AS AvgSales,
    AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate
    ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS MovingAvg
FROM Sales.Orders;
