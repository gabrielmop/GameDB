using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class Digital_IndexRepository : IDigital_IndexRepository
    {
        GameDBContext DBC;

        public Digital_IndexRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public void ApagarDigital_Index(Digital_Index index)
        {
            DBC.dis.Remove(index);
            DBC.SaveChanges();
        }

        public void AlterarDigital_Index(Digital_Index index)
        {
            var existingEntity = DBC.dis.Local.FirstOrDefault(e => e.InfoID == index.InfoID);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(index).State = EntityState.Modified;
            DBC.SaveChanges();
        }


        public List<Digital_Index> ListarDigital_Index()
        {
            return DBC.dis.ToList();
        }

        public Digital_Index BuscarDigital_Index(int id)
        {
            return DBC.dis.Find(id);
        }

        public Digital_Index CadastrarDigital_Index(Digital_Index index)
        {
            DBC.Add(index);
            DBC.SaveChanges();
            return index;
        }
    }
}
