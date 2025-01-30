use SAMPLEDB;
go

select * from oes.products;

select category_id, sum(list_price)  Total_price, avg(list_price) as Avg_price, max(list_price) Max_price, 
min( list_price) Min_price,count(list_price) Total_product
from oes.products
where discontinued = 0  and list_price is not null
group by category_id
having category_id in (7,3,4,1,2,5)
order by category_id;

select * from hcm.employees;

select department_id, count(employee_id) Total_employees from hcm.employees
where employee_id is not null and department_id is not null
group by department_id;

select 
	department_id, round(avg(salary),2) as Total_salary
from 
	hcm.employees
where 
	department_id is not null
group by 
	department_id
order by 
	Total_salary;

select * from oes.inventories;

select warehouse_id, sum(quantity_on_hand)  as Total_Quantity
from oes.inventories
group by  warehouse_id
having sum(quantity_on_hand) > 5000;

select * from bird.antarctic_populations;

select locality, max(date_of_count) Most_recent_populetion_count
from bird.antarctic_populations
group by locality;


select	species_id,
	locality, 
	max(date_of_count)
from bird.antarctic_populations
group by species_id,locality;

select * from hcm.employees;

select first_name, city 
from hcm.employees
where city ='Seattle' or city = 'Sydney';

select first_name, city 
from hcm.employees
where city in ('Seattle','Sydney','Ascot','Hillston');

select first_name, city , salary
from hcm.employees
where city = 'Sydney'  and salary > 50000;


select first_name, city , hire_date
from hcm.employees
where city in ('Seattle','Sydney')  and hire_date >= '2019-01-01';

select * from oes.products;

select product_name, category_id 
from oes.products 
where category_id not in (1,2,5);





