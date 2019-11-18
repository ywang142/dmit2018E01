<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Pickers
select new
{
	picker = x.LastName + ',' + x.FirstName, 
	pickdates = (
	from y in Orders
	where y.Store.StoreID == x.StoreID && y.PickedDate != null
	select new
	{
		ID = y.OrderID,	
		Date = y.PickedDate
	
	})
}