use AdventureWorksDW2012;


/*1, Display number of orders and total sales amount(sum of SalesAmount) of Internet Sales
 in 1st quarter each year in each country. Note: your result set should produce a total of
  18 rows. */
  use AdventureWorksDW2012
  Select count(i.ProductKey) as'number of orders',
  sum(i.SalesAmount) as 'total sales amount'
  from dbo.FactInternetSales as i join dbo.DimSalesTerritory as t on i.SalesTerritoryKey = t.SalesTerritoryKey
  join dbo.DimDate as d on i.OrderDateKey = d.DateKey
  Where CalendarQuarter = '1'
  group by t.SalesTerritoryCountry;

/*2, Show total reseller sales amount (sum of SalesAmount), calendar quarter of order date
, product category name and reseller’s business type by quarter by category and by 
business type in 2006. Note: your result set should produce a total of 44 rows. */
  use AdventureWorksDW2012
select sum( s.salesamount) as 'total reseller sales amount',
d.CalendarQuarter,
r.BusinessType,
p.ProductSubcategoryKey
from dbo.FactResellerSales as s join dbo.DimDate as d on s.OrderDateKey = d.DateKey
join dbo.DimProduct as p on s.ProductKey=p.ProductKey
join dbo.DimReseller as r on s.ResellerKey = r.ResellerKey
Where d.CalendarYear = '2006'
group by d.CalendarQuarter, p.ProductSubcategoryKey, r.businesstype;

/*3, Based on 2, perform an OLAP operation: slice. In the comment block, describe how you
 perform the slicing. */


    /*I would select only quarter 1 to perform slicing and leave everything else shown 
    (not use where clause on 2006)*/
  use AdventureWorksDW2012
 select sum( s.salesamount)as 'total reseller sales amount',
d.CalendarQuarter,
r.BusinessType,
p.ProductSubcategoryKey
from dbo.FactResellerSales as s join dbo.DimDate as d on s.OrderDateKey = d.DateKey
join dbo.DimProduct as p on s.ProductKey=p.ProductKey
join dbo.DimReseller as r on s.ResellerKey = r.ResellerKey
Where d.CalendarQuarter = '1'
group by d.CalendarQuarter, p.ProductSubcategoryKey, r.businesstype;


/*4, Based on 2, perform an OLAP operation: drill-down. In the comment block, describe 
how you perform the drill-down. */


/*I would add pull out business type from the dim.reseller table to create a new one 
since it would be a 1 to many relationship and further expand the hierarchical component 
of this dimension.*/