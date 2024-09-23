using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IEstadoRepository
    {
        public Estado RegistrarEstado(Estado estado);
        public void EditarEstado(Estado estado);
        public void ApagarEstado(Estado estado);
        public Estado ProcurarEstado(int id);
        public List<Estado> ListarEstados();

    }
}
