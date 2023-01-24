using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class Regiao
    {
        public int RegiaoId {  get; set; }
        [Required]
        public string LocalRegiao { get; set; }
    }
}
