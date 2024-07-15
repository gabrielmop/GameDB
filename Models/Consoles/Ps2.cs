using GameDB.Models.Structure;
using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public class Ps2
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; } 
        public int GeneroId { get; set; }
        public DateTime Lancamento { get; set; }
        public double? Preco { get; set; }
        public DateTime? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Observacoes { get; set; }
        public bool? Widescreen { get; set; }
        public int EstadoID { get; set; }


        public virtual Estado Estado { get; set; }
        public virtual Genero Genero { get; set; }
        public virtual Plataforma Plataforma { get; set; }
        public virtual Regiao Regiao { get; set; }
    }

    public class Ps2Lista
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
        public string? Widescreen { get; set; }
        public string? Estado { get; set; }
    }



}
