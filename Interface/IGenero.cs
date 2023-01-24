using GameDB.Models;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Interface
{
    public interface IGenero
    {
        public IActionResult RegistrarGenero(Genero Genero);
        public IActionResult EditarGenero(int id, Genero Genero);
        public string ApagarGenero(int id);
        public string ProcurarGenero(int id);
        public List<Genero> ListarGeneros();

    }
}
