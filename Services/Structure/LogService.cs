using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interfaces.Struture;

namespace GameDB.Services.Structure
{
    public class LogService : IlogService
    {
        private readonly IlogRepository Repositorio;

        public LogService(IlogRepository repositorio)
        {
            Repositorio = repositorio;
        }

        public List<Logs> ListarLog()
        {
           return Repositorio.ListarLog();
        }

        public List<Logs> ListarUltimosLogs(int quanidade)
        {
            return Repositorio.ListarUltimosLogs(quanidade);
        }

        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception)
        {
            Repositorio.RegistrarLog(DataHora, TipoEvento, Mensagem, Exception);
        }
    }
}
