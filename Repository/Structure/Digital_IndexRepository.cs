using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.Data.SqlClient;
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


        public List<Digital_IndexLista> ListarDigital_Index()
        {
            var Lista = DBC.dil.FromSqlRaw("execute dbo.Listar_Digital_Info");
            return Lista.ToList();
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

        public void AlterarParcialmenteDigital_Index(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE Digital_Info SET {Coluna} = @p2 WHERE {Busca} = @p4";

            var param3 = new SqlParameter("@p2", ValorColuna);
            var param5 = new SqlParameter("@p4", BuscaValor);
            DBC.Database.ExecuteSqlRaw(sql, param3, param5);


        }
    }
}
