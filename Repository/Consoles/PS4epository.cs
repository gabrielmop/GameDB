using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;


namespace GameDB.Repository.Consoles
{
    public class PS4Repository : IPS4Repository
    {
        GameDBContext DBC;

        public PS4Repository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public PS4 CadastrarJogoPS4(PS4 ps4)
        {
            DBC.Add(ps4);
            DBC.SaveChanges();
            return ps4;
        }

        public void ApagarJogoPS4(PS4 ps4)
        {
            DBC.Remove(ps4);
            DBC.SaveChanges();
        }

        public void AlterarJogoPS4(PS4 ps4)
        {
            var existingEntity = DBC.Ps4s.Local.FirstOrDefault(e => e.GameId == ps4.GameId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Ps4s.Attach(ps4);
            DBC.Entry(ps4).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        

        public void AlterarParcialmenteJogoPS4(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE PS4 SET {Coluna} = @p2 WHERE {Busca} = @p4";
               
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param5 = new SqlParameter("@p4", BuscaValor);
                DBC.Database.ExecuteSqlRaw(sql, param3, param5);
            
            
        }

        public List<PS4Lista> ListarJogosPS4()
        {
            var Lista = DBC.Ps4l.FromSqlRaw("execute dbo.Listar_Jogos_PS4");
            return Lista.ToList();
             
            

        }


        public PS4 BuscarJogoPS4(int id)
        {
           
            return DBC.Ps4s.Find(id);
         

        }
    }
}
