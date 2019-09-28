<Query Kind="Expression" />

// create a list of all album contain the
// album title and artist along with all the tracks (song name, genre, length) of that album

from x in Albums
select new
{
	title = x.Title,
	artist = x.Artist.Name,
	tracks = from y in x.Tracks
			where x.AlbumId == y.AlbumId
			{
				song = y.Name,
				genre = y.Genre.Name,
				length = y.millisenconds
			}
}