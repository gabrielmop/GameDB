using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class GeneroRepository : IGeneroRepository
    {

        //Injetção de dependencia
        GameDBContext DBC;

        public GeneroRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public void ApagarGenero(Genero genero)
        {
            DBC.Generos.Remove(genero);
            DBC.SaveChanges();
        }

        public void EditarGenero(Genero Genero)
        {
            DBC.Entry(Genero).State = EntityState.Modified;
            DBC.SaveChanges();
        }


        public List<Genero> ListarGeneros()
        {
            return DBC.Generos.ToList();
        }

        public Genero ProcurarGenero(int id)
        {
            //Expressão lambda:
            // return DBC.Genero.Where(s => s.id == id).FirstOrDefault();
            return DBC.Generos.Find(id);
        }

        public Genero RegistrarGenero(Genero genero)
        {
            DBC.Add(genero);
            DBC.SaveChanges();
            return genero;
        }
    }
}
