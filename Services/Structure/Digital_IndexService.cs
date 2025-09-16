using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;


namespace GameDB.Services.Structure
{
    public class Digital_IndexService : IDigital_IndexService
    {
        private readonly IDigital_IndexRepository Repositorio;

        public Digital_IndexService(IDigital_IndexRepository repo)
        {
            Repositorio = repo;
        }
        public void ApagarDigital_Index(Digital_Index index)
        {
            Repositorio.ApagarDigital_Index(index);
        }

        public void AlterarDigital_Index(Digital_Index index)
        {
            Repositorio.AlterarDigital_Index(index);
        }

        public List<Digital_IndexLista> ListarDigital_Index()
        {
            var resultado = Repositorio.ListarDigital_Index();
            return resultado;
        }

        public Digital_Index BuscarDigital_Index(int id)
        {
            var busca = Repositorio.BuscarDigital_Index(id);
            return busca;
        }

        public Digital_Index CadastrarDigital_Index(Digital_Index index)
        {
            Repositorio.CadastrarDigital_Index(index);
            return index;
        }
        public void AlterarParcialmenteDigital_Index(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            Repositorio.AlterarParcialmenteDigital_Index(Coluna, ValorColuna, Busca, BuscaValor);
        }
    }
}
