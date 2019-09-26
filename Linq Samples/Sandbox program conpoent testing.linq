<Query Kind="Program">
  <Connection>
    <ID>9453b47a-55fe-4987-9b12-8f50080106d1</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

void Main()
{
string artistname = "Deep Purple";
	var results = from x in Albums
			where (x.Artist.Name.Contains (artistname)) 
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
}

// Define other methods and classes here
public class AlbumsOfArtist
{
	public string Title{get;set;}
	public string ArtistName{get;set;}
	public int Ryear {get;set;}
	public string RLabel {get;set;}

}