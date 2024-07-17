using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Consoles
{
    public class PS4Repository : IPS4Repository
    {
        GameDBContext DBC;

        public PS4Repository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public Ps4 AdicionarJogo(Ps4 ps4)
        {
            DBC.Add(ps4);
            DBC.SaveChanges();
            return ps4;
        }

        public void ApagarJogo(Ps4 ps4)
        {
            DBC.Remove(ps4);
            DBC.SaveChanges();

        }

        public void EditarJogo(Ps4 ps4)
        {
            var existingEntity = DBC.Ps4s.Local.FirstOrDefault(e => e.GameId == ps4.GameId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(ps4).State = EntityState.Modified;
            DBC.SaveChanges();

        }

        public void EdtiarParcialmente(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE {Tabela} SET {Coluna} = @p2 WHERE {Busca} = @p4";

            var param3 = new SqlParameter("@p2", ValorColuna);
            var param5 = new SqlParameter("@p4", BuscaValor);
            DBC.Database.ExecuteSqlRaw(sql, param3, param5);


        }

        public List<Ps4Lista> ListarJogo()
        {
           
                
               var Lista = DBC.Ps4l.FromSqlRaw("execute dbo.Listar_Jogos_PS4");
               return Lista.ToList();          
           

        }

        public Ps4 ProcurarJogo(int id)
        {
            return DBC.Ps4s.Find(id);
        }
    }
}
