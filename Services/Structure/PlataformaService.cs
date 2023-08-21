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

        public void EditarPlataforma(Plataforma plataforma)
        {
            repositorio.EditarPlataforma(plataforma);
        }

        public List<Plataforma> ListarPlataforma()
        {
            var resultado = repositorio.ListarPlataforma();
            return resultado;
        }

        public Plataforma ProcurarPlataforma(int id)
        {
            var busca = repositorio.ProcurarPlataforma(id);
            return busca;
        }

        public Plataforma RegistrarPlataforma(Plataforma plataforma)
        {
            repositorio.RegistrarPlataforma(plataforma);
            return plataforma;
        }
    }
}
