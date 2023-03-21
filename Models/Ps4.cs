using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public partial class Ps4
    {
        public int GameId { get; set; }
        public string Nome { get; set; }
        public string Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroId { get; set; }
        public DateTime Lancamento { get; set; }
        public double Tamanho { get; set; }
        public double Preco { get; set; }
        public DateTime Aquisicao { get; set; }
        public string LocalAdq { get; set; }
        public string Observacoes { get; set; }
        public bool? Ps4pro { get; set; }

    }

    public partial class Ps4Lista
    {
        [Key]
        public int GameId { get; set; }
        public string Nome { get; set; }
        public string Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroId { get; set; }
        public DateTime Lancamento { get; set; }
        public string Tamanho { get; set; }
        public string Preco { get; set; }
        public DateTime Aquisicao { get; set; }
        public string LocalAdq { get; set; }
        public string Observacoes { get; set; }
        public bool? Ps4pro { get; set; }

    }
}
