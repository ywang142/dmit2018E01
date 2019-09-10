using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion



namespace ChinookSystem.Data.Entities
{
    [Table("Artists")]
    public class Artist
    {
        // compound key [Key, Column(Order = n)] where n equals to the physical order of field in database
        // [Key, DatabaseGenerated(DatabaseGeneratedOption.Computed] database generate a value when a row is inserted or updated
        // [Key, DatabaseGenerated(DatabaseGeneratedOption.None] database does not generate values
        // [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity] database generate a value when a row is inserted
        // [Key] uniquly identities an entity
        [Key]
        public int ArtistID { get; set; }

        // fully implemented property
        private string _Name;
        public string Name
        {
            get
            {
                return _Name;
            }
            set
            {
                if(string.IsNullOrEmpty(value))
                {
                    _Name = null;
                }
                else
                {
                    _Name = value;
                }//eof
            }
        }//eop

        public virtual ICollection<Album> Albums { get; set; }




    } //eoc
} // eon
