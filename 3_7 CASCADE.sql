-- check CASCADE

USE AdventureWorks2019;

SELECT * FROM Production.TransactionHistory;
SELECT * FROM Production.Product;

SELECT ProductID, Name  INTO NAHID.PRODUCTS FROM Production.Product;
SELECT TransactionID, ProductID , Quantity INTO NAHID.TRANSACTIONS FROM Production.TransactionHistory;

SELECT * FROM NAHID.PRODUCTS;
SELECT * FROM NAHID.TRANSACTIONS;

ALTER TABLE NAHID.PRODUCTS
ADD CONSTRAINT PK_NAHID_PRODUCT_PRODUCT_ID PRIMARY KEY (ProductID);

ALTER TABLE NAHID.TRANSACTIONS
ADD CONSTRAINT PK_NAHID_TRANSACTIONS_TransactionID PRIMARY KEY (TransactionID);

ALTER TABLE NAHID.TRANSACTIONS
DROP CONSTRAINT FK_NAHID_TRANSACTIONS_PRODUCT_ID;

ALTER TABLE NAHID.TRANSACTIONS 
ADD CONSTRAINT DF_NAHID_TRANSACTIONS_ProductID 
DEFAULT 1000 FOR ProductID;

ALTER TABLE NAHID.TRANSACTIONS
ADD CONSTRAINT FK_NAHID_TRANSACTIONS_PRODUCT_ID FOREIGN KEY (ProductID) REFERENCES NAHID.PRODUCTS(ProductID)
ON DELETE SET DEFAULT ;

SELECT * FROM NAHID.PRODUCTS;
SELECT * FROM NAHID.TRANSACTIONS;

-- CASECADE 
BEGIN TRANSACTION


DELETE FROM NAHID.PRODUCTS
WHERE ProductID = 797;

UPDATE NAHID.TRANSACTIONS 
SET ProductID = 111
WHERE ProductID = 797;


ROLLBACK;