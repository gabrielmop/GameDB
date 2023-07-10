using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Consoles
{
    public class N3DSRepository : IN3DSRepository
    {
        GameDBContext DBC;

        public N3DSRepository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public N3DS AdicionarJogo(N3DS N3DS)
        {
            DBC.Add(N3DS);
            DBC.SaveChanges();
            return N3DS;
        }

        public void ApagarJogo(N3DS N3DS)
        {
            DBC.Remove(N3DS);
            DBC.SaveChanges();
        }

        public void EditarJogo(N3DS N3DS)
        {
            DBC.Entry(N3DS).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public void EditarParcialmente(JsonPatchDocument patch, N3DS N3DS)
        {
            patch.ApplyTo(N3DS);
            DBC.Entry(N3DS).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<N3DSLista> ListarJogo()
        {
            var Lista = DBC.N3DSl.FromSqlRaw("execute dbo.Listar_Jogos_N3DS");
            return Lista.ToList();
        }

        public N3DS ProcurarJogo(int id)
        {
            return DBC.N3Ds.Find(id);
        }
    }
}
