
-- FROM THIS CODE WE CAN FIND META INFORMETION FROM A SCHEMA 

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'HCM';

SELECT * FROM HCM.departments;
SELECT * FROM HCM.employees;

SELECT E.employee_id, E.first_name, E.last_name, E.salary, D.department_name FROM HCM.employees AS E
INNER JOIN HCM.departments AS D
ON E.department_id = D.department_id;

SELECT D.department_name , COUNT(E.employee_id) AS TOTAL_EMPLOYEE FROM HCM.departments AS D
RIGHT JOIN HCM.employees AS E
ON D.department_id = E.department_id
GROUP BY D.department_name;

-- COMPOSIT JOIN 
-- WHEN WE WILL JOIN TWO TABLE USING TWO MORE KEY, IT WILL ME ONE PRIMARY KEY, ONE UNIC CONSTRAINT WITH ONE FOREAIGN KEY , ONE UNIC CONSTRAINT 

-- SELF JOIN 

SELECT * FROM HCM.employees;

SELECT 
	E2.employee_id, 
	E2.first_name, 
	E2.last_name,
	E1.first_name AS MANAGER_FIRST_NAME,
	E1.last_name AS MANAGER_LAST_NAME
FROM 
HCM.employees AS E1
RIGHT JOIN HCM.employees AS E2
ON E1.employee_id = E2.manager_id;


SELECT TOP 3 * FROM OES.products;
SELECT  * FROM OES.warehouses;
SELECT TOP 3 * FROM OES.inventories ;


SELECT 
	P.product_id,
	P.product_name,
	W.warehouse_id,
	W.warehouse_name,
	I.quantity_on_hand

FROM OES.products AS P
LEFT JOIN 
OES.inventories AS I 
ON P.product_id = I.product_id 
LEFT JOIN 
OES.warehouses AS W 
ON I.warehouse_id = W.warehouse_id;


SELECT 
	EM.employee_id,
	EM.first_name,
	EM.last_name,
	D.department_name,
	J.job_title,
	L.state_province,
	C.country_name
FROM
HCM.employees AS EM 
LEFT JOIN 
HCM.jobs AS J
ON EM.job_id = J.job_id
LEFT JOIN 
HCM.departments AS D
ON EM.department_id = D.department_id
LEFT JOIN HCM.locations AS L
ON D.location_id = L.location_id
LEFT JOIN HCM.countries AS C
ON L.country_id = C.country_id
WHERE C.country_name = 'Australia';


SELECT * FROM OES.products;
SELECT * FROM OES.product_categories;
SELECT * FROM OES.order_items;

SELECT 
     P.product_name,
     PC.category_name,
     CONVERT(decimal(8,2),SUM(OI.quantity)) AS TOTAL_QUANTITY
FROM 
OES.order_items AS OI
LEFT JOIN 
OES.products AS P
ON OI.product_id = P.product_id
INNER JOIN OES.product_categories AS PC
ON P.category_id = PC.category_id
GROUP BY PC.category_name, P.product_name
ORDER BY PC.category_name ;




SELECT * FROM OES.products;
SELECT * FROM OES.product_categories;
SELECT * FROM OES.order_items;



SELECT 
	P.product_name,
	PC.category_name,
	COALESCE(SUM(OI.quantity), 0) AS TOTAL_QUANTITY
FROM 
OES.products AS P
LEFT JOIN 
OES.order_items AS OI
ON P.product_id = OI.product_id
INNER JOIN 
OES.product_categories AS PC
ON P.category_id = PC.category_id
GROUP BY PC.category_name , P.product_name
ORDER BY  PC.category_name , P.product_name;

