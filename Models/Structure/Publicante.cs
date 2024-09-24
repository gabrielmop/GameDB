using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Structure
{
    public class Publicante
    {
        [Key]
        public int PubliID { get; set; }
        public string PubliNome { get; set; }        
    }
}
