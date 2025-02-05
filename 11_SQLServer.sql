
--- Stored procedures 

use SAMPLEDB;
go

create procedure hcm.getEmployeesByDepartment (@department_name varchar(50))
As

select 
	e.employee_id, 
	e.first_name, 
	e.last_name, 
	d.department_name
from hcm.employees as e inner join hcm.departments  as d
on e.department_id = d.department_id
where d.department_name = @department_name;

go

exec hcm.getEmployeesByDepartment @department_name = 'Finance';

go

create procedure hcm.getCountrynameNameEmailFromCustoments 
(  @countryName varchar(50),
   @email varchar(50) )
AS 
Begin 

Select 
	cu.customer_id,
	cu.first_name,
	cu.last_name,
	cu.email,
	co.country_name
FROM 
oes.customers AS cu inner join hcm.countries AS co
ON  cu.country_id = co.country_id
WHERE 
co.country_name = @countryName 
and 
cu.email like '%' + @email + '%'
END ;

EXEC hcm.getCountrynameNameEmailFromCustoments @countryname = 'Australia', @email = 'gmail';

GO

create procedure hcm.maxSalaryminSalaryFromSalary 
(@minSalary decimal(10,2) = 0,
 @maxSalary decimal(10,2) = 90000)
AS
BEGIN 

SELECT 
employee_id,
first_name,
last_name,
salary

FROM 
hcm.employees where salary > @minSalary and salary < @maxSalary
end;

execute hcm.maxSalaryminSalaryFromSalary  @maxSalary = 78000  ;

go


create table pdb.parks2 
(	park_id int not null identity(1,1),
	park_name varchar(50) not null,
	park_entry_fees decimal(6,2),
	constraint pk_parks2_park_id primary key (park_id)
);

insert into pdb.parks2 ( park_name, park_entry_fees)
values 
	('Mayor Park',10.45),
	('Travise Park', 9.23),
	('Tomball Park',7.9)
;

select * from pdb.parks2;
go

create procedure hcm.addnewpark 
( @park_name varchar(50),
  @entry_fee decimal(10,2),
  @new_park_id int out
)

AS 
SET NOCOUNT ON;
SET xact_ABORT ON;

BEGIN 

INSERT INTO PDB.parks2 (park_name,park_entry_fees)
VALUES (@park_name,@entry_fee)

SELECT @new_park_id = SCOPE_IDENTITY();
END ;
GO

DECLARE @park_id int;
EXECUTE HCM.addnewpark @PARK_NAME = 'Austin Park', @entry_fee = 9.20 , @new_park_id = @park_id out;
select @park_id;

select * from pdb.parks2;
go

update pdb.parks2
set park_name = 'Houston Park'
where park_id in (4,5);

select * from pdb.parks2;

alter table pdb.parks2
alter column park_name varchar(45) not null;



