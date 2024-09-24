using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Structure
{
    public class Desenvolvedora
    {
        [Key]
        public int DevID{ get; set; }
        public string DevNome { get; set; }        
    }
}
