<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Stores
orderby x.City, x.Location
select new
{
	City = x.City,
	Location = x.Location,
	sales =	(from y in Orders
		where x.StoreID == y.StoreID &&
		y.OrderDate.Month == 12
		group y by y.OrderDate into z
		orderby z.Key.Date
		select new
		{
			date = z.Key.Date,
			numberoforders = z.Count(),
			productsales = z.Sum(s => s.SubTotal),
			gst = z.Sum(s => s.GST)
		}).Distinct()
}