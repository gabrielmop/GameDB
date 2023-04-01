using GameDB.DataContext;
using GameDB.Models;
using GameDB.Repository.Interface;

namespace GameDB.Repository
{
    public class LogRepository : IlogRepository
    {
        GameDBContext DBC;

        public LogRepository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception)
        {
            Logs log = new Logs();
            log.DataHora = DataHora;
            log.TipoEvento = TipoEvento;
            log.Mensagem = Mensagem;
            log.Exception = Exception;

            DBC.Add(log);
            DBC.SaveChanges();
        }
    }
}
