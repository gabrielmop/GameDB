using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IDigital_IndexService
    {
        public Digital_Index CadastrarDigital_Index(Digital_Index Desenvolvedora);
        public void AlterarDigital_Index(Digital_Index Desenvolvedora);
        public void ApagarDigital_Index(Digital_Index Desenvolvedora);
        public Digital_Index BuscarDigital_Index(int id);
        public List<Digital_IndexLista> ListarDigital_Index();
        public void AlterarParcialmenteDigital_Index(string Coluna, string ValorColuna, string Busca, string BuscaValor);

    }
}
