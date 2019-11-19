<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Categories
orderby x.Description
select new 
{
	Category = x.Description,
	OrderProducts = (
	from y in OrderLists
	where x.CategoryID == y.Product.CategoryID && y.OrderID == 33
	group y by y.Product into z
	from q in z
	select new
	{
		Product = z.Key.Description,
		Price = z.Key.Price,
		Discount = z.Key.Discount,
		Subtotal = (decimal)q.QtyPicked * z.Key.Price * (1- z.Key.Discount),
		GST = Subtot
		
	}
	)	
}

// subtotal, tax, total