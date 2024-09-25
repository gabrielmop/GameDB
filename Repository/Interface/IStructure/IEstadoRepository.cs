using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IEstadoRepository
    {
        public Estado CadastrarEstado(Estado estado);
        public void AlterarEstado(Estado estado);
        public void ApagarEstado(Estado estado);
        public Estado BuscarEstado(int id);
        public List<Estado> ListarEstados();

    }
}
