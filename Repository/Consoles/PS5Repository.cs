using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Consoles
{
    public class PS5Repository : IPS5Repository
    {
        GameDBContext DBC;

        public PS5Repository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public PS5 AdicionarJogo(PS5 ps5)
        {
            DBC.Add(ps5);
            DBC.SaveChanges();
            return ps5;
        }

        public void ApagarJogo(PS5 ps5)
        {
            DBC.Remove(ps5);
            DBC.SaveChanges();

        }

        public void EditarJogo(PS5 ps5)
        {
            DBC.Entry(ps5).State = EntityState.Modified;
            DBC.SaveChanges();

        }

        public void EditarParcialmente(JsonPatchDocument patch, PS5 ps5)
        {
            patch.ApplyTo(ps5);
            DBC.Entry(ps5).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<PS5Lista> ListarJogo()
        {
            var Lista = DBC.Ps5l.FromSqlRaw("execute dbo.Listar_Jogos_PS5");
            return Lista.ToList();

        }

        public PS5 ProcurarJogo(int id)
        {
            return DBC.Ps5s.Find(id);
        }
    }
}
