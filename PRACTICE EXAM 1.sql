
select customer_id , DATEPART(month,order_date) as month_name,count(order_id) from dbo.orders
group by DATEPART(month,order_date) ,customer_id ;

with grouped_table as 

(select customer_id , DATEPART(month,order_date) as month_name,count(order_id) as order_count from dbo.orders
group by DATEPART(month,order_date) ,customer_id )

select customer_id, CAST(avg(order_count) as decimal(8,2)) as avarage_orders from grouped_table
group by customer_id;

-- write a query to identyfy customenrs who made a purchase every month for the past year 
with rank_table as 
(select	customer_id, 
	DENSE_RANK() over(partition by customer_id order by DATEPART(month,order_date)) as rank_by_month ,
	DATEPART( YEAR, order_date) YEAR_NAME
from dbo.orders  ) ,

MAX_YEAR AS 
( SELECT MAX(DATEPART( YEAR, order_date)) MAX_YEAR_NAME FROM orders )

select distinct(customer_id) from rank_table AS RT
	LEFT JOIN MAX_YEAR AS MY 
	ON RT.YEAR_NAME != MY.MAX_YEAR_NAME 
	where rank_by_month = 12 ;


SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]

-- WRITE A QUERY TO FIND THE TOTAL REVINUE FOR EACH RIGION IN A GIVEN QUARTER
SELECT 
	TerritoryID, 
	DATEPART(QUARTER,OrderDate) AS DATE_QUARTER, 
	SUM(SubTotal) TOTAL_REVINUE
FROM Sales.SalesOrderHeader
WHERE  DATEPART(QUARTER,OrderDate) = 3
GROUP BY TerritoryID, DATEPART(QUARTER,OrderDate)
--HAVING DATEPART(QUARTER,OrderDate) = 3
ORDER BY TOTAL_REVINUE DESC

-- 

-- WRITE A QUERY TO FIND THE FIRST PURCHASE DATE OF EACH CUSTOMER 

WITH RANK_CUSTOMER_ORDER AS
(SELECT 
	CustomerID, 
	OrderDate,
	ROW_NUMBER() OVER(PARTITION BY CUSTOMERID ORDER BY ORDERDATE) AS RANK_CUSTOMERID_ORDERDATE 
FROM Sales.SalesOrderHeader) 

SELECT 
	CustomerID, 
	CAST(OrderDate  AS date) AS ORDER_DATE
FROM RANK_CUSTOMER_ORDER
WHERE RANK_CUSTOMERID_ORDERDATE = 1;

-- WRITE A QUERY TO CALCULATE THE YEAR ON YEAR GROWTH OF REVENUE


WITH TOTAL_PRICE_YEAR AS 
(SELECT 
	YEAR(ModifiedDate) AS YEAR_NAME, 
	SUM(UnitPrice) TOTAL_UNITPRICE 
FROM Sales.SalesOrderDetail
GROUP BY YEAR(ModifiedDate)),

PREVIOUS_YEAR_REVINUES AS
(SELECT 
	YEAR_NAME, 
	TOTAL_UNITPRICE,
	LAG(TOTAL_UNITPRICE) OVER(ORDER BY YEAR_NAME) AS PREVIOUS_YEAR_REVINUE
FROM TOTAL_PRICE_YEAR)

SELECT 
	YEAR_NAME,
	TOTAL_UNITPRICE,
	PREVIOUS_YEAR_REVINUE,
	((TOTAL_UNITPRICE - PREVIOUS_YEAR_REVINUE)*100/ ISNULL(PREVIOUS_YEAR_REVINUE,0)) AS REVINUE_RATE
FROM PREVIOUS_YEAR_REVINUES;

-- WRITE A QUERY TO FIND THE 'NTH' HIGHEST SALARY FROM THE EMPLOYEE TABLE -- 5TH

WITH RANK_SALARY AS 
(SELECT  
	employee_id, 
	CONCAT_WS(' ',first_name,middle_name,last_name) EMP_NAME,  
	salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS SALARY_RANK
FROM DBO.employees)
SELECT 
	employee_id,
	EMP_NAME,
	salary
FROM RANK_SALARY WHERE SALARY_RANK = 5;

