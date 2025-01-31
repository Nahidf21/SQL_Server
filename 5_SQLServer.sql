use SAMPLEDB;
go

select *  from bird.california_sightings;
select * from bird.arizona_sightings;
select *  from bird.florida_sightings;

--c-1
select 
	sighting_id, common_name, scientific_name, location_of_sighting, sighting_date 
from bird.california_sightings
union  all
select 
	sighting_id, common_name, scientific_name, sighting_location, sighting_date
from bird.arizona_sightings;

--c-2
select  scientific_name from bird.california_sightings
union 
select  scientific_name from bird.arizona_sightings
order by scientific_name desc
;

--c-3
select state_name = 'California' , scientific_name  from bird.california_sightings
union 
select state_name = 'Arizona', scientific_name  from bird.arizona_sightings
order by state_name , scientific_name 
;

--c-4

select 
	sighting_id,common_name, scientific_name, location_of_sighting, sighting_date , sate_name = 'California'
from bird.california_sightings
union all
select
	sighting_id, common_name,  scientific_name, sighting_location, sighting_date , sate_name = 'Arizona'
from bird.arizona_sightings
union all 
select 
observation_id, common_name = 'Nulls', scientific_name, locality, sighting_datetime , sate_name = 'Florida'
from bird.florida_sightings;

--c-5

select * from oes.customers;
select * from oes.orders;


select customer_id from oes.customers
intersect 
select customer_id from oes.orders;

--c-6

select product_id  from oes.products
except 
select product_id from oes.inventories;




