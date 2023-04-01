using GameDB.DataContext;
using GameDB.Models;
using GameDB.Repository.Interface;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository
{
    public class Ps3Repository : IPs3Repository
    {
        GameDBContext DBC;

        public Ps3Repository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public Ps3 AdicionarJogo(Ps3 ps3)
        {
            DBC.Add(ps3);
            DBC.SaveChanges();
            return ps3;
        }

        public void ApagarJogo(Ps3 ps3)
        {
            DBC.Remove(ps3);
            DBC.SaveChanges();
        }

        public void EditarJogo(Ps3 ps3)
        {
            DBC.Entry(ps3).State = EntityState.Modified;
            DBC.SaveChanges(); 
        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3)
        {
            patch.ApplyTo(ps3);
            DBC.Entry(ps3).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<PS3Lista> ListarJogo()
        {
            {
                
               var Lista = DBC.Ps3l.FromSqlRaw("execute dbo.Listar_Jogos_PS3");
                return Lista.ToList();

            }
        }


            public Ps3 ProcurarJogo(int id)
        {
            return DBC.Ps3s.Find(id);
           
        }
    }
}
