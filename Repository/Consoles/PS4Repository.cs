using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace GameDB.Repository.Consoles
{
    public class PS4Repository : IPS4Repository
    {
        GameDBContext DBC;

        public PS4Repository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public Ps4 AdicionarJogo(Ps4 ps4)
        {
            DBC.Add(ps4);
            DBC.SaveChanges();
            return ps4;
        }

        public void ApagarJogo(Ps4 ps4)
        {
            DBC.Remove(ps4);
            DBC.SaveChanges();

        }

        public void EditarJogo(Ps4 ps4)
        {
            DBC.Entry(ps4).State = EntityState.Modified;
            DBC.SaveChanges();

        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps4 ps4)
        {
            patch.ApplyTo(ps4);
            DBC.Entry(ps4).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Ps4Lista> ListarJogo(bool incluiPS5)
        {
            
            if (incluiPS5 == true)
            {
                var Lista = DBC.Ps4l.FromSqlRaw("execute Listar_Jogos_PS4_E_PS5");
                return Lista.ToList();
            }
            else
            {
               var Lista = DBC.Ps4l.FromSqlRaw("execute dbo.Listar_Jogos_PS4");
               return Lista.ToList();
            }           
           

        }

        public Ps4 ProcurarJogo(int id)
        {
            return DBC.Ps4s.Find(id);
        }
    }
}
