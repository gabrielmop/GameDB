using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Repository
{
    public class GeneroRepository : IGenero
    {
        readonly string connectionString = "data source=MOOP_PC;Integrated Security =true;Initial Catalog=GameDB";

        public string ApagarGenero(int id)
        {
            throw new NotImplementedException();
        }

        public IActionResult EditarGenero(int id, Genero Genero)
        {
            throw new NotImplementedException();
        }

        public List<Genero> ListarGeneros()
        {
            throw new NotImplementedException();
        }

        public string ProcurarGenero(int id)
        {
            throw new NotImplementedException();
        }

        public IActionResult RegistrarGenero(Genero Genero)
        {
            throw new NotImplementedException();
        }
    }
}
