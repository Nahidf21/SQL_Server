USE AdventureWorks2019;

-- 1. Retrieve all records from the Sales.Customer table where the FirstName column starts with the letter "J".
-- FirstName is not avilable 
SELECT * FROM Sales.Customer
WHERE FirstName LIKE 'J%';

-- 2. Find the length of the ProductName column in the Production.Product table.
SELECT Name, LEN(Name) AS ProductNameLength FROM Production.Product;

-- 3. Retrieve all records from the Person.Person table where the EmailAddress column ends with "@adventure-works.com".
SELECT * FROM Person.[EmailAddress]
WHERE EmailAddress LIKE '%@adventure-works.com';

-- 4. Convert the LastName column in the HumanResources.Employee table to uppercase. -- LastName is not avilable 
SELECT BusinessEntityID, UPPER(LastName) AS LastNameUpper FROM HumanResources.Employee;

-- 5. Retrieve all records from the Purchasing.PurchaseOrderHeader table where the VendorName column contains the substring "Parts".
SELECT * FROM Purchasing.PurchaseOrderHeader WHERE VendorName LIKE '%Parts%';

-- 6. Extract the first three characters from the City column in the Person.Address table.
SELECT City, LEFT(City, 3) AS CityPrefix FROM Person.Address;

-- 7. Replace all occurrences of "Standard" with "Premium" in the ProductModel column of the Production.ProductModel table.
SELECT ProductModelID, REPLACE(Name, 'Standard', 'Premium') AS ModifiedProductModel
FROM Production.ProductModel;

-- 8. Retrieve all records from the Production.Product table where the Color column is either 'Red' or 'Blue'.
SELECT * FROM Production.Product
WHERE Color IN ('Red', 'Blue');

-- 9. Concatenate the FirstName and LastName columns in the SalesPerson table.
SELECT BusinessEntityID, FirstName + ' ' + LastName AS FullName FROM Sales.SalesPerson;

-- 10. Retrieve all records from the Person.Person table where the FirstName column contains the substring "Ann".
SELECT * FROM Person.Person
WHERE FirstName LIKE '%Ann%';

-- 11. Find the position of the substring "Washer" within the ProductName column of the Production.Product table.
SELECT Name, CHARINDEX('Washer', Name) AS Position
FROM Production.Product
WHERE Name LIKE '%Washer%';

-- 12. Retrieve all records from the Production.ProductDescription table where the Description column is not null and not empty.
SELECT * FROM Production.ProductDescription
WHERE Description IS NOT NULL AND Description <> '';

-- 13. Convert the PhoneNumber column in the Person.PersonPhone table to a standardized format.
SELECT 
    BusinessEntityID, 
    PhoneNumber,
    '(' + SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber, ' ', ''), '(', ''), ')', ''), '-', ''), 2, 3) + ') ' +
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber, ' ', ''), '(', ''), ')', ''), '-', ''), 5, 3) + '-' +
    SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber, ' ', ''), '(', ''), ')', ''), '-', ''), 8, 4) 
    AS StandardizedPhone
FROM Person.PersonPhone;

-- 14. Retrieve all records from the Sales.SalesOrderHeader table where the SalesOrderNumber column starts with 'SO'.
SELECT * FROM Sales.SalesOrderHeader
WHERE SalesOrderNumber LIKE 'SO%';

-- 15. Extract the last two characters from the PostalCode column in the Person.Address table.
SELECT PostalCode, RIGHT(PostalCode, 2) AS LastTwoDigits FROM Person.Address;

-- 16. Replace all occurrences of "Mountain" with "Road" in the Name column of the Production.ProductCategory table.
SELECT ProductCategoryID, REPLACE(Name, 'Mountain', 'Road') AS UpdatedName
FROM Production.ProductCategory;

-- 17. Retrieve all records from the Person.Person table where the LastName column has more than 10 characters.
SELECT * FROM Person.Person
WHERE LEN(LastName) > 10;

-- 18. Split the AddressLine1 column in the Person.Address table into street name and house number.
-- confused ??? 
SELECT AddressLine1,
       PARSENAME(REPLACE(AddressLine1, ' ', '.'), 1) AS StreetName,
       LEFT(AddressLine1, CHARINDEX(' ', AddressLine1)) AS  HouseNumber
FROM Person.Address;

-- 19. Retrieve all records from the Production.Product table where the ProductNumber column is alphanumeric.
SELECT * FROM Production.Product
WHERE ProductNumber LIKE '%[0-9]%[A-Z]%';

-- 20. Extract the year from the BirthDate column in the Person.Person table.
SELECT BirthDate, YEAR(BirthDate) AS BirthYear FROM Person.Person;

-- 21. Find the position of the substring "ABC" within the ProductName column of the Production.Product table.
SELECT ProductName, CHARINDEX('ABC', ProductName) AS Position FROM Production.Product;

-- 22. Retrieve all records from the Sales.Customer table where the CompanyName column contains "Tech".
SELECT * FROM Sales.Customer
WHERE CompanyName LIKE '%Tech%';

-- 23. Concatenate FirstName and LastName columns in the Person.Person table.
SELECT BusinessEntityID, FirstName + ' ' + LastName AS FullName FROM Person.Person;

-- 24. Retrieve all records from the Production.Product table where the Weight column is greater than 10.
SELECT * FROM Production.Product
WHERE Weight > 10;

-- 25. Remove leading and trailing spaces from the Color column in the Production.Product table.
SELECT TRIM(Color) AS TrimmedColor FROM Production.Product;

-- 26. Retrieve all records from the Production.ProductSubcategory table where EnglishDescription is not null and not empty.
SELECT * FROM Production.ProductSubcategory
WHERE EnglishDescription IS NOT NULL AND EnglishDescription <> '';

-- 27. Convert the EmailAddress column in the Person.EmailAddress table to lowercase.
SELECT LOWER(EmailAddress) AS LowerCaseEmail FROM Person.EmailAddress;

-- 28. Retrieve all records from the Sales.SalesOrderDetail table where OrderQty is between 5 and 10.
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 AND 10;

-- 29. Extract the domain name from the EmailAddress column in the Person.EmailAddress table.
SELECT EmailAddress, SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, LEN(EmailAddress)) AS Domain
FROM Person.EmailAddress;

-- 30. Replace all occurrences of "Road" with "Mountain" in the Name column of the Production.ProductSubcategory table.
SELECT ProductSubcategoryID, REPLACE(Name, 'Road', 'Mountain') AS UpdatedName
FROM Production.ProductSubcategory;

-- 31. Retrieve all records from the Sales.SalesOrderHeader table where SalesOrderNumber ends with '35'.
SELECT * FROM Sales.SalesOrderHeader
WHERE SalesOrderNumber LIKE '%35';

-- 32. Split the FullName column in the Person.Person table into first and last name.
SELECT BusinessEntityID, FirstName, LastName FROM Person.Person;

-- 33. Retrieve all records from the Production.Product table where the ListPrice column is not null.
SELECT * FROM Production.Product
WHERE ListPrice IS NOT NULL;

-- 34. Extract the month from the OrderDate column in the Sales.SalesOrderHeader table.
SELECT OrderDate, MONTH(OrderDate) AS OrderMonth FROM Sales.SalesOrderHeader;

-- 35. Retrieve all records from the Sales.Customer table where the FirstName column starts with a vowel.
SELECT * FROM Sales.Customer
WHERE FirstName LIKE '[AEIOU]%';

-- 36. Find the length of the ProductName column in the Production.Product table excluding leading/trailing spaces.
SELECT Name, LEN(LTRIM(RTRIM(Name))) AS TrimmedLength FROM Production.Product;

-- 37. Retrieve all records from the Person.Person table where the EmailAddress column ends with ".net" and contains an underscore.
SELECT * FROM Person.Person
WHERE EmailAddress LIKE '%_%@%.net';

-- 38. Retrieve all records from the Production.Product table where the Weight column is greater than the average weight.
SELECT * FROM Production.Product
WHERE Weight > (SELECT AVG(Weight) FROM Production.Product);

-- 39. Retrieve all records from the Sales.SalesOrderDetail table where OrderQty is between sqrt(10) and cube root of 64.
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN SQRT(10) AND POWER(64, 1.0/3);


--select POWER(64, 1.0/3)
--select SQRT(10)









--1) Difference between REPLACE and STUFF
--REPLACE: Replaces all occurrences of a substring in a string.
--STUFF: Deletes a portion of a string and inserts another substring at a specified position.

--2) Difference between PATINDEX and CHARINDEX
--PATINDEX: Finds the starting position of a pattern using wildcards (%).
--CHARINDEX: Finds the starting position of a substring (no wildcards).

--3) Queries using AdventureWorks Employee Table

-- a) Count of job titles with one word
SELECT COUNT(*) FROM HumanResources.Employee WHERE JobTitle NOT LIKE '% %';

-- b) Count of job titles with two words
SELECT COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '% %' AND JobTitle NOT LIKE '% % %'
AND TRIM(JobTitle) = JobTitle;

-- c) Count of job titles with three words
SELECT COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '% % %' AND JobTitle NOT LIKE '% % % %';


-- d) Count of employees with the first and last character the same in JobTitle
SELECT COUNT(*) FROM HumanResources.Employee WHERE LEFT(JobTitle, 1) = RIGHT(JobTitle, 1);

-- e) Create date keys from HireDate and BirthDate
SELECT BusinessEntityID, 
       CONVERT(VARCHAR(8), HireDate, 112) AS HireDateKey,
       CONVERT(VARCHAR(8), BirthDate, 112) AS BirthDateKey
FROM HumanResources.Employee;





--4) Queries using Person.Person Table

-- a) Create FullName column
SELECT BusinessEntityID, FirstName + ' ' + LastName AS FullName FROM Person.Person;

-- b) Find the length of FullName column
SELECT BusinessEntityID, LEN(FirstName + ' ' + LastName) AS FullNameLength FROM Person.Person;

-- c) Count of persons with more than two words in FullName
SELECT COUNT(*) FROM Person.Person WHERE FirstName LIKE '% %';

-- d)  create email column for each person, by adding '@gmail.com' after firstname
SELECT BusinessEntityID, FirstName + '@gmail.com' AS Email FROM Person.Person;

-- e) Find persons with more than 2 'D's in FirstName
SELECT * FROM Person.Person WHERE (LEN(FirstName) - LEN(REPLACE(FirstName, 'D', ''))) > 2;
--Find persons with >= 2 'D's in FirstName
SELECT * FROM Person.Person WHERE (LEN(FirstName) - LEN(REPLACE(FirstName, 'D', ''))) >= 2;


-- f) Create FullName column and sort by the third letter
SELECT BusinessEntityID, FirstName + ' ' + LastName AS FullName
FROM Person.Person
ORDER BY SUBSTRING(FirstName + ' ' + LastName, 3, 1);







--5) Queries for candidate Table

-- Create table and insert values
CREATE TABLE candidate (sname VARCHAR(20));
INSERT INTO candidate VALUES ('Nitin,Gupta'), ('Abhinav,Atrey'), ('Vivek,Singh');

-- a) Replace comma with '-' using STUFF
SELECT STUFF(sname, CHARINDEX(',', sname), 1, '-') FROM candidate;

-- b) Display LastName in reverse order
SELECT REVERSE(RIGHT(sname, CHARINDEX(',', REVERSE(sname)) - 1)) AS ReversedLastName FROM candidate;

-- c) Split FirstName and LastName into separate columns
SELECT LEFT(sname, CHARINDEX(',', sname) - 1) AS FirstName,
       RIGHT(sname, CHARINDEX(',', REVERSE(sname)) - 1) AS LastName
FROM candidate;