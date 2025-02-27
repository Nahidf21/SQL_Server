-- Indexs 

alter view oes.dis_count as 
select count(distinct(location_id)) total_col from oes.warehouses
;

select count(distinct(location_id)) from oes.warehouses ;
select (select * from oes.dis_count)*1.0/ (select count(*) from oes.warehouses);
-- the output of this query is 1, that means this column is perfect for indexing.
-- 1 means the avg sensitivity is heigh.

create index index_warehouses_locetion_id 
on oes.warehouses( location_id) include(warehouse_name);


select (select count( distinct(product_name)) from oes.products) *1.0 / count(product_name) from oes.products;
-- the output is 1 that means this column is perfect for indexing 
-- 1 means the avg sensitivity is heigh.
-- unique index is non clustred index and all values of the column is unique.
create unique index unique_product_name 
on oes.products ( product_name);

go

-- rewrite the following query to make it sargable 

select 
	order_id,
	order_date
from oes.orders 
where year(order_date) = 2019;

-- after sargable 

select 
	order_id,
	order_date

from oes.orders 
where  order_date  >= '20190101' and order_date < '20200101';

select shipped_date, count(*) from oes.orders
group by shipped_date ;
-- inthe shipping date column we got 21 null values , we can use filter indexing for firster query.

create index filter_index_orders_shippingDate 
on oes.orders (shipped_date) where shipped_date is not null;

-- rewrite the following query and make it sargable 

select 
	customer_id, 
	first_name, 
	last_name, 
	email, 
	street_address

from oes.customers 
where left(first_name,2) = 'vi'
and last_name = 'Jones';

-- leats add include in the index 

create index filter_index_customers_first_name_AND_last_name 
on oes.customers (first_name, last_name) include ( email, street_address);

-- sargable query

select 
	customer_id, 
	first_name, 
	last_name, 
	email, 
	street_address

from oes.customers 
where first_name like 'vi%'
and last_name = 'Jones';




