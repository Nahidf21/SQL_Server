--- store procedure 

create procedure HumanResources.Human_test_top_10
as 
begin 
	select top (10) * from HumanResources.Department
end 
go
execute HumanResources.Human_test_top_10;

drop procedure HumanResources.Human_test_top_10;
drop procedure HumanResources.Human_test;

-- declare variable 

DECLARE @number INT;  -- Declares an integer variable named @number
SET @number = 12;     -- Assigns the value 12 to the variable
SELECT @number * 2;       -- Selects (outputs) the value of @number

select JobTitle, count(*) from HumanResources.Employee
group by JobTitle;
go
--Production Technician - WC10

declare @group_name varchar (30);
set @group_name = 'Production Technician - WC10';

select * from HumanResources.Employee
where JobTitle like @group_name;


--- CREATE A NEW DATABASE SUBQUERY 

create database SUBQUERY;
Use SUBQUERY
go

create table Admission
(
fname varchar (20),
lname varchar (20),
age int,
allergy char (1)
)


create table Surgery
(
fname varchar (20),
lname varchar (20),
age int,
allergy char (1)
)

create table Medication
(
fname varchar (20),
lname varchar (20),
age int,
allergy char (1)
)

create table History
(
fname varchar (20),
lname varchar (20),
age int,
allergy char (1)
)

--Insert values in admission table

Insert into Admission
values ('bob','smith',45, 'Y')

SELECT * FROM Admission;

Insert values in the other tables --<< using indentation and begin end blocks

Begin

	Insert into Surgery
	values ('bob','smith',45, 'Y')

End

 Begin

	Insert into Medication
	values ('bob','smith',45, 'Y')

End

 Begin

	Insert into History
	values ('bob','smith',45, 'Y')

End


GO


-- NOW USE STORED PROCEDURE TO UPDATE EACH TABLE

CREATE PROCEDURE USP_UPDATEALLERGY 
(@F_NAME VARCHAR(30), @L_NAME VARCHAR(30), @AGE INT, @ALLERGY_YES_OR_NO CHAR)

AS


BEGIN 
	UPDATE Admission
	SET 
	fname = @F_NAME,
	lname = @L_NAME,
	AGE = @AGE,
	allergy = @ALLERGY_YES_OR_NO
END

BEGIN 
	UPDATE Surgery
	SET
	fname = @F_NAME,
	lname = @L_NAME,
	age = @AGE,
	allergy = @ALLERGY_YES_OR_NO
END 

BEGIN 

	UPDATE Medication
	SET 
	fname = @F_NAME,
	lname = @L_NAME,
	age = @AGE,
	allergy = @ALLERGY_YES_OR_NO

	
END

BEGIN 	
	UPDATE History
	SET 
	fname = @F_NAME,
	lname = @L_NAME,
	age = @AGE,
	allergy = @ALLERGY_YES_OR_NO
END 


-- EXECUTE THE STORED PORCEDURE 

EXECUTE USP_UPDATEALLERGY 'MARZIA','KHAN',33,'Y' ;

SELECT * FROM Medication;





