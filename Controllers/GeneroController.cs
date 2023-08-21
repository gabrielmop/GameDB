using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
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
        private readonly IGeneroService service;
        private readonly IlogService LogService;

        public GeneroController(IGeneroService _service, IlogService _Log)
        {
            service = _service;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Novo-Genero")]
        public IActionResult CadastrarGenero([FromForm] Genero genero)
        {
            try
            {
                var result = service.RegistrarGenero(genero);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} Foi registrado no Banco", "Nenhum erro encontrado");
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
                var result = service.ListarGeneros();
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
                var retrono = service.ProcurarGenero(id);
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
                var busca = service.ProcurarGenero(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                service.EditarGenero(genero);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} Foi Alterado no Banco", "Nenhum erro encontrado");
                return Ok(genero);
            }
            catch (System.Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }


        [HttpDelete("Apagar-Genero/{id}")]
        public IActionResult ApagarGenero(int id)
        {
            try
            {
                var busca = service.ProcurarGenero(id);
                if (busca == null)
                {
                    return NotFound();
                }

                service.ApagarGenero(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.GeneroNome} Foi apagado do Banco", "Nenhum erro encontrado");
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
