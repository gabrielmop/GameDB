using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class Plataforma
    {
        public int PlataformaId { get; set; }
        [Required]
        public string Marca { get; set; }
        [Required]
        public string Console { get; set; }


    }
}
