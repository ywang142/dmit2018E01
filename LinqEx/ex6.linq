<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Customers
where x.CustomerID ==1
select new
{
	Customer = x.LastName + ',' + x.FirstName,
	OrdersCount = x.Orders.Count(),
	Items = (from y in x.Orders
	join z in OrderLists
	on y.OrderID equals z.OrderID
	group z by z.Product into q
	orderby q.Count(), q.Key.Description
	select new
	{
		description = q.Key.Description,
		timesbought = q.Count()
	}).Distinct()
}