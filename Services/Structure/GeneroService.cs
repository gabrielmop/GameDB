using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Repository.Structure;
using GameDB.Services.Interface.Structure;
using Microsoft.AspNetCore.JsonPatch;

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

        public void EditarGenero(Genero Genero)
        {
            Repositorio.EditarGenero(Genero);
        }

        public List<Genero> ListarGeneros()
        {
            var resultado = Repositorio.ListarGeneros();
            return resultado;
        }

        public Genero ProcurarGenero(int id)
        {
            var busca = Repositorio.ProcurarGenero(id);
            return busca;
        }

        public Genero RegistrarGenero(Genero Genero)
        {
            Repositorio.RegistrarGenero(Genero);
            return Genero;
        }
    }
}
