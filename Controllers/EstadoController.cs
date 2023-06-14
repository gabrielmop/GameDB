using GameDB.Models;
using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoController : ControllerBase
    {
        private readonly IEstadoRepository Repositorio;
        private readonly IlogService LogService;

        public EstadoController(IEstadoRepository _repositorio, IlogService _Log)
        {
            Repositorio = _repositorio;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Estado")]
        public IActionResult CadastrarEstado([FromForm] Estado estado)
        {
            try
            {
                var result = Repositorio.RegistrarEstado(estado);
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
                var result = Repositorio.ListarEstados();
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
                var retrono = Repositorio.ProcurarEstado(id);
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
                var busca = Repositorio.ProcurarEstado(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                Repositorio.EditarEstado(estado);
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
                var busca = Repositorio.ProcurarEstado(id);
                if (busca == null)
                {
                    return NotFound();
                }

                Repositorio.ApagarEstado(busca);
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
