--c1

select first_name, last_name
from hcm.employees;

select last_name as customer_last_name, city
from oes.customers;

select * from oes.order_items;

select * from hcm.departments;

select distinct department_name ,location_id from hcm.departments;

select distinct locality from bird.antarctic_populations;

select distinct locality, species_id from bird.antarctic_populations;



select top(2) last_name from oes.customers
order by last_name;

select top(2) with ties last_name from oes.customers
order by last_name;

select * from oes.orders;

select top(4) order_id , order_date from
oes.orders
order by freight_cost desc;

select top(4) with ties order_id , order_date from
oes.orders
order by freight_cost desc;


select last_name from 
hcm.employees
order by last_name;

select * from hcm.employees;

select first_name, salary from 
hcm.employees 
order by salary desc;

select top(10) first_name, hire_date from
hcm.employees
order by hire_date desc;

select top(10) with ties first_name, hire_date from
hcm.employees
order by hire_date desc;

select top(30) with ties department_id, salary
from hcm.employees
order by 	department_id, salary desc;

select top(10)  employee_id, first_name, last_name, Salary
from hcm.employees
order by salary desc;

select top(10)  employee_id, first_name, last_name, Salary
from hcm.employees
order by salary ;

