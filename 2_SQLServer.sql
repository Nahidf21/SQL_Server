--- COALESCE(exp1,exp2,exp3,value)

--- COALESCE functin can help us to fill null field from another column 

select count(*) Not_shipted from oes.orders 
where shipped_date is null;

select * from oes.orders
where order_date = '2020-02-26';

select * from oes.orders
where order_date >= '2020-01-01';

--- collation 
--- COLLATE Latin1_General_CS_AS - CS means case sensitive 
--- if we try to return 'name_nahid' then we need to use '%name!_nahid%' ESCAPE '!'
--- CHECK META DATA FROM INFORMETION_SCHEMA.COLUMNS

SELECT 
	table_schema,
	table_name,
	column_name,
	data_type,
	collation_name
from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'hcm' and TABLE_NAME = 'countries';

select * from hcm.countries
where country_name like 'N%';

select * from oes.customers
where email like '%gmail%';

select * from oes.products
where product_name like '%mouse%';

select * from oes.products 
where product_name like '%[0-9]';



