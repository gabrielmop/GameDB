using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;


namespace GameDB.Repository.Consoles
{
    public class PS3Repository : IPS3Repository
    {
        GameDBContext DBC;

        public PS3Repository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public PS3 CadastrarJogoPS3(PS3 ps3)
        {
            DBC.Add(ps3);
            DBC.SaveChanges();
            return ps3;
        }

        public void ApagarJogoPS3(PS3 ps3)
        {
            DBC.Remove(ps3);
            DBC.SaveChanges();
        }

        public void AlterarJogoPS3(PS3 ps3)
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

        

        public void AlterarParcialmenteJogoPS3(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE PS3 SET {Coluna} = @p2 WHERE {Busca} = @p4";
               
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param5 = new SqlParameter("@p4", BuscaValor);
                DBC.Database.ExecuteSqlRaw(sql, param3, param5);
            
            
        }

        public List<PS3Lista> ListarJogosPS3()
        {
            var Lista = DBC.Ps3l.FromSqlRaw("execute dbo.Listar_Jogos_PS3");
            return Lista.ToList();
             
            

        }


        public PS3 BuscarJogoPS3(int id)
        {
           
            return DBC.Ps3s.Find(id);
         

        }
    }
}
