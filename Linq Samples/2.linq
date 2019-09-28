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
	// create a list of all customers in alphabetic order by lastname, firstname
	// who live in the us wih an yahoo email. list full name (last, first), city
	// state and email only. create the calss definition of this list.
	var customerlist =	from x in Customers
						where x.Country.Equals("USA") && x.Email.Contains("yahoo")
						orderby x.LastName, x.FirstName
						select new YahooCustomers
						{
							Name = x.LastName + "," + x.FirstName,
							City = x.City,
							State = x.State,
							Email = x.Email
						};
						
	customerlist.Dump();
	
	// who is the artist who sang Rag Doll (track). List the Artist Name,
	// the Album title, release year and label, along with he song (track) composer 
	var whosang =	from x in Tracks
					where x.Name.Equals("Rag Doll")
					select new
					{
						ArtistName = x.Album.Artist.Name,
						AlbumTitle = x.Album.Title,
						AlbumYear = x.Album.ReleaseYear,
						AlbumLabel = x.Album.ReleaseLabel,
						Composer = x.Composer
					};
	whosang.Dump();
	
}

// Define other methods and classes here
public class YahooCustomers
{
public string Name {get;set;}
public string City {get;set;}
public string State {get;set;}
public string Email {get;set;}
};
