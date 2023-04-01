using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;

namespace GameDB.Services
{
    public class LogServices : IlogService
    {
        private readonly IlogRepository Repositorio;

        public LogServices(IlogRepository repositorio)
        {
            Repositorio = repositorio;
        }
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception)
        {
            Repositorio.RegistrarLog(DataHora, TipoEvento, Mensagem, Exception);
        }
    }
}
