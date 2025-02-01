use SAMPLEDB;
go

--c1

select * from oes.products;

select p1.product_id, p1.product_name, p1.list_price, p1.category_id 
from oes.products as p1
where p1.list_price = ( select min(p2.list_price) as low_price from  oes.products as p2
		where p1.category_id = p2.category_id
		) ;

with t1 as 
(select 
	product_id, 
	product_name, 
	list_price,
	min(list_price) over ( partition by category_id ) as min_price, 
	category_id 
from oes.products)
select 
	product_id, 
	product_name, 
	list_price,
	category_id
from t1 
where min_price = list_price and product_id = product_id
;







		