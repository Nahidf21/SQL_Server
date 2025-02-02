use SAMPLEDB;
go

select * from oes.customers;

select concat(first_name,' ', last_name) as full_name from oes.customers;

with fn as 
(select concat(first_name,' ', last_name) as full_name from oes.customers)
select full_name, CHARINDEX ( ' ', full_name) as indecx_position from fn ;

with fn as 
(select concat(first_name,' ', last_name) as full_name from oes.customers)
select full_name, LEFT(full_name, 2) first_two_char from fn ;

with fn as 
(select concat(first_name,' ', last_name) as full_name from oes.customers)
select 
	full_name, 
	CHARINDEX(' ', full_name)+1 starting_index, 
	len(full_name) Total_lenth ,   
	SUBSTRING ( full_name, CHARINDEX( ' ', full_name) +1, len(full_name)) as second_name,
	SUBSTRING ( full_name, 1, CHARINDEX( ' ', full_name)) as First_name
	from fn;

-- date and time 

-- getdate(), CURRENT_TIMESTAMP , SYSUTCDATETIME() , CUST()

select GETDATE() as date;
select CURRENT_TIMESTAMP as current_date_value;
select SYSUTCDATETIME() as current_value;

select CAST( getdate() as time);

select GETUTCDATE();
select cast( GETUTCDATE() as date );

select first_name, hire_date from hcm.employees;
select first_name, DATEPART( year, hire_date ) as year_date from hcm.employees;
select first_name, DATEPART( MONTH, hire_date ) as year_date from hcm.employees;
select first_name, DATENAME ( MONTH, hire_date ) as year_MONTH from hcm.employees;
select first_name, DATENAME ( DAY, hire_date ) as year_DAY from hcm.employees;
select first_name, DATENAME ( WEEKDAY, hire_date ) as year_DAY from hcm.employees;

select first_name, DATEDIFF(year, hire_date, CURRENT_TIMESTAMP) from hcm.employees;

select first_name , DATEADD(YEAR, 2,hire_date) from hcm.employees;
select first_name, DATEDIFF( year, hire_date, CURRENT_TIMESTAMP ) from hcm.employees;

select first_name, last_name,  DATEDIFF( year, hire_date, CURRENT_TIMESTAMP ) as Total_years, 
count(*) over (partition by DATEDIFF( year, hire_date, CURRENT_TIMESTAMP ) ) as Number_of_Employee
from hcm.employees
;

--c1

select 
	employee_id,	
	first_name, 
	last_name, 
	CONCAT(first_name,' ', last_name) as Employee_name 
from hcm.employees;

--c2

select 
          employee_id,	
	first_name, 
	last_name,
	middle_name,
	CONCAT(first_name,' '+ middle_name,' '+ last_name) as Employee_name
from hcm.employees;

--c3

select scientific_name , 
	SUBSTRING(scientific_name, 1, CHARINDEX(' ',scientific_name) -1) as Genus_name, 
          SUBSTRING(scientific_name, CHARINDEX(' ',scientific_name ) +1, len(scientific_name)) as Species_name
from bird.antarctic_species;

--c4 
select 
SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name)+1, len(scientific_name)) as Species_name
from bird.antarctic_species;

--c5
select 
	employee_id, 
	first_name, 
	last_name , 
	birth_date , 
	DATEDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) as Employee_age 
from hcm.employees;

--c6

select order_date, shipped_date , DATEADD(DAY,7, order_date) as Estimated_shipping_date from oes.orders
where shipped_date is null;

select * from oes.orders;
select * from oes.shippers;

--c7

with all_info as (			     
select s.company_name, DATEDIFF(DAY, order_date,shipped_date) as shipping_date from oes.orders as o
inner join 
oes.shippers as s on o.shipper_id = s.shipper_id )
select company_name, avg(shipping_date) as avg_shipping_date from all_info 
group by company_name;

--c1 case

select product_id, product_name , discontinued,
case discontinued 
	when 0 then 'NO'
	when 1 then 'YES'
	else 'unknown'
	end as discontinued_discription
from oes.products;

--c2 case
select 
	product_id,
	product_name,
	list_price,
	case 
	when list_price  < 50 then 'Low'
	when list_price >= 50 and list_price < 250 then 'Medium'
	when list_price >= 250 then 'High'
	else 'unknown'
	end as price_grade

from oes.products;

--c3 case

select 
	count(*) as number_of_orders,
case  
	when DATEDIFF(day,order_date,shipped_date) <= 7 then 'Shipped with in one week'
	when DATEDIFF(day,order_date,shipped_date) >= 7 then 'Shipped over a week'
	else 'Not yet shipping'
end as shipping_status
from oes.orders
group by 
case  
	when DATEDIFF(day,order_date,shipped_date) <= 7 then 'Shipped with in one week'
	when DATEDIFF(day,order_date,shipped_date) >= 7 then 'Shipped over a week'
	else 'Not yet shipping'
end ;


