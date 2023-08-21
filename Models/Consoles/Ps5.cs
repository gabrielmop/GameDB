using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public partial class PS5
    {
        [Key]
        public int GameID { get; set; }
        public string Nome { get; set; }
        public string Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroID { get; set; }
        public DateTime Lancamento { get; set; }
        public double Tamanho { get; set; }
        public double Preco { get; set; }
        public DateTime Aquisicao { get; set; }
        public string LocalAdq { get; set; }
        public string Observacoes { get; set; }
        public bool? DualSense { get; set; }
        public int? EstadoID { get; set; }

    }

    public partial class Ps5Lista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public string? Regiao { get; set; }
        public string? Console { get; set; }
        public string? Genero { get; set; }
        public string? Lancamento { get; set; }
        public string? Tamanho { get; set; }
        public string? Preco { get; set; }
        public string? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Observacoes { get; set; }
        public string? Extras { get; set; }
        public string? Estado { get; set; }

    }
}
