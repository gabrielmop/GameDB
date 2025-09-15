using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public partial class Xone
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public int RegiaoID { get; set; }
        public int DevID { get; set; }
        public int PubliID { get; set; }
        public int PlataformaID { get; set; }
        public int GeneroID { get; set; }
        public decimal Tamanho { get; set; }
        public DateTime Lancamento { get; set; }
        public decimal? Preco { get; set; }
        public DateTime? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Notas { get; set; }
        public bool? OneX { get; set; }
        public int EstadoID { get; set; }
   
    }
 
  
    public partial class XoneLista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Regiao { get; set; }
        public string? Desenvolvedora { get; set; }
        public string? Publicante { get; set; }
        public string? Genero { get; set; }
        public string? Tamanho { get; set; }
        public string? Lancamento { get; set; }
        public string? Preco { get; set; }
        public string? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Notas { get; set; }
        public string? OneX { get; set; }
        public string? Estado { get; set; }
    }



}
