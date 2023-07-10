using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoController : ControllerBase
    {
        private readonly IEstadoServices Service;
        private readonly IlogService LogService;

        public EstadoController(IEstadoServices _service, IlogService _Log)
        {
            Service = _service;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Estado")]
        public IActionResult CadastrarEstado([FromForm] Estado estado)
        {
            try
            {
                var result = Service.RegistrarEstado(estado);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {estado.EstadoNome} Foi registrado no Banco", "Nenhum erro encontrado");
                return Ok(result);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Estados")]
        public IActionResult ListarEstados()
        {
            try
            {
                var result = Service.ListarEstados();
                return Ok(result);
            }
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-estado-por-id/{id}")]
        public IActionResult BuscarPorID(int id)
        {
            try
            {
                var retrono = Service.ProcurarEstado(id);
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

        [HttpPut("Editar-Estado/{id}")]
        public IActionResult EditarEstado(int id, [FromForm] Estado estado)
        {
            try
            {
                var busca = Service.ProcurarEstado(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                Service.EditarEstado(estado);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {estado.EstadoNome} Foi Alterado no Banco", "Nenhum erro encontrado");
                return Ok(estado);
            }
            catch (System.Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpDelete("Apagar-estado/{id}")]
        public IActionResult ApagarGenero(int id)
        {
            try
            {
                var busca = Service.ProcurarEstado(id);
                if (busca == null)
                {
                    return NotFound();
                }

                Service.ApagarEstado(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {busca.EstadoNome} Foi apagado do Banco", "Nenhum erro encontrado");
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
