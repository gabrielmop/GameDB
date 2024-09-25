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

        public void AlterarEstado(Estado estado)
        {
            Repositorio.AlterarEstado(estado);
        }

        public List<Estado> ListarEstados()
        {
          var resultado =  Repositorio.ListarEstados();
            return resultado;
        }

        public Estado BuscarEstado(int id)
        {
           var busca = Repositorio.BuscarEstado(id);
            return busca;
        }

        public Estado CadastrarEstado(Estado estado)
        {
            Repositorio.CadastrarEstado(estado);
            return estado;
        }
    }
}
