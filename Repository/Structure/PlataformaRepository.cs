using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class PlataformaRepository : IPlataformaRepository
    {
        GameDBContext DBC;

        public PlataformaRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }



        public void ApagarPlataforma(Plataforma plataforma)
        {
            DBC.Remove(plataforma);
            DBC.SaveChanges();
        }

        public void AlterarPlataforma(Plataforma plataforma)
        {
            var existingEntity = DBC.Plataformas.Local.FirstOrDefault(e => e.PlataformaId == plataforma.PlataformaId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(plataforma).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Plataforma> ListarPlataformas()
        {
            return DBC.Plataformas.ToList();
        }

        public Plataforma BuscarPlataforma(int id)
        {
            return DBC.Plataformas.Find(id);
        }

        public Plataforma CadastrarPlataforma(Plataforma plataforma)
        {
            DBC.Add(plataforma);
            DBC.SaveChanges();
            return plataforma;
        }


    }
}
