using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;


namespace GameDB.Repository.Consoles
{
    public class JogosDigitaisRepository : IJogosDigitaisRepository
    {
        GameDBContext DBC;

        public JogosDigitaisRepository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public JogosDigitais CadastrarJogoDigital(JogosDigitais jd)
        {
            DBC.Add(jd);
            DBC.SaveChanges();
            return jd;
        }

        public void ApagarJogoDigital(JogosDigitais jd)
        {
            DBC.Remove(jd);
            DBC.SaveChanges();
        }

        public void AlterarJogoDigital(JogosDigitais jd)
        {
            var existingEntity = DBC.Digitals.Local.FirstOrDefault(e => e.GameId == jd.GameId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Digitals.Attach(jd);
            DBC.Entry(jd).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        

        public void AlterarParcialmenteJogoDigital(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE Jogos_Digitais SET {Coluna} = @p2 WHERE {Busca} = @p4";
               
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param5 = new SqlParameter("@p4", BuscaValor);
                DBC.Database.ExecuteSqlRaw(sql, param3, param5);
            
            
        }

        public List<JogosDigitaisLista> ListarJogosDigitais()
        {
            var Lista = DBC.DigitalL.FromSqlRaw("execute dbo.Listar_Jogos_Digitais");
            return Lista.ToList();
             
            

        }


        public JogosDigitais BuscarJogoDigital(int id)
        {
           
            return DBC.Digitals.Find(id);
         

        }
    }
}
