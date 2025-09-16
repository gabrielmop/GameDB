using System.ComponentModel.DataAnnotations;

namespace GameDB.Models.Structure
{
    public partial class Digital_Index
    {
        [Key]
        public int InfoID { get; set; }
        public string? Nome { get; set; }
        public int? GameID { get; set; }
        public int? PlataformaID { get; set; }
        public decimal? Preco { get; set; }
        public Boolean?booleanos { get; set; }
        public int? EstadoID { get; set; }

    }

    public partial class Digital_IndexLista
    {
        [Key]
        public int InfoID { get; set; }
        public string? Nome { get; set; }
        public int? GameID { get; set; }
        public string? Plataforma { get; set; }
        public string? Preco { get; set; }
        public string? Booleanos { get; set; }
        public string? Estado { get; set; }

    }
}
