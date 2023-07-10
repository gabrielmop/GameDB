using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;

namespace GameDB.Services.Structure
{
  
    public class EstadoService : IEstadoServices
    {
        private readonly IEstadoRepository Repositorio;

        public EstadoService(IEstadoRepository repositorio)
        {
            Repositorio = repositorio;
        }

        public void ApagarEstado(Estado estado)
        {
            Repositorio.ApagarEstado(estado);
        }

        public void EditarEstado(Estado estado)
        {
            Repositorio.EditarEstado(estado);
        }

        public List<Estado> ListarEstados()
        {
          var resultado =  Repositorio.ListarEstados();
            return resultado;
        }

        public Estado ProcurarEstado(int id)
        {
           var busca = Repositorio.ProcurarEstado(id);
            return busca;
        }

        public Estado RegistrarEstado(Estado estado)
        {
            Repositorio.RegistrarEstado(estado);
            return estado;
        }
    }
}
