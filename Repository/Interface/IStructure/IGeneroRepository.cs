using GameDB.Models.Structure;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Repository.Interface.Structure
{
    public interface IGeneroRepository
    {
        public Genero RegistrarGenero(Genero Genero);
        public void EditarGenero(Genero Genero);
        public void ApagarGenero(Genero genero);
        public Genero ProcurarGenero(int id);
        public List<Genero> ListarGeneros();

    }
}
