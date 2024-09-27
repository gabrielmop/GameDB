using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Consoles
{
    public partial class PS4
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
        public decimal Tamanho { get; set; }
        public DateTime Lancamento { get; set; }
        public decimal? Preco { get; set; }
        public DateTime? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Notas { get; set; }
        public bool? PS4Pro { get; set; }
        public int EstadoID { get; set; }
   
    }
 
  
    public partial class PS4Lista
    {
        [Key]
        public int GameId { get; set; }
        public string? Nome { get; set; }
        public string? Serial { get; set; }
        public string? Regiao { get; set; }
        public string? Desenvolvedora { get; set; }
        public string? Publicante { get; set; }
        public string? Plataforma { get; set; }
        public string? Genero { get; set; }
        public string? Tamanho { get; set; }
        public string? Lancamento { get; set; }
        public string? Preco { get; set; }
        public string? Aquisicao { get; set; }
        public string? LocalAdq { get; set; }
        public string? Notas { get; set; }
        public string? PS4Pro { get; set; }
        public string? EstadoID { get; set; }
    }



}
