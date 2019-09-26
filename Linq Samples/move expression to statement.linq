<Query Kind="Statements">
  <Connection>
    <ID>9453b47a-55fe-4987-9b12-8f50080106d1</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

// when using the Language C# Statement(s)
//your work will need to confirm to C# statement syntax
// ie datatype variable = expression;

// Can navigational properties be used in queries
// Create a list of albums by Deep Purple
// order by release year and title
// show only the title, artist name, release year and release label

// use the navigational properties to obtain the Artist data
// new {...} create a new dataset (class definition)

var results = from x in Albums
			where (x.Artist.Name.Contains ("Deep Purple")) 
			orderby x.ReleaseYear, x.Title
			select new
			{
				Title = x.Title,
				ArtistName = x.Artist.Name,
				RYear = x.ReleaseYear,
				RLabel = x.ReleaseLabel
			};
			
// to display contents of a variable in LinQPad
// using the method .Dump()
// this method is only used in LinQPad, it is NOT a C# method
results.Dump();