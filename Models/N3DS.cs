﻿using System.ComponentModel.DataAnnotations;

namespace GameDB.Models
{
    public class N3DS
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
        public bool? New3DS { get; set; }
    }
    public class N3DSLista
    {
        [Key]
        public int GameId { get; set; }
        public string Nome { get; set; }
        public string Serial { get; set; }
        public int RegiaoId { get; set; }
        public int PlataformaId { get; set; }
        public int GeneroId { get; set; }
        public string Lancamento { get; set; }
        public string Tamanho { get; set; }
        public string Preco { get; set; }
        public string Aquisicao { get; set; }
        public string LocalAdq { get; set; }
        public string Observacoes { get; set; }
        public bool? New3DS { get; set; }
    }
}