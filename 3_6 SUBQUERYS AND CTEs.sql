select * from oes.order_items;
select * from oes.products;
select * from oes.product_categories;


with products_with_cetegoris
as
(select   p.product_name AS PRODUCT_NAME,
	p.product_id AS PRODUCT_ID, 
	p.list_price AS LIST_PRICE , 
	p.category_id AS CATEGORY_ID, 
	pc.category_name AS CATEGORY_NAME
from 
oes.products p
inner join oes.product_categories pc
on p.category_id = pc.category_id )

select PWC.CATEGORY_NAME, SUM(O.quantity) TOTAL_QUANTITY , 
	CAST(ROUND(SUM(O.unit_price*O.quantity),2) AS decimal(15,2)) TOTAL_PRICE FROM 
OES.order_items AS O
LEFT JOIN 
products_with_cetegoris AS PWC
ON O.product_id = PWC.PRODUCT_ID
GROUP BY PWC.CATEGORY_NAME;


CREATE TABLE EMP_TEST
(EMPLOYEE_ID INT NOT NULL IDENTITY,
FIRST_NAME VARCHAR(13),
MANAGER_ID INT );

INSERT INTO EMP_TEST
VALUES ( 'BOB',1),
       ('TOM',1),
       ('SUE',2),
       ('MARY',2),
       ('MATT',3),
       ('WILL',3),
       ('HENRY',3),
       ('LEWIS',5),
       ('SCOTT',5),
       ('BILL',6);


-- UPDATE THE TABLE 
UPDATE EMP_TEST
SET MANAGER_ID = NULL
WHERE EMPLOYEE_ID = 1;

-- SELF JOIN SUBQUERY 


SELECT  E.FIRST_NAME AS MANAGER_NAMEA,  M.MANAGER_ID , M.EMPLOYEE_ID , M.FIRST_NAME FROM 
EMP_TEST AS E 
RIGHT JOIN 
EMP_TEST AS M
ON
E.EMPLOYEE_ID = M.MANAGER_ID
WHERE M.MANAGER_ID IS NOT NULL;

