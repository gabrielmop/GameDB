using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class Ps3
    {
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; } = 1;
        public int GeneroId { get; set; }
        public DateTime Lancamento { get; set; }
        public double? Preco { get; set; } 
        public DateTime? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Observacoes { get; set; }
        public bool? Instalacao { get; set; }
    }
    public partial class PS3Lista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroId { get; set; }
        public string Lancamento { get; set; }
        public string? Preco { get; set; }
        public string? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string Observacoes { get; set; }
        public bool? Instalacao { get; set; }
    }


}
