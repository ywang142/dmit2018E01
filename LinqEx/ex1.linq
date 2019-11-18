<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Products
orderby x.OrderLists.Count() descending, x.Description
select new
{
	Product = x.Description,
	TimesPurchased = x.OrderLists.Count()
}
