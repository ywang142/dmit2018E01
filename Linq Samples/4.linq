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
	// create a list of all album contain the
	// album title and artist along with all the tracks (song name, genre, length) of that album
	// aggregates are executed against a collection of records
	// .Count(); .Sum(x => x.field); .Min(x => x.field); .Max(x => x.field); .Average(x => x.field)
	
	var results = 	from x in Albums
					where x.Tracks.Count() > 25
					select new AlbumDTO
					{
						AlbumTitle = x.Title,
						AlbumArtist = x.Artist.Name,
						TrackCount = x.Tracks.Count(),
						PlayTime = x.Tracks.Sum(z => z.Milliseconds),
						AlbumsTracks = (from y in x.Tracks
								select new TrackPOCO
								{
									SongName = y.Name,
									SongGenre = y.Genre.Name,
									SongLength = y.Milliseconds
								}).ToList()
					};
	results.Dump();
}

// Define other methods and classes here
public class TrackPOCO
{
	public string SongName {get;set;}
	public string SongGenre {get;set;}
	public int SongLength {get;set;}
}

public class AlbumDTO
{
	public string AlbumTitle {get;set;}
	public string AlbumArtist{get;set;}
	public int TrackCount {get;set;}
	public int PlayTime{get;set;}
	public List<TrackPOCO> AlbumsTracks {get;set;}
}




