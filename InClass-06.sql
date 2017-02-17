use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */

select JobTitle, 
count(BusinessEntityID)as 'Number of Employees'
from HumanResources.Employee
where CurrentFlag=1
Group by JobTitle
Order by count(BusinessEntityID)DESC;



/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */

select JobTitle, 
count(BusinessEntityID)as 'Number of Employees'
from HumanResources.Employee
where CurrentFlag=1
group by JobTitle
having count(BusinessEntityID) >1
Order by count(BusinessEntityID)DESC;



/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/

Select p.ProductID,
p.Name as 'Prdocut name',
l.Name as 'location of inventory',
pl.Quantity
From Production.Product as p 
left join Production.ProductInventory as pl 
on p.ProductID = pl.ProductID 
inner join Production.Location as l 
on l.LocationID=pl.LocationID;




/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/

Select pm.ProductModelID,
p.ProductID
from Production.ProductModel as pm 
left join Production.Product as p 
on pm.ProductModelID=p.ProductModelID
Where p.ProductID IS NULL;