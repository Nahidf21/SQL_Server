use SAMPLEDB;
go

select * from hcm.employees;

--- add a new column onto hcm.employees table 

alter table hcm.employees 
add termination_date date;


--- change the datatypes of first_name and last_name columns 

alter table hcm.employees 
alter column first_name nvarchar(60);

alter table hcm.employees
alter column last_name nvarchar(60);

--- rename the column name phone to main_phone into oes.customers table 
go

sp_rename 'oes.customers.new_phone', 'new_phone1', 'COLUMN' ;
GO

--- ADD AN UNIQUE KEY CONSTRAINT INTO THE DEPARTMENTS TABLE IN DEPARTMENT NAME COLUMN 

ALTER TABLE HCM.DEPARTMENTS 
ADD CONSTRAINT UK_DEPARTMENT_DEPARTMENT_NAME UNIQUE ( DEPARTMENT_NAME);

SELECT * INTO DBO.TEST_TABLE 
FROM HCM.countries;

SELECT * FROM DBO.TEST_TABLE;

--- check constraint 
alter table dbo.test_table 
add constraint check_testTable_countryName check ( country_id > 0);	go

---

alter table hcm.employees
add constraint check_employees_salary check ( salary > 0);

