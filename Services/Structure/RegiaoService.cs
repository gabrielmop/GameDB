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

        public void ApagarRegiao(Regiao regiao)
        {
            repositorio.ApagarRegiao(regiao);
        }

        public Regiao CadastrarRegiao(Regiao regiao)
        {
            repositorio.CadastrarRegiao(regiao);
            return regiao;
        }

        public void EdtiarRegiao(Regiao regiao)
        {
            repositorio.EdtiarRegiao(regiao);
        }

        public List<Regiao> ListarRegioes()
        {
            var lista = repositorio.ListarRegioes();
            return lista;
        }

        public Regiao ProcurarRegiao(int id)
        {
            var busca = repositorio.ProcurarRegiao(id);
            return busca;
        }
    }
}
