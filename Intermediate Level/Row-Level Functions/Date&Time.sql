/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/


/* SELECT
    OrderID,
    CreationTime,
    '2025-08-20' AS HardCoded,
    GETDATE() AS Today
FROM Sales.Orders; */


--- Part Extraction --- 

/* TASK 2:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/

SELECT 
    OrderID,
    CreationTime,
    -- DATETRUNC Examples
    DATETRUNC(YEAR, CreationTime) AS Year_dt,
    DATETRUNC(MONTH, CreationTime) AS Month_dt,
    DATETRUNC(DAY, CreationTime) AS Day_dt,
    DATETRUNC(HOUR, CreationTime) AS Hour_dt,
    DATETRUNC(MINUTE, CreationTime) AS Minute_dt,
    -- DATENAME Examples
    DATENAME(WEEKDAY, CreationTime) AS WeekDay_dn,
    DATENAME(DAY, CreationTime) AS Day_dn,
    DATENAME(MONTH, CreationTime) AS Month_dn,
    DATENAME(YEAR, CreationTime) AS Year_dn,
     -- DATEPART Examples
     DATEPART(YEAR ,CreationTime) AS Year_dp,
     DATEPART(MONTH ,CreationTime) AS Month_dp,
     DATEPART(DAY ,CreationTime) AS Day_dp,
     DATEPART(HOUR ,CreationTime) AS Hour_dp,
     DATEPART(MINUTE ,CreationTime) AS Min_dp,
     DATEPART(QUARTER ,CreationTime) AS Quar_dp,
     DATEPART(WEEK ,CreationTime) AS Week_dp,
     YEAR(CreationTime) AS YEAR,
     MONTH(CreationTime) AS MONTH,
     DAY(CreationTime) AS DAY
FROM Sales.Orders;

/* ==============================================================================
   DATETRUNC() DATA AGGREGATION
===============================================================================*/

/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/

SELECT 
    DATETRUNC(YEAR, CreationTime),
    COUNT(*) AS OrderCount
FROM Sales.Orders
GROUP BY DATETRUNC(YEAR, CreationTime);


/* ==============================================================================
   EOMONTH()
===============================================================================*/

/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/

SELECT 
    OrderID,
    CreationTime,
    EOMONTH(CreationTime) AS EndOfMonth
FROM Sales.Orders;

/* ==============================================================================
   DATE PARTS | USE CASES
===============================================================================*/

/* TASK 5:
   How many orders were placed each year?
*/

SELECT 
    YEAR(OrderDate) AS OrderYear,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate);


/* TASK 6:
   How many orders were placed each month?
*/

SELECT 
    MONTH(OrderDate) AS OrderYear,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY MONTH(OrderDate);


/* TASK 7:
   How many orders were placed each month (using friendly month names)?
*/

SELECT 
    DATENAME(MONTH, OrderDate),
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

/* TASK 8:
   Show all orders that were placed during the month of February.
*/


SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;


/* ==============================================================================
   FORMAT()
===============================================================================*/

/* TASK 9:
   Format CreationTime into various string representations.
*/

SELECT 
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA ,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO ,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd
FROM Sales.Orders


/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/

SELECT 
    OrderID,
    CreationTime,
    'Day ' + FORMAT(CreationTime, 'ddd MMM') +
    ' Q' + DATENAME(quarter, CreationTime) + ' ' +
    FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders;

/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/

SELECT 
    FORMAT(CreationTime, 'MMM yy'),
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY FORMAT(CreationTime, 'MMM yy');


/* ==============================================================================
   CONVERT()
===============================================================================*/

/* TASK 12:
   Demonstrate conversion using CONVERT.
*/

SELECT 
    CONVERT(INT, '145') AS [String to Int],
    CONVERT(DATE, '12-07-2025') AS [String to Date],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [CreationTime TO DATE],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std : 32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std : 34]
FROM Sales.Orders;


/* ==============================================================================
   CAST()
===============================================================================*/

/* TASK 13:
   Convert data types using CAST.
*/

SELECT
    OrderID,
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;



/* ==============================================================================
   DATEADD() / DATEDIFF()
===============================================================================*/

/* TASK 14:
   Perform date arithmetic on OrderDate.
*/

SELECT 
    OrderID,
    OrderDate,
    DATEADD(DAY, -15, OrderDate) AS FifteenDaysBefore,
    DATEADD(MONTH, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(YEAR, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;


/* TASK 15:
   Calculate the age of employees.
*/

SELECT 
    EmployeeID,
    BirthDate,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Sales.Employees;

/* TASK 16:
   Find the average shipping duration in days for each month.
*/

SELECT 
    MONTH(OrderDate) AS OrderMonth,
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

/* TASK 17:
   Time Gap Analysis: Find the number of days between each order and the previous order.
*/

SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;


/* ==============================================================================
   ISDATE()
===============================================================================*/

/* TASK 18:
   Validate OrderDate using ISDATE and convert valid dates.
*/

SELECT
    OrderDate,
    ISDATE(OrderDate) AS IsValidDate,
    CASE 
        WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
        ELSE '9999-01-01'
    END AS NewOrderDate
FROM (
    SELECT '2025-08-20' AS OrderDate UNION
    SELECT '2025-08-21' UNION
    SELECT '2025-08-23' UNION
    SELECT '2025-08'
) AS t
-- WHERE ISDATE(OrderDate) = 0
