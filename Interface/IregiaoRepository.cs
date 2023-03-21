using GameDB.Models;

namespace GameDB.Interface
{
    public interface IregiaoRepository
    {
        public Regiao CadastrarRegiao(Regiao regiao);
        public void ApagarRegiao(Regiao regiao);
        public void EdtiarRegiao(Regiao regiao);
        public Regiao ProcurarRegiao(int id);
        public List<Regiao> ListarRegioes();


    }
}
