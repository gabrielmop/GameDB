using GameDB.Models.Structure;

namespace GameDB.Services.Interfaces.Struture
{
    public interface IlogService
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);
        public List<Logs> ListarLog();
        public List<Logs> ListarUltimosLogs(int quanidade);
    }
}
