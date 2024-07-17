using GameDB.Models.Structure;
using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public class Ps3
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroId { get; set; }
        public DateTime Lancamento { get; set; }
        public decimal? Preco { get; set; }
        public DateTime? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Observacoes { get; set; }
        public bool? Instalacao { get; set; }
        public int EstadoID { get; set; }
   
    }

    public class Ps3Lista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public string? Regiao { get; set; }
        public string? Console { get; set; }
        public string? Genero { get; set; }
        public string? Lancamento { get; set; }
        public string? Preco { get; set; }
        public string? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Observacoes { get; set; }
        public string? Instalacao { get; set; }
        public string? Estado { get; set; }
    }



}
