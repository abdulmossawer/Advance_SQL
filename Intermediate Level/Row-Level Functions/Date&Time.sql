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



/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/



/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/