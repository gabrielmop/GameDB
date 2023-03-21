using GameDB.DataContext;
using GameDB.Interface;
using GameDB.Models;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository
{
    public class PlataformaRepository : IPlataformaRepository
    {
        GameDBContext DBC;

        public PlataformaRepository(GameDBContext _DBC)
        {
            DBC= _DBC;
        }



        public void ApagarPlataforma(Plataforma plataforma)
        {
            DBC.Remove(plataforma);
            DBC.SaveChanges();
        }

        public void EditarPlataforma(Plataforma plataforma)
        {
           DBC.Entry(plataforma).State = EntityState.Modified;
           DBC.SaveChanges();
        }

        public List<Plataforma> ListarPlataforma()
        {
           return DBC.Plataformas.ToList();
        }

        public Plataforma ProcurarPlataforma(int id)
        {
            return DBC.Plataformas.Find(id);
        }

        public Plataforma RegistrarPlataforma(Plataforma plataforma)
        {
            DBC.Add(plataforma);
            DBC.SaveChanges();
            return plataforma;
        }

     
    }
}
