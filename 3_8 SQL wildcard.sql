--create table for wild card 

CREATE TABLE NAHID.WIRLDCARD 
(
	CARD_TEXT VARCHAR(50)
)


INSERT INTO NAHID.WIRLDCARD
VALUES 
('_THE NAME IS _ NAHID'),
('_THE FULL NAME IS _ NAHID'),
('%_[BANGLADESH'),
('10% DISCOUNT'),
('10 PERCENT DISCOUNT')


SELECT * FROM NAHID.WIRLDCARD
WHERE CARD_TEXT LIKE '$%$_$[BAN%' ESCAPE '$';

SELECT * FROM NAHID.WIRLDCARD
WHERE CARD_TEXT LIKE '%NAH%' OR CARD_TEXT LIKE '%BAN%' ;

SELECT * FROM NAHID.WIRLDCARD
WHERE CARD_TEXT LIKE '%__$[BAN%'  ESCAPE '$'; -- __[BANG

SELECT * FROM NAHID.WIRLDCARD
WHERE CARD_TEXT LIKE '%[^IS$_NAHID]%' ESCAPE '$'

SELECT * FROM NAHID.WIRLDCARD
WHERE CARD_TEXT LIKE '%[^IS$_NAHID,B]%' ESCAPE '$'


select distinct object_name(object_id)
from sys.columns
where object_name(object_id) like '[^sys,V]%'

-- CARET , UNDERSCORE, [], % 

exec sp_columns CARD_TEXT;
exec sp_helpdb 
exec sp_who

-- system define function 
select APP_NAME();
select HOST_ID();
select USER_NAME();

select @@SERVERNAME , @@ROWCOUNT

-- metadata function

select OBJECT_ID('NAHID.WIRLDCARD');
select OBJECT_NAME('1575676661');
select db_id('master');
select SCHEMA_ID('nahid');

-- string manipuletion function 

-- len()
-- substring(col_name, start_position, end_position)
-- charindex('cahr',column_name)
-- upper(column_name)
-- lower( column_name)
-- trim(column_name) this function remove the extra spaces 
-- replace(column_name, 'old_string','new_string')
-- patindex('%patern%', column_name) if the patern matched the it return index number
-- left(column_name, number) 
-- right(column_name, number)
select STUFF('hello world',7,4,'universe')
-- stuff and replace same function but stuff has more control.

-- concatrnate 

select 'this is my name ' + 'my name is nahid';
select CONCAT('My',' ','Name',' ','Is',' ','Nahid');
select concat_ws('_', 'My','Name','Is','Nahid');

select getdate();
select sysdatetime();
select format(getdate(), 'yy/MM/dd/mm');
select dateadd(year,4,getdate());
select datediff(day,day(getdate()),7);
select month(getdate())

select getdate();
select month(getdate());
select datepart(month,getdate());

select datename(week,getdate());
select getutcdate();

select datediff ( hour, getutcdate(), getdate());
select datefromparts(2025,01,04)
select eomonth(getdate())

-- mathematical function 

select cast(100.99780 as int);

