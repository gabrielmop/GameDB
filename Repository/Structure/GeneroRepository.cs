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

        public void AlterarGenero(Genero Genero)
        {
            var existingEntity = DBC.Generos.Local.FirstOrDefault(e => e.GeneroID == Genero.GeneroID);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(Genero).State = EntityState.Modified;
            DBC.SaveChanges();
        }


        public List<Genero> ListarGeneros()
        {
            return DBC.Generos.ToList();
        }

        public Genero BuscarGenero(int id)
        {
            //Expressão lambda:
            // return DBC.Genero.Where(s => s.id == id).FirstOrDefault();
            return DBC.Generos.Find(id);
        }

        public Genero CadastrarGenero(Genero genero)
        {
            DBC.Add(genero);
            DBC.SaveChanges();
            return genero;
        }
    }
}
