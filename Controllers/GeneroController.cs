using GameDB.Models;
using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System.Data.SqlTypes;
using System.Globalization;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneroController : ControllerBase
    {
        private readonly IGeneroRepository Repositorio;
        private readonly IlogService LogService;

        public GeneroController(IGeneroRepository _repositorio, IlogService _Log)
        {
            Repositorio = _repositorio;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Novo-Genero")]
        public IActionResult CadastrarGenero([FromForm] Genero genero)
        {
            try
            {
                var result = Repositorio.RegistrarGenero(genero);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} Foi registrado no Banco", "");
                return Ok(result);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} Foi Alterado no Banco", "");
                return Ok(genero);
            }
            catch (System.Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPatch("Editar-Genero-Parcialmente/{id}")]
        public IActionResult EditarParcialmente(int id, [FromBody]JsonPatchDocument patch)
        {
            try
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} Foi Alerado no Banco", "");
                return Ok(genero);
            }
            catch (System.Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest("Um erro foi encontrado");
            }
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.GeneroNome} Foi apagado do Banco", "");
                return NoContent();

            }
            catch (System.Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }


            
        }
    }
}
