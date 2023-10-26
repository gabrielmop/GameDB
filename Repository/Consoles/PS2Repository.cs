using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System;


namespace GameDB.Repository.Consoles
{
    public class Ps2Repository : IPs2Repository
    {
        GameDBContext DBC;

        public Ps2Repository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public Ps2 AdicionarJogo(Ps2 ps2)
        {
            DBC.Add(ps2);
            DBC.SaveChanges();
            return ps2;
        }

        public void ApagarJogo(Ps2 ps2)
        {
            DBC.Remove(ps2);
            DBC.SaveChanges();
        }

        public void EditarJogo(Ps2 ps2)
        {
            DBC.Entry(ps2).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps2 ps2)
        {
            patch.ApplyTo(ps2);
            DBC.Entry(ps2).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Ps2Lista> ListarJogo()
        {
            var Lista = DBC.Ps2l.FromSqlRaw("execute dbo.Listar_Jogos_PS2");
            return Lista.ToList();

        }


        public Ps2 ProcurarJogo(int id)
        {
            return DBC.Ps2.Find(id);

        }
    }
}
