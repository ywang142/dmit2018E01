<Query Kind="Statements">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

//var results = from x in Products
//orderby x.OrderLists.Count() descending, x.Description
//select new
//{
//	Product = x.Description,
//	TimesPurchased = x.OrderLists.Count()
//};


//var results = from x in Stores
//orderby x.Location
//select new 
//{
//	Location = x.Location,
//	customer = (from y in Orders
//	where x.StoreID == y.StoreID
//	join z in Customers
//	on y.CustomerID equals z.CustomerID
//	orderby x.Location,z.Address
//	select new 
//	{
//		address = z.Address,
//		city = z.City,
//		province = z.Province
//	}).Distinct()
//};
//
//
//var results = from x in Stores
//orderby x.City, x.Location
//select new
//{
//	City = x.City,
//	Location = x.Location,
//	sales =	(from y in Orders
//		where x.StoreID == y.StoreID &&
//		y.OrderDate.Month == 12
//		group y by y.OrderDate into z
//		orderby z.Key.Date
//		select new
//		{
//			date = z.Key.Date,
//			numberoforders = z.Count(),
//			productsales = z.Sum(s => s.SubTotal),
//			gst = z.Sum(s => s.GST)
//		}).Distinct()
//};

//var results = (from x in Categories
//			join y in Products
//			on x.CategoryID equals y.CategoryID
//			join z in OrderLists
//			on y.ProductID equals z.ProductID
//			where z.OrderID == 33
//			select new
//			{
//				Category = x.Description,
//				OrderProducts = from m in OrderLists
//				where m.OrderID == 33
//				select new
//				{
//					Product = y.Description
//				}
//			
//			}).Distinct();
			
var results = from 



results.Dump();





