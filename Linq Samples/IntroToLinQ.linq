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

// create a list of albums release between 2007 and 2008
// order by release year then by title

from x in Albums
where (x.ReleaseYear >= 2007 ) && (x.ReleaseYear <= 2008)
orderby x.ReleaseYear descending, x.Title 
select x 

//note the differece in method names using the method syntax
// a decending orderby is .OrderByDescending
// secondary and beyond ordering is .ThenBy
Albums
   .Where (x => ((x.ReleaseYear >= 2007) && (x.ReleaseYear <= 2008)))
   .OrderByDescending (x => x.ReleaseYear)
   .ThenBy (x => x.Title)

// Can navigational properties be used in queries
// Create a list of albums by Deep Purple
// order by release year and title
// show only the title, artist name, release year and release label

// use the navigational properties to obtain the Artist data
// new {...} create a new dataset (class definition)
from x in Albums
where (x.Artist.Name.Contains ("Deep Purple")) 
orderby x.ReleaseYear, x.Title
select new
{
	Title = x.Title,
	ArtistName = x.Artist.Name,
	RYear = x.ReleaseYear,
	RLabel = x.ReleaseLabel
}