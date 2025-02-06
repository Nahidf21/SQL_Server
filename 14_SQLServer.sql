use SAMPLEDB;
go

select * from oes.warehouses;
go

create index non_clustered_index_warehousName_locetionid on oes.warehouses (location_id);

drop index non_clustered_index_warehousName_locetionid on oes.warehouses;

create index 
	nonClusteredIndex_warehouse_warehouse_name 
	on oes.warehouses ( location_id) include (warehouse_name);

--c2
Select 
	order_id,
	order_date

from oes.orders
where order_date >= '20190101' and order_date < '20200101';
go

--- c3
create index 
	filteredIndex_orders_shippedDate 
	on oes.orders (shipped_date) 
where shipped_date is not null; 

--- c4

select 
customer_id, first_name, last_name, email, street_address
from 
oes.customers
where LEFT(first_name,2) = 'vi'
and last_name = 'Jones';


select 
customer_id, first_name, last_name, email, street_address
from 
oes.customers
where first_name like 'vi%'
and last_name = 'Jones';

create index 
	filtredIndex_customers_FirstLastName 
	on oes.customers (first_name, last_name) 
	include (email,street_address);






