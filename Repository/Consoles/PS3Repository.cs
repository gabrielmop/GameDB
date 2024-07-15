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
            DBC.Entry(ps3).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public void EditarParcialmente(JsonPatchDocument<Ps3> patch, Ps3 ps3)
        {
          
            patch.ApplyTo(ps3);
            DBC.Entry(ps3).State = EntityState.Modified;
            DBC.SaveChanges();
            
        }

        public void EdtiarParcialmenteTeste(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            using (var context = new GameDBContext())
            {
                var param1 = new SqlParameter("@p0", Tabela);
                var param2 = new SqlParameter("@p1", Coluna);
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param4 = new SqlParameter("@p3", Busca);
                var param5 = new SqlParameter("@p4", BuscaValor);
                context.Database.ExecuteSqlRaw($"UPDATE PS3 SET @p1 = @p2 WHERE GameId = @p4", param1, param2, param3, param4, param5);
            }
            
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
