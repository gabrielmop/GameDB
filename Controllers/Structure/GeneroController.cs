using GameDB.Models.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
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

        [HttpPost("Cadastrar-Genero")]
        public IActionResult CadastrarGenero([FromForm] Genero genero)
        {
            try
            {
                var result = service.CadastrarGenero(genero);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {genero.GeneroNome} foi cadastrado no Banco", "Nenhum erro encontrado");
                return Ok($"O genero {genero.GeneroNome} foi cadastrado com sucesso");
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
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-Genero/{id}")]
        public IActionResult BuscarGenero(int id)
        {
            try
            {
                var retrono = service.BuscarGenero(id);
                if (retrono == null)
                {
                    return NotFound("Genero não encontrado");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Genero/{id}")]
        public IActionResult AlterarGenero(int id, [FromForm] Genero genero)
        {
            try
            {
                var busca = service.BuscarGenero(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                service.AlterarGenero(genero);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.GeneroNome} foi alterado para {genero.GeneroNome} no Banco", "Nenhum erro encontrado");
                return Ok($"O genero {busca.GeneroNome} foi alterado para {genero.GeneroNome} com sucesso!");
            }
            catch (Exception ex)
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
                var busca = service.BuscarGenero(id);
                if (busca == null)
                {
                    return NotFound();
                }

                service.ApagarGenero(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.GeneroNome} Foi apagado do Banco", "Nenhum erro encontrado");
                return Ok($"O genero {busca.GeneroNome} Foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }            
        }
    }
}
