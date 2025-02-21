select * from bird.california_sightings;
select * from bird.arizona_sightings;

-- return all common name 

select common_name  from 
bird.california_sightings 

union all

select common_name from 
bird.arizona_sightings

-- return only distrinct name 

select common_name  from 
bird.california_sightings 
union
select common_name from 
bird.arizona_sightings

-- which species is or are common in Arizona and california 

select common_name  from 
bird.california_sightings 
intersect 
select common_name from 
bird.arizona_sightings

SELECT * FROM BIRD.california_sightings;

SELECT scientific_name FROM BIRD.california_sightings 
EXCEPT 
SELECT scientific_name FROM BIRD.arizona_sightings;

SELECT scientific_name FROM BIRD.arizona_sightings
EXCEPT
SELECT scientific_name FROM BIRD.california_sightings; 

SELECT scientific_name FROM BIRD.arizona_sightings
UNION
SELECT scientific_name FROM BIRD.california_sightings; 

SELECT * FROM BIRD.california_sightings;

-- UNIQUE COMBINETIONS OF SSTATE AND SPECIES NAME 

SELECT scientific_name, STATE_NAME = 'CA' FROM bird.california_sightings 
UNION 
SELECT scientific_name, STATE_NAME = 'AZ' FROM bird.arizona_sightings
UNION 
SELECT scientific_name, STATE_NAME = 'FL' FROM bird.florida_sightings
ORDER BY STATE_NAME , scientific_name;

-- 
SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date FROM bird.california_sightings 
UNION ALL
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date FROM bird.arizona_sightings
UNION ALL
SELECT observation_id, common_name = NULL  , scientific_name, locality, sighting_datetime FROM bird.florida_sightings;


(SELECT DISTINCT(O.customer_id) FROM OES.customers AS C
LEFT JOIN 
OES.orders AS O
ON C.customer_id = O.customer_id)
INTERSECT
(SELECT customer_id FROM oes.orders
INTERSECT
SELECT customer_id  FROM OES.customers)
;

--22,57,92,93
-- NULL 

SELECT product_id FROM OES.products
EXCEPT 
SELECT product_id FROM OES.inventories

-- 78,79

SELECT DISTINCT(P.product_id) FROM OES.products AS P
RIGHT JOIN 
OES.inventories AS I
ON P.product_id= I.product_id
ORDER BY P.product_id ;



