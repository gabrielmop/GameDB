using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
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


        [HttpPost("Registrar-Nova-Plataforma")]
        public IActionResult RegistrarPlataforma([FromForm] Plataforma plataforma)
        {
            try
            {
                var result = service.RegistrarPlataforma(plataforma);
                LogService.RegistrarLog(DateTime.Now, 2, $"a Plataforma {plataforma.Console} da {plataforma.Marca}  Foi registrado no Banco", "Nenhum erro encontrado");
                return Ok(result);
                
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Plataforma")]
        public IActionResult ListarPlataforma()
        {
            try
            {
                var result = service.ListarPlataforma();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Buscar-Plataforma-Por-Id/{id}")]
        public IActionResult BuscarPorId(int id)
        {
            try
            {
                var resultado = service.ProcurarPlataforma(id);
                if (resultado == null)
                {
                    return NotFound();
                }
                return Ok(resultado);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("Editar-Plataforma/{id}")]
        public IActionResult EditarPlataforma(int id,[FromForm]Plataforma plataforma)
        {
            try
            {
                var busca = service.ProcurarPlataforma(id);
                if (busca == null)
                {
                    return NotFound();
                }
                service.EditarPlataforma(plataforma);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Console {plataforma.Console} Foi alterado no Banco", "Nenhum erro encontrado");
                return Ok(plataforma);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Plataforma/{id}")]
        public IActionResult ApagarPlataforma(int id)
        {
            var resultado = service.ProcurarPlataforma(id);
            if (resultado == null)
            {
                return NotFound();
            }
            service.ApagarPlataforma(resultado);
            LogService.RegistrarLog(DateTime.Now, 2, $"O Console {resultado.Console} Foi apagado do Banco", "Nenhum erro encontrado");
            return Ok(resultado);
        }
    }

    }

