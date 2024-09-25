using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;

namespace GameDB.Services.Structure
{
    public class GeneroService : IGeneroService
    {
        private readonly IGeneroRepository Repositorio;

        public GeneroService(IGeneroRepository repositorio)
        {
            Repositorio = repositorio;
        }
        public void ApagarGenero(Genero genero)
        {
            Repositorio.ApagarGenero(genero);
        }

        public void AlterarGenero(Genero Genero)
        {
            Repositorio.AlterarGenero(Genero);
        }

        public List<Genero> ListarGeneros()
        {
            var resultado = Repositorio.ListarGeneros();
            return resultado;
        }

        public Genero BuscarGenero(int id)
        {
            var busca = Repositorio.BuscarGenero(id);
            return busca;
        }

        public Genero CadastrarGenero(Genero Genero)
        {
            Repositorio.CadastrarGenero(Genero);
            return Genero;
        }
    }
}
