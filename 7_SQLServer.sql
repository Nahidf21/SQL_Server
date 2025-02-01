use SAMPLEDB;
go
--C1 -- self contained subquery
select product_id,product_name, list_price, category_id  from oes.products
where list_price = ( select min(list_price) from oes.products);

--c2 -- correlated subquery

select p.product_id, p.product_name, p.list_price, p.category_id from oes.products as p 
where p.list_price = (
	select  min (p1.list_price) from oes.products as p1
	where p1.category_id = p.category_id
	);

--c3 --  inner join

select p.product_id, p.product_name, p.list_price, p.category_id from oes.products  p
inner join 
(select category_id, min (list_price) as min_price from oes.products  
group by category_id) as min_t
on p.category_id = min_t.category_id and p.list_price = min_t.min_price;

--c4 --  common table experession with in function

with minprice as 
( select category_id, min(list_price) as min_price from oes.products 
GROUP BY category_id)

select product_id, product_name, list_price,category_id from oes.products as p
where p.list_price in ( select min_price from minprice where p.category_id = minprice.category_id);



--c4 -- common table experetion with inner join 
with minprice as 
( select category_id, min(list_price) as min_price from oes.products 
GROUP BY category_id)

select product_id, product_name, list_price, p.category_id from oes.products as p
inner join 
minprice 
on p.category_id = minprice.category_id and p.list_price = minprice.min_price;


--- c5 --

with minprice as 
( select category_id, min(list_price) as min_price from oes.products 
GROUP BY category_id)

select product_id, product_name, list_price, p.category_id , pc.category_name from oes.products as p
inner join 
minprice 
on p.category_id = minprice.category_id and p.list_price = minprice.min_price
inner join 
oes.product_categories   as pc
on p.category_id = pc.category_id;

--- c6 --

select * from oes.orders;
select * from hcm.employees;

with emp as 
( select employee_id from oes.orders where employee_id is not null) 

select employee_id, first_name, last_name from hcm.employees  e
where e.employee_id not in (select employee_id from emp );

select employee_id, first_name, last_name from hcm.employees e 
where e.employee_id not in ( select employee_id from oes.orders where employee_id is not null);

--- c7 --

select employee_id, first_name, last_name from hcm.employees e 
where not exists ( select employee_id from oes.orders o where e.employee_id = o.employee_id );

--- c8 --

select customer_id, first_name, last_name , email from oes.customers 
where customer_id in ( select * from oes.orders)




