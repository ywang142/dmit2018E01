using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ChinookSystem.Data.POCOs
{
    public class AlbumsOfArtist
    {
        public string Title { get; set; }
        public string ArtistName { get; set; }
        public int Ryear { get; set; }
        public string RLabel { get; set; }
    }
}
