use SAMPLEDB;
go

create schema pdb; 

create table pdb.parks1
(
	park_id int identity(1,1) not null,
	park_name varchar(50) not null,
	enrty_fee decimal(6,2) not null,
	constraint pk_park_id primary key (park_id)
);

insert into pdb.parks1 (park_name, enrty_fee)
values ('Bellmont Park', 5.2),
       ('Redmond Park', 10),
       ('Highland Park', 11.43);

select  * from pdb.parks1;

create table pdb.park_visit 
(
	visit_id int not null identity(1,1),
	park_id int not null,
	visit_date date,
	first_name varchar(50),
	last_name varchar(50),
	constraint pk_visit_id primary key (visit_id),
	constraint fk_park_id foreign key (park_id)  references pdb.parks1 (park_id)
);
   
insert into pdb.park_visit ( park_id, visit_date, first_name, last_name) 
values 
	(2, '2024-12-12', 'Nahid','Ferdous'),
	(1, '2024-11-11', 'Marzia','Khan'),
	(1, '2024-10-11', 'Abid','Khan'),
	(3, '2024-09-10', 'Mahabub','Khan'),
	(1, '2024-12-08', 'Sabina','Khan'),
	(2, '2024-11-09', 'Sadia','Khan');

select * from pdb.park_visit;

select park_name, count(*) number_of_visitors, sum(enrty_fee) total_earning from pdb.park_visit  as v
inner join 
pdb.parks1 as p on v.park_id = p.park_id
group by park_name;


--c1
create table dbo.dept 
(
dept_id int not null identity(1,1),
dept_name  varchar(50) not null,
constraint pk_dept_dept_id   primary key (dept_id)
);

insert into dbo.dept (dept_name)
values ('Business Intelligence');

select * from dbo.dept;

insert into dbo.dept ( dept_name)
select department_name from hcm.departments;

select * from dbo.dept;

create table dbo.emp 
(
	emp_id int not null identity(1001,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	hire_date DATE,
	dept_id int not null,
	constraint pk_emp_emp_id primary key (emp_id),
	constraint fk_emp_dept_id foreign key (dept_id)  references  dbo.dept (dept_id));

insert into dbo.emp (first_name,last_name,hire_date,dept_id)
values 
	('Scott','Davis','2020-12-11',1),
	('Miriam','Yardley','2020-12-05',1);

select * from dbo.emp;





