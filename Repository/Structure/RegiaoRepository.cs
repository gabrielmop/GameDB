using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class RegiaoRepository : IregiaoRepository
    {
        GameDBContext DBC;

        public RegiaoRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public void ApagarRegiao(Regioes regiao)
        {
            DBC.Regiaos.Remove(regiao);
            DBC.SaveChanges();
        }

        public Regioes CadastrarRegiao(Regioes regiao)
        {
            DBC.Add(regiao);
            DBC.SaveChanges();
            return regiao;
        }

        public void EdtiarRegiao(Regioes regiao)
        {
            DBC.Entry(regiao).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Regioes> ListarRegioes()
        {
            return DBC.Regiaos.ToList();
        }

        public Regioes ProcurarRegiao(int id)
        {
            return DBC.Regiaos.Find(id);
        }


    }
}
