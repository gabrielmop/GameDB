using GameDB.DataContext;
using GameDB.Models;
using GameDB.Repository.Interface;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository
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
            DBC.Regioes.Remove(regiao);
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
            return DBC.Regioes.ToList();
        }

        public Regiao ProcurarRegiao(int id)
        {
            return DBC.Regioes.Find(id);
        }

        
    }
}
