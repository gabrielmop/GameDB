using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class Genero
    {

        public int GeneroId { get; set; }
        [Required]
        public string GeneroNome { get; set; }
    }
}
