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
    public class PlataformaController : ControllerBase
    {
        private readonly IPlataformaService service;
        private readonly IlogService LogService;

        public PlataformaController(IPlataformaService _service, IlogService _log)
        {
            service = _service;
            LogService = _log;

        }


        [HttpPost("Cadastar-Plataforma")]
        public IActionResult CadastarPlataforma([FromForm] Plataforma plataforma)
        {
            try
            {
                var result = service.CadastrarPlataforma(plataforma);
                LogService.RegistrarLog(DateTime.Now, 2, $"A plataforma {plataforma.Console} da {plataforma.Marca} foi cadastada no Banco", "Nenhum erro encontrado");
                return Ok($"A plataforma {plataforma.Console} da {plataforma.Marca} foi cadastrada com sucesso!");
                
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Plataformas")]
        public IActionResult ListarPlataformas()
        {
            try
            {
                var result = service.ListarPlataformas();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Buscar-Plataforma/{id}")]
        public IActionResult BuscarPlataforma(int id)
        {
            try
            {
                var resultado = service.BuscarPlataforma(id);
                if (resultado == null)
                {
                    return NotFound("Plataforma não encontrada");
                }
                return Ok(resultado);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("Alterar-Plataforma/{id}")]
        public IActionResult AlterarPlataforma(int id,[FromForm]Plataforma plataforma)
        {
            try
            {
                var busca = service.BuscarPlataforma(id);
                if (busca == null)
                {
                    return NotFound("Plataforma não encontrada");
                }
                service.AlterarPlataforma(plataforma);
                LogService.RegistrarLog(DateTime.Now, 2, $"A plataforma {busca.Console} foi alterada para {plataforma.Console} no Banco", "Nenhum erro encontrado");
                return Ok($"A plataforma {busca.Console} foi alterada para {plataforma.Console} com sucesso!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Plataforma/{id}")]
        public IActionResult ApagarPlataforma(int id)
        {
            var resultado = service.BuscarPlataforma(id);
            if (resultado == null)
            {
                return NotFound("Plataforma não encontrada ou já apagada");
            }
            service.ApagarPlataforma(resultado);
            LogService.RegistrarLog(DateTime.Now, 2, $"A plataforma {resultado.Console} foi apagada do Banco", "Nenhum erro encontrado");
            return Ok($"A plataforma {resultado.Console} foi apagada com sucesso!");
        }
    }

    }

