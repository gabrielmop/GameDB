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
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception)
        {
            Repositorio.RegistrarLog(DataHora, TipoEvento, Mensagem, Exception);
        }
    }
}
