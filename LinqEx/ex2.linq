<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Stores
orderby x.Location
select new 
{
	Location = x.Location,
	customer = (from y in Orders
	where x.StoreID == y.StoreID
	join z in Customers
	on y.CustomerID equals z.CustomerID
	orderby x.Location,z.Address
	select new 
	{
		address = z.Address,
		city = z.City,
		province = z.Province
	}).Distinct()
}