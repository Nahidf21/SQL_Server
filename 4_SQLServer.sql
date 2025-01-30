use SAMPLEDB;
go

select * from hcm.employees;
select * from hcm.departments;

select e.employee_id, e.first_name, e.last_name , e.salary , c.department_name from 
hcm.employees as e inner join hcm.departments as c
on e.department_id = c.department_id;

select e.employee_id, e.first_name, e.last_name , e.salary , c.department_name from 
hcm.employees as e left outer  join hcm.departments as c
on e.department_id = c.department_id;


select c.department_name, count(e.employee_id) employee_count from 
hcm.employees as e left join hcm.departments as c
on e.department_id = c.department_id
group by c.department_name;

--- Predicate placement - on clause vs where clause 
--- cross join is the cartisen product of the two table rows, like 2 rows x3 rows = 6 rows 

select * from hcm.employees;

select 
	e2.employee_id, e2.first_name, e2.last_name ,  
	e1.first_name as Manager_first_name , e1.last_name as Manager_last_name

from hcm.employees as e1 right join hcm.employees as e2
on e1.employee_id = e2.manager_id;

select * from oes.warehouses;
select * from oes.inventories;
select * from oes.products;

select 
	p.product_id, p.product_name, o.warehouse_id, o.warehouse_name, i.quantity_on_hand 
from 
	oes.products as p 
	right join oes.inventories as i 
	on p.product_id = i.product_id
	right join oes.warehouses as o
	on i.warehouse_id = o.warehouse_id ;

select * from hcm.countries;
select * from hcm.employees
where country_id = 2;
select * from hcm.jobs;
select * from hcm.departments;

select 
	e.employee_id, 
	e.first_name, 
	e.last_name , 
	j.job_title , 
	e.state_province, 
	c.country_name , 
	d.department_name
from 
	hcm.employees as e right join  hcm.jobs  as j
	on e.job_id = j.job_id 

	left join hcm.departments as d 
	on e.department_id = d.department_id

	left join hcm.countries as c
	on e.country_id = c.country_id

where c.country_name = 'Australia';


select * from oes.products; 
select * from oes.order_items;
select * from oes.product_categories;

select c.category_name, p.product_name , o.quantity from 
oes.order_items as o  left join oes.products as p 
on o.product_id = p.product_id
left join oes.product_categories as c
on p.category_id = c.category_id
order by c.category_name , p.product_name;


select c.category_name, sum(o.quantity) as Total_product from 
oes.order_items as o  left join oes.products as p 
on o.product_id = p.product_id
left join oes.product_categories as c
on p.category_id = c.category_id
group by c.category_name 
order by c.category_name ;

select * from oes.products; 
select * from oes.order_items;
select * from oes.product_categories;

select pc.category_name, p.product_name , sum(coalesce(o.quantity,0)) as Total_quentity from 
oes.products as p left join oes.order_items  as o
on p.product_id = o.product_id 
left join oes.product_categories as pc
on p.category_id = pc.category_id
---where isnull(o.quantity,0) = 0
group by pc.category_name, p.product_name
order by pc.category_name, p.product_name;