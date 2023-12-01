using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System;


namespace GameDB.Repository.Consoles
{
    public class WiiURepository : IWiiURepository
    {
        GameDBContext DBC;

        public WiiURepository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public WiiU AdicionarJogo(WiiU wu)
        {
            DBC.Add(wu);
            DBC.SaveChanges();
            return wu;
        }

        public void ApagarJogo(WiiU wu)
        {
            DBC.Remove(wu);
            DBC.SaveChanges();
        }

        public void EditarJogo(WiiU wu)
        {
            DBC.Entry(wu).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public void EditarParcialmente(JsonPatchDocument patch, WiiU wu)
        {
            patch.ApplyTo(wu);
            DBC.Entry(wu).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<WiiULista> ListarJogo()
        {
            var Lista = DBC.WiiUl.FromSqlRaw("execute dbo.Listar_Jogos_WiiU");
            return Lista.ToList();

        }


        public WiiU ProcurarJogo(int id)
        {
            return DBC.WiiU.Find(id);

        }
    }
}
