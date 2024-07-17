using GameDB.Models.Structure;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace GameDB.Models.Consoles
{
    public partial class Ps4
    {
        [Key]
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
        public int? EstadoId { get; set; }


    }

    public partial class Ps4Lista
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
        public string? Ps4Pro {  get; set; }
        public string? Estado { get; set; }

    }
}
