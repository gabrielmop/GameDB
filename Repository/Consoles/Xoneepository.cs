using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Security.Policy;


namespace GameDB.Repository.Consoles
{
    public class XoneRepository : IXoneRepository
    {
        GameDBContext DBC;

        public XoneRepository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public Xone CadastrarJogoXboxOne(Xone xone)
        {
            DBC.Add(xone);
            DBC.SaveChanges();
            return xone;
        }

        public void ApagarJogoXboxOne(Xone xone)
        {
            DBC.Remove(xone);
            DBC.SaveChanges();
        }

        public void AlterarJogoXboxOne(Xone xone)
        {
            var existingEntity = DBC.xones.Local.FirstOrDefault(e => e.GameId == xone.GameId);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.xones.Attach(xone);
            DBC.Entry(xone).State = EntityState.Modified;
            DBC.SaveChanges();
        }        

        public void AlterarParcialmenteJogoXboxOne(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {

            var sql = $"UPDATE PS4 SET {Coluna} = @p2 WHERE {Busca} = @p4";
               
                var param3 = new SqlParameter("@p2", ValorColuna);
                var param5 = new SqlParameter("@p4", BuscaValor);
                DBC.Database.ExecuteSqlRaw(sql, param3, param5);
        }

        public List<XoneLista> ListarJogosXboxOne()
        {
            var Lista = DBC.xonel.FromSqlRaw("execute dbo.Listar_Jogos_Xbox_One");
            Lista.AsEnumerable();
            return Lista.ToList(); 
        }

        public Xone BuscarJogoXboxOne(int id)
        {
           
            return DBC.xones.Find(id);
        }
    }
}
