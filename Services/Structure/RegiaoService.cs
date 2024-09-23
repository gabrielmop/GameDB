using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interfaces.IStruture;

namespace GameDB.Services.Structure
{
    public class RegiaoService : IRegiaoService
    {
        private readonly IregiaoRepository repositorio;

        public RegiaoService(IregiaoRepository _repositorio)
        {
            repositorio = _repositorio;
        }

        public void ApagarRegiao(Regioes regiao)
        {
            repositorio.ApagarRegiao(regiao);
        }

        public Regioes CadastrarRegiao(Regioes regiao)
        {
            repositorio.CadastrarRegiao(regiao);
            return regiao;
        }

        public void EdtiarRegiao(Regioes regiao)
        {
            repositorio.EdtiarRegiao(regiao);
        }

        public List<Regioes> ListarRegioes()
        {
            var lista = repositorio.ListarRegioes();
            return lista;
        }

        public Regioes ProcurarRegiao(int id)
        {
            var busca = repositorio.ProcurarRegiao(id);
            return busca;
        }
    }
}
