use AdventureWorks2012;

/*Find out all the customers from Sales.Customer table.*/

select * from Sales.Customer;

/*Find out all the sales orders from Sales.SalesOrderHeader table.*/

select * from Sales.SalesOrderHeader;

/*Find out sales details about productID 843*/

Select * 
From Sales.SalesOrderDetail
Where ProductID in (843,844,845);

/*Sales info of all the products of which unit price is between 100 and 200*/

Select * 
From Sales.SalesOrderDetail
Where UnitPrice <=200 or UnitPrice >=100;

/*All the store names*/

Select Name
from Sales.Store;

/*Find out store names that contain "Bike" */

Select Name
from Sales.Store
Where Name Like '%Bike%';

/*info of all the credit cards*/

Select CardNumber
from Sales.CreditCard;

/* A list of credit card types*/

Select count (*) CardType, CardType
From sales.CreditCard
Group by CardType;
