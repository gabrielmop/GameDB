﻿using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public partial class JogosDigitais
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public int RegiaoID { get; set; }
        public int DevID { get; set; }
        public int PubliID { get; set; }
        public int PlataformaID { get; set; }
        public int GeneroID { get; set; }
        public DateTime Lancamento { get; set; }
        public string? Tamanho { get; set; }
        public DateTime? DataBackup { get; set; }
        public string? LocalBackup { get; set; }
        public string? Notas { get; set; }
   
    }
 
  
    public partial class JogosDigitaisLista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public string Regiao { get; set; }
        public string Desenvolvedora { get; set; }
        public string Publicante { get; set; }
        public string Plataforma { get; set; }
        public string Genero { get; set; }
        public string Lancamento { get; set; }
        public string? Tamanho { get; set; }
        public string? DataBackup { get; set; }
        public string? LocalBackup { get; set; }
        public string? Notas { get; set; }
    }



}
