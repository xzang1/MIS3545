use AdventureWorksDW2012;

/*Employees whose birthday is in Feburary*/
use AdventureWorksDW2012;
Select *
From dbo.DimEmployee
Where Month(birthdate)=2;

/*who are the Sales Representatives whose birthday is in Feburary?*/
use AdventureWorksDW2012;
Select *
From Dimemployee 
Where Month (birthdate) = 2
And title = 'sales representative';

/*List all the sales processed by these Sales Representatives */

use AdventureWorksDW2012
Select e.lastname, 
e.firstname,
fs.*
From dbo.FactResellerSales as fs join Dimemployee as e on fs.employeeKey = e.employeeKey
Where month (birthdate) = 2 AND e.title = 'sales representative';

/*who is a better sales representative that was born in Feburary?*/
use AdventureWorksDW2012
Select e.lastname, 
e.firstname,
count(fs.salesordernumber) as 'number of sales',
sum(fs.salesamount) as 'Total sales amount'
From dbo.FactResellerSales as fs join Dimemployee as e on fs.employeeKey = e.employeeKey
Where month (birthdate) = 2 AND e.title = 'sales representative'
Group by e.lastname, e.firstname;


/*total Amount of off-line sales in Massachusetts*/

select sum(s.SalesAmount) - (select sum(salesamount) from dbo.FactInternetSales) as 'Total off-line sales in Mass',
t.StateProvinceCode
from dbo.FactResellerSales as s join dbo.DimGeography as t 
on s.SalesTerritoryKey=t.SalesTerritoryKey
Where t.StateProvinceCode = 'MA'
group by t.StateProvinceCode;


/*Total Amount of Internet Sales in 1st quarter each year in each country*/

select sum(s.SalesAmount)  as 'Total on-line sales in each country',
t.CountryRegionCode
from dbo.FactInternetSales as s join dbo.DimGeography as t 
on s.SalesTerritoryKey=t.SalesTerritoryKey
join dbo.DimDate as d on s.OrderDateKey = d.DateKey
Where calendarquarter = '1'
group by t.CountryRegionCode;

