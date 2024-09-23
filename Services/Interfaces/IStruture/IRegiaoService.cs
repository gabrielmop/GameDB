using GameDB.Models.Structure;

namespace GameDB.Services.Interfaces.IStruture
{
    public interface IRegiaoService
    {
        public Regioes CadastrarRegiao(Regioes regiao);
        public void ApagarRegiao(Regioes regiao);
        public void EdtiarRegiao(Regioes regiao);
        public Regioes ProcurarRegiao(int id);
        public List<Regioes> ListarRegioes();


    }
}
