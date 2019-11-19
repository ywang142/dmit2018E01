<Query Kind="Expression">
  <Connection>
    <ID>e76737d7-43e4-4285-b08c-d27e747cd839</ID>
    <Server>.</Server>
    <Database>GroceryList</Database>
  </Connection>
</Query>

from x in Pickers
orderby x.LastName + ',' + x.FirstName
select new
{
	picker = x.LastName + ',' + x.FirstName, 
	pickdates = (
	from y in x.Store.Orders
	group y by y.OrderID into z
	from q in z
	where q.PickerID == x.PickerID && q.PickedDate != null &&
	q.PickedDate.Value.Year == 2017 && q.PickedDate.Value.Month == 12 && q.PickedDate.Value.Day >= 18
	select new
	{
		ID = z.Key,
		Date = q.PickedDate
	})
}

// where clause