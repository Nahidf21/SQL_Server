---c1

use SAMPLEDB;
go

select * from oes.inventories;
go

create procedure oes.getQuantityOnHand 
( @product_id int,
  @warehouse_id int)
AS
Begin
select
count(quantity_on_hand) as total_quantity
from
oes.inventories 
where warehouse_id = @warehouse_id and product_id = @product_id
group by quantity_on_hand
end;

execute oes.getQuantityOnHand @product_id = 1, @warehouse_id = 3;
go

alter procedure oes.getQuantityOnHand 
( @product_id int,
  @warehouse_id int)
AS
Begin
select
sum(quantity_on_hand) as total_quantity
from
oes.inventories 
where warehouse_id = @warehouse_id and product_id = @product_id
group by quantity_on_hand
end;

execute oes.getQuantityOnHand   @product_id = 1, @warehouse_id = 3;
go

alter procedure oes.getQuantityOnHand 
( @product_id int,
  @warehouse_id int)
AS
Begin
select
quantity_on_hand
from
oes.inventories 
where warehouse_id = @warehouse_id and product_id = @product_id
end;

execute oes.getQuantityOnHand   @product_id = 4, @warehouse_id = 2;

go
select * from oes.products;
go

---c2--

create procedure oes.getCurrentProducts 
( @product_name varchar(100),
  @max_list_price decimal(10,2)
)
AS
Begin 
	select product_name as current_product 
	from oes.products 
	where discontinued = 0 and product_name like '%' + @product_name + '%' and list_price < @max_list_price
end ;

execute oes.getCurrentProducts @product_name = 'Drone' , @max_list_price = 700;
go

---c3
create procedure oes.bankTransfer 
(	@withdraw_account_id int,
	@deposit_acount_id int,
	@transfer_amount decimal(30,2)
)
AS
set nocount on;
set xact_abort on;
Begin 
Begin Transaction;

update oes.bank_accounts 
set balance = balance - @transfer_amount
where account_id = @withdraw_account_id;

update oes.bank_accounts 
set balance = balance - @transfer_amount
where account_id = @deposit_acount_id;

insert into oes.bank_transactions (from_account_id, to_account_id, amount)
values ( @withdraw_account_id, @deposit_acount_id, @transfer_amount)

commit Transaction;
End
go

execute oes.bankTransfer @withdraw_account_id = 2, @deposit_acount_id = 3 , @transfer_amount = 100;

select * from oes.bank_accounts;
select * from oes.bank_transactions;

delete  oes.bank_transactions;







