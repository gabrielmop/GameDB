using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IlogRepository
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);
        public List<Logs> ListarLog();
        public List<Logs> ListarUltimosLogs(int quanidade);

    }
}
