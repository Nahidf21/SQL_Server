use SAMPLEDB;
go

select * from dbo.emp;

update dbo.emp
set 
 last_name =  'Greenbank'
 where first_name = 'Miriam' and last_name = 'Yardley';

select * from dbo.emp;

insert into dbo.emp	 (first_name,last_name, hire_date, dept_id)
values
('Nahid','Ferdous','2020-09-01',2);

delete dbo.emp 
where emp_id = 1004;

select * from dbo.emp;

delete dbo.emp 
where emp_id = 1002;

truncate table dbo.emp;


drop table dbo.emp;

drop table dbo.dept;

select * from dbo.emp; 

alter table dbo.emp
drop constraint fk_emp_dept_id;

select * from dbo.emp;

drop table dbo.dept;
drop table dbo.emp;









