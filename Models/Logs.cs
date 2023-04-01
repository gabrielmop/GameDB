using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class Logs
    {
        [Key]
        public int? Id { get; set; }
        public DateTime DataHora { get; set; }
        public int TipoEvento { get; set; }
        public string Mensagem { get; set; }
        public string? Exception { get; set; }
    }
}
