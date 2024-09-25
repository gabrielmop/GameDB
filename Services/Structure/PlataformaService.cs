using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;

namespace GameDB.Services.Structure
{
    public class PlataformaService : IPlataformaService
    {
        private readonly IPlataformaRepository repositorio;

        public PlataformaService(IPlataformaRepository _repositorio)
        {
            repositorio = _repositorio;
        }

        public void ApagarPlataforma(Plataforma plataforma)
        {
            repositorio.ApagarPlataforma(plataforma);
        }

        public void AlterarPlataforma(Plataforma plataforma)
        {
            repositorio.AlterarPlataforma(plataforma);
        }

        public List<Plataforma> ListarPlataformas()
        {
            var resultado = repositorio.ListarPlataformas();
            return resultado;
        }

        public Plataforma BuscarPlataforma(int id)
        {
            var busca = repositorio.BuscarPlataforma(id);
            return busca;
        }

        public Plataforma CadastrarPlataforma(Plataforma plataforma)
        {
            repositorio.CadastrarPlataforma(plataforma);
            return plataforma;
        }
    }
}
