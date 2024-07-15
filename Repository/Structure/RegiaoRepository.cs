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

        public void ApagarRegiao(Regiao regiao)
        {
            DBC.Regiaos.Remove(regiao);
            DBC.SaveChanges();
        }

        public Regiao CadastrarRegiao(Regiao regiao)
        {
            DBC.Add(regiao);
            DBC.SaveChanges();
            return regiao;
        }

        public void EdtiarRegiao(Regiao regiao)
        {
            DBC.Entry(regiao).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Regiao> ListarRegioes()
        {
            return DBC.Regiaos.ToList();
        }

        public Regiao ProcurarRegiao(int id)
        {
            return DBC.Regiaos.Find(id);
        }


    }
}
