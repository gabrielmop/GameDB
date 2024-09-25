using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
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
                var result = Service.CadastrarEstado(estado);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {estado.EstadoNome} foi cadastrado no Banco", "Nenhum erro encontrado");
                return Ok($"O Estado {estado.EstadoNome} foi cadastrado com sucesso!");
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
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-Estado/{id}")]
        public IActionResult BuscarEstado(int id)
        {
            try
            {
                var retrono = Service.BuscarEstado(id);
                if (retrono == null)
                {
                    return NotFound();
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Estado/{id}")]
        public IActionResult AlterarEstado(int id, [FromForm] Estado estado)
        {
            try
            {
                var busca = Service.BuscarEstado(id);
                if (busca == null)
                {
                    return NotFound("Estado não encontrado");
                }
                Service.AlterarEstado(estado);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {busca.EstadoNome} foi alterado para {estado.EstadoNome}", "Nenhum erro encontrado");
                return Ok($"O Estado {busca.EstadoNome} foi alterado para {estado.EstadoNome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpDelete("Apagar-estado/{id}")]
        public IActionResult ApagarEstado(int id)
        {
            try
            {
                var busca = Service.BuscarEstado(id);
                if (busca == null)
                {
                    return NotFound("Estado não encontrado ou já apagado");
                }

                Service.ApagarEstado(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Estado {busca.EstadoNome} foi apagado do Banco", "Nenhum erro encontrado");
                return Ok($"O Estado {busca.EstadoNome} foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }
    }
}
