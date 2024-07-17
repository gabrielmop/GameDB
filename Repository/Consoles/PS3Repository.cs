using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;


namespace GameDB.Repository.Consoles
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
            var existingEntity = DBC.Ps3s.Local.FirstOrDefault(e => e.GameId == ps3.GameId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Ps3s.Attach(ps3);
            DBC.Entry(ps3).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        

        public void EdtiarParcialmente(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE {Tabela} SET {Coluna} = @p2 WHERE {Busca} = @p4";
               
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param5 = new SqlParameter("@p4", BuscaValor);
                DBC.Database.ExecuteSqlRaw(sql, param3, param5);
            
            
        }

        public List<Ps3Lista> ListarJogo()
        {
            var Lista = DBC.Ps3l.FromSqlRaw("execute dbo.Listar_Jogos_PS3");
            return Lista.ToList();

        }


        public Ps3 ProcurarJogo(int id)
        {
           
            return DBC.Ps3s.Find(id);
         

        }
    }
}
