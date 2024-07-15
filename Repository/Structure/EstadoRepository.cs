using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class EstadoRepository : IEstadoRepository
    {
        GameDBContext DBC;

        public EstadoRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }


        public void ApagarEstado(Estado estado)
        {
            DBC.Estados.Remove(estado);
            DBC.SaveChanges();
        }

        public void EditarEstado(Estado estado)
        {
            DBC.Entry(estado).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Estado> ListarEstados()
        {
            return DBC.Estados.ToList();
        }

        public Estado ProcurarEstado(int id)
        {
            return DBC.Estados.Find(id);
        }

        public Estado RegistrarEstado(Estado estado)
        {
            DBC.Add(estado);
            DBC.SaveChanges();
            return estado;
        }
    }
}
