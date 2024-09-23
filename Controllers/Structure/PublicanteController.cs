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
    public class PublicanteController : ControllerBase
    {
        private readonly IPublicanteService service;
        private readonly IlogService LogService;

        public PublicanteController(IPublicanteService _service, IlogService _Log)
        {
            service = _service;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Publicante")]
        public IActionResult CadastrarPublicante([FromForm] Publicante Publicante)
        {
            try
            {
                var result = service.RegistrarPublicante(Publicante);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Publicante {Publicante.Publi} Foi registrado no Banco", "Nenhum erro encontrado");
                return Ok($"O genero {Publicante.Publi} Foi adicionado com sucesso");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Publicantes")]
        public IActionResult ListarPublicante()
        {
            try
            {
                var result = service.ListarPublicante();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Procurar-Publicante-Por-Id/{id}")]
        public IActionResult ProcurarPublicantePorId(int id)
        {
            try
            {
                var retrono = service.ProcurarPublicante(id);
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

        [HttpPut("Editar-Publicante/{id}")]
        public IActionResult AlterarPublicante(int id, [FromForm] Publicante Publicante)
        {
            try
            {
                var busca = service.ProcurarPublicante(id);
                if (busca == null)
                {
                    return NotFound("Genero não encontrado");
                }
                service.EditarPublicante(Publicante);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.Publi} Foi Alterado para {Publicante.Publi} no Banco", "Nenhum erro encontrado");
                return Ok($"O genero {busca.Publi} Foi alterado para {Publicante.Publi} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }


        [HttpDelete("Apagar-Publicante/{id}")]
        public IActionResult ApagarPublicante(int id)
        {
            try
            {
                var busca = service.ProcurarPublicante(id);
                if (busca == null)
                {
                    return NotFound();
                }

                service.ApagarPublicante(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O genero {busca.Publi} Foi apagado do Banco", "Nenhum erro encontrado");
                return Ok($"O genero {busca.Publi} Foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }            
        }
    }
}
