using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System.Globalization;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneroController : ControllerBase
    {
        private readonly IGeneroRepository Repositorio;

        public GeneroController(IGeneroRepository _repositorio)
        {
            Repositorio = _repositorio;
        }

        [HttpPost("Cadastra-rNovo-Genero")]
        public IActionResult CadastrarGenero([FromForm] Genero genero)
        {
            try
            {
                var result = Repositorio.RegistrarGenero(genero);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Generos")]
        public IActionResult ListarGeneros()
        {
            try
            {
                var result = Repositorio.ListarGeneros();
                return Ok(result);
            }
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Procurar-Genero-Por-Id/{id}")]
        public IActionResult BuscarGeneroPorId(int id)
        {
            try
            {
                var retrono = Repositorio.ProcurarGenero(id);
                if (retrono == null)
                {
                    return NotFound();
                }
                return Ok(retrono);
            }
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Editar-Genero/{id}")]
        public IActionResult AlterarGenero(int id, [FromForm] Genero genero)
        {
            try
            {
                var busca = Repositorio.ProcurarGenero(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                Repositorio.EditarGenero(genero);
                return Ok(genero);
            }
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPatch("Editar-Genero-Parcialmente/{id}")]
        public IActionResult EditarParcialmente(int id, [FromBody]JsonPatchDocument patch)
        {
            if (patch == null)
            {
                return BadRequest();
            }
            var genero = Repositorio.ProcurarGenero(id);
            if (genero == null)
            {
                return NotFound();
            }
            Repositorio.EditarGeneroParcialmente(patch, genero);
            return Ok(genero);
        }

        [HttpDelete("Apagar-Genero/{id}")]
        public IActionResult ApagarGenero(int id)
        {
            try
            {
                var busca = Repositorio.ProcurarGenero(id);
                if (busca == null)
                {
                    return NotFound();
                }

                Repositorio.ApagarGenero(busca);
                return NoContent();

            }
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }


            
        }
    }
}
