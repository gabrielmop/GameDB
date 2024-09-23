using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IregiaoRepository
    {
        public Regioes CadastrarRegiao(Regioes regiao);
        public void ApagarRegiao(Regioes regiao);
        public void EdtiarRegiao(Regioes regiao);
        public Regioes ProcurarRegiao(int id);
        public List<Regioes> ListarRegioes();


    }
}
