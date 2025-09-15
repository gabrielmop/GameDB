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
}
