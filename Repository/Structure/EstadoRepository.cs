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

        public void AlterarEstado(Estado estado)
        {
            var existingEntity = DBC.Estados.Local.FirstOrDefault(e => e.EstadoID == estado.EstadoID);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(estado).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Estado> ListarEstados()
        {
            return DBC.Estados.ToList();
        }

        public Estado BuscarEstado(int id)
        {
            return DBC.Estados.Find(id);
        }

        public Estado CadastrarEstado(Estado estado)
        {
            DBC.Add(estado);
            DBC.SaveChanges();
            return estado;
        }
    }
}
