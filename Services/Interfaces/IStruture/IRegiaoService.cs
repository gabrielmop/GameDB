using GameDB.Models.Structure;

namespace GameDB.Services.Interfaces.IStruture
{
    public interface IRegiaoService
    {
        public Regiao CadastrarRegiao(Regiao regiao);
        public void ApagarRegiao(Regiao regiao);
        public void EdtiarRegiao(Regiao regiao);
        public Regiao ProcurarRegiao(int id);
        public List<Regiao> ListarRegioes();


    }
}
