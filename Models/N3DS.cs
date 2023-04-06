namespace GameDB.Models
{
    public class N3DS
    {
        public partial class N3ds
        {
            public int GameId { get; set; }
            public string Nome { get; set; }
            public string Serial { get; set; }
            public int RegiaoId { get; set; }
            public int PlataformaId { get; set; }
            public int GeneroId { get; set; }
            public DateOnly Lancamento { get; set; }
            public double Tamanho { get; set; }
            public double Preco { get; set; }
            public DateOnly Aquisicao { get; set; }
            public string LocalAdq { get; set; }
            public string Observacoes { get; set; }
            public bool? New3DS { get; set; }
        }

        public partial class N3dsLista
        {
            public int GameId { get; set; }
            public string Nome { get; set; }
            public string Serial { get; set; }
            public int RegiaoId { get; set; }
            public int PlataformaId { get; set; }
            public int GeneroId { get; set; }
            public DateOnly Lancamento { get; set; }
            public string Tamanho { get; set; }
            public string Preco { get; set; }
            public DateOnly Aquisicao { get; set; }
            public string LocalAdq { get; set; }
            public string Observacoes { get; set; }
            public bool? New3DS { get; set; }
        }
    }
}
