-- stored procedure 

create procedure HCM.FilterEMPbyDepartment_1 
( @DEPARTMENT_NAME VARCHAR(50))
AS

SELECT EM.first_name, EM.city, EM.department_id FROM HCM.departments AS DP
INNER JOIN 
HCM.employees AS EM
ON DP.department_id = EM.department_id
where dp.department_name = @DEPARTMENT_NAME;
go

EXECUTE HCM.FilterEMPbyDepartment_1 'Finance';
go


alter procedure HCM.FilterEMPbyDepartment_1
( @department_name char(50))

as
	select department_id from hcm.departments
	where department_name = @department_name

;

execute hcm.FilterEMPbyDepartment_1 'Finance';

drop procedure hcm.FilterEMPbyDepartment_1;


create table hcm.mytable 
( My_id int not null identity(1,1),
  My_name varchar(20) not null,
  My_country varchar(30),
  constraint pk_myTable_MyID primary key (My_id)
  );

insert into hcm.mytable
values ('Nahid Ferdous', 'Bangldesh'),
       ('Marzia Khan', 'USA')
       ;

-- now we will apply store procedure with input output parameters 
go

ALTER procedure hcm.mytableprocedure
( @name varchar(20), @country varchar(30), @id int out)

as 
SET NOCOUNT ON;  -- Prevents the display of update messages to the user.
SET XACT_ABORT ON;  -- Ensures that if any error occurs during the procedure, the entire statement is rolled back.

BEGIN 
INSERT INTO hcm.mytable 
VALUES( @name, @country);
SELECT @ID = SCOPE_IDENTITY();  -- Retrieves the last identity value generated in the current session and scope, and assigns it to the variable @ID.
END

GO

DECLARE @ID_NEW INT;  -- Declares a new integer variable @ID_NEW to store additional data.

EXECUTE HCM.mytableprocedure @NAME = 'Jalal', @COUNTRY = 'Bangladesh' , @ID = @ID_NEW OUT ;
SELECT @ID_NEW;

SELECT * FROM hcm.mytable;

go


drop procedure oes.getQuantityOnHand;
go

ALTER procedure oes.getQuantityOnHand 
(@product_id int, @warehouse_id int)
as 
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN 
	SELECT quantity_on_hand 
	FROM OES.inventories
	WHERE product_id = @product_id AND warehouse_id = @warehouse_id
END 
GO

EXECUTE OES.getQuantityOnHand @PRODUCT_ID = 4 , @WAREHOUSE_ID = 2 ;

DROP PROCEDURE OES.getCurrentProducts;

ALTER PROCEDURE OES.GETCURRENTPRODUCTS 
( @PRODUCT_NAME VARCHAR(100), @MAX_LIST_PRICE DECIMAL(19,4) , @DISCONTINUED INT = 0)

AS 
	SET XACT_ABORT ON;
	SET NOCOUNT ON; 
BEGIN 

	SELECT product_id , product_name , list_price FROM OES.products
	WHERE 
		discontinued = @DISCONTINUED 
		AND 
		product_name like '%' + @PRODUCT_NAME + '%' 
		AND 
		list_price <= @MAX_LIST_PRICE
END 
GO

EXECUTE OES.GETCURRENTPRODUCTS @PRODUCT_NAME = 'Drone', @MAX_LIST_PRICE = 700;


select * from oes.bank_accounts;
SELECT * FROM OES.bank_transactions;

drop procedure oes.bankTransfer;

CREATE procedure oes.bankTransfer
	(@withdraw_account_ID int, @deposit_account_ID int, @transfer_amount decimal(30,2))
as
set nocount on;
--set xact_abort on;

Begin TRANSACTION
	UPDATE OES.bank_accounts
	SET BALANCE = BALANCE - @TRANSFER_AMOUNT
	WHERE account_id = @withdraw_account_id ;

	UPDATE OES.bank_accounts
	SET BALANCE = BALANCE + @TRANSFER_AMOUNT
	WHERE account_id = @deposit_account_ID ;
	INSERT INTO OES.bank_transactions (from_account_id, to_account_id, amount)
	VALUES (@WITHDRAW_ACCOUNT_ID, @DEPOSIT_ACCOUNT_ID, @transfer_amount ) ; 

COMMIT TRANSACTION ;
GO

EXECUTE OES.bankTransfer @WITHDRAW_ACCOUNT_ID = 1 , @DEPOSIT_ACCOUNT_ID = 3, @TRANSFER_AMOUNT = 250;
EXECUTE OES.bankTransfer @WITHDRAW_ACCOUNT_ID = 2 , @DEPOSIT_ACCOUNT_ID = 4, @TRANSFER_AMOUNT = 350;
EXECUTE OES.bankTransfer @WITHDRAW_ACCOUNT_ID = 3 , @DEPOSIT_ACCOUNT_ID = 4, @TRANSFER_AMOUNT = 150;
EXECUTE OES.bankTransfer @WITHDRAW_ACCOUNT_ID = 4 , @DEPOSIT_ACCOUNT_ID = 1, @TRANSFER_AMOUNT = 450;


SELECT * FROM OES.bank_accounts;
SELECT * FROM OES.bank_transactions;

TRUNCATE TABLE OES.bank_transactions;
DELETE OES.bank_transactions;