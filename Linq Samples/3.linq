<Query Kind="Expression">
  <Connection>
    <ID>9453b47a-55fe-4987-9b12-8f50080106d1</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

// create a list of albums realeased in 2001,
// list the album title, artist name, and label
// if the release label is null, use the string Unknown

from x in Albums
where x.ReleaseYear == 2001
select new
{
	Albumtitle  = x.Title,
	ArtistName = x.Artist.Name,
	Label = x.ReleaseLabel == null ? "Unknown" : x.ReleaseLabel
}

// list of all albums specifying if they were release in the 70's, 80's, 90's or modern.
// list the title and decade
from x in Albums
where x.ReleaseYear >= 1970
select new
{
	Title = x.Title,
	decade = x.ReleaseYear > 1969 & x.ReleaseYear < 1980 ? "70s" :
			x.ReleaseYear > 1979 & x.ReleaseYear < 1990 ? "80s" :
			x.ReleaseYear > 1989 & x.ReleaseYear < 2000 ? "90s" : "modern"
}
