Use AdventureWorks2014

-- ----------------Składnia SQL – SELECT, ALIASY, SORT
-- 1. Wyświetl wszystkie kolumny z tabeli Produktów [Production.Product]
SELECT * FROM Production.Product

-- 2. Wyświetl kolumny ProductID, Name i ListPrice dla wszystkich produktów [Production.Product]
SELECT ProductID, Name, ListPrice FROM Production.Product

-- 3. Wyświetl kolumny ProductID, Name i ListPrice dla wszystkich produktów w porządku
-- malejącym według ListPrice [Production.Product]
SELECT ProductID, Name, ListPrice FROM Production.Product
ORDER BY ListPrice DESC

-- 4. Wyświetl kolumny Name, StandardCost i ListPrice dla wszystkich produktów,
-- których ListPrice jest większa lub równa 500 [Production.Product]
SELECT Name, StandardCost, ListPrice FROM Production.Product
WHERE ListPrice >= 500

-- 5. Wyświetl kolumny Name i Color dla wszystkich produktów, które mają kolor „Red”, porządkowane według nazwy [Production.Product] ????
SELECT Name, Color FROM Production.Product
Where Color = 'Red'
ORDER BY Name

-- 6. Wyświetl kolumny FirstName, LastName i MiddleName dla wszystkich osób,
-- uporządkowane według LastName, a następnie FirstName [Person.Person]
SELECT FirstName, LastName, MiddleName FROM Person.Person
ORDER BY LastName, FirstName


-- 7. Wyświetl kolumny BusinessEntityID, HireDate i JobTitle dla wszystkich pracowników
-- posiadających JobTitle „Sales Representative”, uporządkowany według BusinessEntityID, a
-- następnie HireDate [HumanResources.Employee]
SELECT BusinessEntityID, HireDate, JobTitle from HumanResources.Employee
where JobTitle Like '%Sales Representative%'
order by  BusinessEntityID, HireDate


-- 8. Wyświetl kolumny Name i ListPrice dla wszystkich produktów,
-- które mają ListPrice między
-- 500 a 1000, uporządkowane według ListPrice [Production.Product]
SELECT Name, ListPrice from production.Product
where ListPrice between 500 and 1000


-- 9. Wyświetl kolumny Name, Color i Size, dla wszystkich produktów które mają kolor „Black” i
-- rozmiar „M”, uporządkowane według Name [Production.Product]
Select Name, Color, Size from Production.Product
WHERE Color = 'Black' and Size = 'M' order by Name


-- 10. Wyświetl kolumny BusinessEntityID i HireDate dla wszystkich pracowników zatrudnionych w
-- 2010 r., uporządkowane według HireDate [HumanResources.Employee]
-- USE AdventureWorks2014
SELECT  BusinessEntityID, HireDate FROM HumanResources.Employee
where HireDate > '2010' order by HireDate



-- 11. Wybierz wszystkich klientów z Niemiec i posortuj ich według PersonID. (2 zapytania)
-- [Sales.Customer]

SELECT name, TerritoryID from Sales.SalesTerritory
WHERE Name = 'Germany'

SELECT * from Sales.Customer
where TerritoryID = 8 order by PersonID



-- 12. Wybierz produkty z kategorii "Components" i posortuj je według nazwy. (3 zapytania)
-- [Production.Product]

SELECT  p.Name as NameOfProduct,
        bom.ComponentID as IDofComponent

from production.BillOfMaterials as bom

    left join Production.Product as p ON bom.ComponentID = p.ProductID

ORDER BY p.Name


SELECT *
from production.Product

SELECT *
from Production.BillOfMaterials



-- 13. Wybierz pracowników zatrudnionych w okresie od 1 stycznia 2005 do 31 grudnia 2006 i
-- posortuj ich według daty zatrudnienia. [HumanResources.Employee]

SELECT * from HumanResources.Employee
WHERE HireDate between '2005-01-01' and '2006-12-31' order by HireDate


-- 14. Wybierz zamówienia od klienta o identyfikatorze 29485 i posortuj je według daty zamówienia
-- malejąco. [Sales.SalesOrderHeader]

SELECT * from Sales.SalesOrderHeader
where CustomerID='29485' order by OrderDate desc



-- 15. Wybierz wszystkie zamówienia, które mają metodę dostawy "OVERSEAS - DELUXE" lub
-- "CARGO TRANSPORT 5" i posortuj je według daty wysyłki. (2 zapytania)
-- [Sales.SalesOrderHeader]

SELECT  sm.Name as MethodOfShipment,
        soh.ShipDate as DateOfShipment
from Purchasing.ShipMethod as sm

LEFT JOIN Sales.SalesOrderHeader as soh ON sm.ShipMethodID = soh.ShipMethodID

where sm.Name = 'OVERSEAS - DELUXE' or Name = 'CARGO TRANSPORT 5'
order by soh.ShipDate

SELECT *
from Sales.SalesOrderHeader

SELECT *
from Purchasing.ShipMethod


-- 16. Wybierz wszystkie produkty o nazwie zawierającej słowo "bike" i posortuj je według nazwy w
-- porządku rosnącym.[Production.Product] --
select * from Production.Product
where Name LIKE '%bike%' order by Name



