use AdventureWorks2014;
------------------------------------------------------------------------------------

--Stored procedure

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
EXEC dbo.uspGetAddress
------------------------------------------------------------------------------------

--Creating a schema

CREATE SCHEMA [ACADEMY_HR] AUTHORIZATION [dbo]

------------------------------------------------------------------------------------

-- Try/catch blocked

BEGIN TRY
SELECT 1000/0 AS Result;
END TRY

BEGIN CATCH
SELECT
	ERROR_NUMBER() AS [error_code],
	ERROR_PROCEDURE() AS [Invalid-Proc],
	ERROR_MESSAGE() AS [ERROR_DETAILS];
END CATCH

------------------------------------------------------------------------------------

--STORED PROCUDURE ASSIGNMENT 2

CREATE PROCEDURE dbo.uspGetAddress2 @City nvarchar(30)
As

SELECT * FROM Person.Address
WHERE City LIKE @City + '%'
GO

EXEC	dbo.uspGetAddress2 @City ='New'

------------------------------------------------------------------------------------

--passing parametre assignment

create proc dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10)
AS
select * from Person.Address
where City like @City + '%' AND PostalCode like @PostalCode
Go
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = '[98]%'


create proc dbo.uspGetAddress4 @CityName nvarchar(30) output
AS
select City from Person.Address
where AddressID=38 AND postalcode = 48226
Go
Declare @CityName nvarchar(30)
EXEC dbo.uspGetAddress4 @Cityname = @CityName OUTPUT
Print @CityName

------------------------------------------------------------------------------------

--SELECT DISTINCT STATEMENT CHALLENGE

SELECT * FROM PERSON.Address;

SELECT DISTINCT AddressLine1, AddressLine2
from Person.Address;

------------------------------------------------------------------------------------
	
--SELECT TOP CHALLENGE

SELECT TOP 3 * FROM Person.Address;

------------------------------------------------------------------------------------
-- MIN() AND MAX() function assignment

SELECT * FROM Sales.Store;

--MIN()

SELECT MIN(SalesPersonID) As MinSale
from Sales.Store;

--MAX()

SELECT MAX(BusinessEntityID) As LargestBusiness
from Sales.Store;

------------------------------------------------------------------------------------

--LIKE CHALLENGE
SELECT *
from Person.Address
where AddressLine1 like 'p%';

------------------------------------------------------------------------------------
--wildcard charcter
select * from Person.Address
where City like '_ondon';
------------------------------------------------------------------------------------

--Sql between challenge

select * from Sales.SalesOrderDetail;

select * from Sales.SalesOrderDetail
where SalesOrderDetailID Between 20 and 28
ORDER BY SalesOrderDetailID;

------------------------------------------------------------------------------------


