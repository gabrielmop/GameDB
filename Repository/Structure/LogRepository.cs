using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;

namespace GameDB.Repository.Structure
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
