<Query Kind="Expression">
  <Connection>
    <ID>9453b47a-55fe-4987-9b12-8f50080106d1</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

// sample of query syntax to dump the Artist data
from x in Artists
select x


// sample of method syntax to dump the Artist data
Artists
	.Select (x => x)
	
// sort datainfo.Sort((x,y) => x.AttributeName.CompareTo(y.AttributeName))

// find ary artist whose name contains the string 'son'
from x in Artists
where x.Name.Contains("son")
select x

Artists
	.Where(x => x.Name.Contains("son"))
	.Select(x => x)
	
// create a list of albums released in 1970
Albums
	.Where(x => x.ReleaseYear.Equals(1970))
	.OrderBy(x => x.Title)
	.Select(x=> x)
	
Albums
	.Where(x => x.ReleaseYear ==1970 )
	.Select(x=> x)
	
from x in Albums
where x.ReleaseYear == 1970
orderby x.Title 
select x