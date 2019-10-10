<Query Kind="Expression">
  <Connection>
    <ID>9453b47a-55fe-4987-9b12-8f50080106d1</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

// group record collection a single field on the record
// the selected grouping field is referred to as the group key
from x in Tracks
group x by x.GenreId, x.MediaTypeid

// group record collection using multiple fields on the record
// the multiple fields become a group key instance
// referring to a property in the group key instance is by Key.Property
from x in Tracks
group x by new {x.GenreId, x.MediaTypeId}

// report the groups
from x in Tracks
group x by x.GenreId into gGenre
select (gGenre)

//details on each group
from x in Tracks
group x by x.GenreId into gGenre
select new 
{
	groupid = gGenre.Key,
	tracks = gGenre.ToList()

}

// selected fields from each group
from x in Tracks
group x by x.GenreId into gGenre
select new
{
	groupid = gGenre.Key,
	tracks = from x in gGenre
		select new
		{
			trackid = x.TrackId,
			song = x.Name,
			songlength = x.
		
		}

}
// refer to a specific key property
from x in Tracks
group x by new {x.GenreId, x.MediaTypeId} into gTracks
select new
{
	genre = gTracks.Key.GenreId,
	media = gTracks.Key.ModiaTypeId,
	trackcount = gTracks.Count()

}
// you can also group by class
from x in Tracks
group x by Genre into gTracks
select new
{
	name = gTracks.Key.Title,
	artist = gTracks.Key.Artist.Name,
	trackcount = gTracks.Count()

}




