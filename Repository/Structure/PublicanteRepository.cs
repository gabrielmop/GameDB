using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class PublicanteRepository : IPublicanteRepository
    {

        //Injetção de dependencia
        GameDBContext DBC;

        public PublicanteRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public void ApagarPublicante(Publicante Publicante)
        {
            DBC.Publis.Remove(Publicante);
            DBC.SaveChanges();
        }

        public void EditarPublicante(Publicante Publicante)
        {
            var existingEntity = DBC.Publis.Local.FirstOrDefault(e => e.PubliID == Publicante.PubliID);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(Publicante).State = EntityState.Modified;
            DBC.SaveChanges();
        }


        public List<Publicante> ListarPublicante()
        {
            return DBC.Publis.ToList();
        }

        public Publicante ProcurarPublicante(int id)
        {
            //Expressão lambda:
            // return DBC.Genero.Where(s => s.id == id).FirstOrDefault();
            return DBC.Publis.Find(id);
        }

        public Publicante RegistrarPublicante(Publicante Publicante)
        {
            DBC.Add(Publicante);
            DBC.SaveChanges();
            return Publicante;
        }
    }
}
