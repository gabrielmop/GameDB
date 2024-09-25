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
            DBC.Regioes.Remove(regiao);
            DBC.SaveChanges();
        }

        public Regiao CadastrarRegiao(Regiao regiao)
        {
            DBC.Add(regiao);
            DBC.SaveChanges();
            return regiao;
        }

        public void AlterarRegiao(Regiao regiao)
        {
            var existingEntity = DBC.Regioes.Local.FirstOrDefault(e => e.RegiaoId == regiao.RegiaoId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(regiao).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Regiao> ListarRegioes()
        {
            return DBC.Regioes.ToList();
        }

        public Regiao BuscarRegiao(int id)
        {
            return DBC.Regioes.Find(id);
        }


    }
}
