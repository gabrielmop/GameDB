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
                var result = service.CadastrarPublicante(Publicante);
                LogService.RegistrarLog(DateTime.Now, 2, $"A publicante {Publicante.PubliNome} foi registrada no Banco", "Nenhum erro encontrado");
                return Ok($"A publicante {Publicante.PubliNome} foi adicionada com sucesso");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Publicantes")]
        public IActionResult ListarPublicantes()
        {
            try
            {
                var result = service.ListarPublicantes();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-Publicante/{id}")]
        public IActionResult BuscarPublicantePorId(int id)
        {
            try
            {
                var retrono = service.BuscarPublicante(id);
                if (retrono == null)
                {
                    return NotFound("Publicante não encontrada");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Publicante/{id}")]
        public IActionResult AlterarPublicante(int id, [FromForm] Publicante Publicante)
        {
            try
            {
                var busca = service.BuscarPublicante(id);
                if (busca == null)
                {
                    return NotFound("Publicante não encontrada");
                }
                service.AlterarPublicante(Publicante);
                LogService.RegistrarLog(DateTime.Now, 2, $"A publicante {busca.PubliNome} foi alterada para {Publicante.PubliNome}", "Nenhum erro encontrado");
                return Ok($"A publicante {busca.PubliNome} foi alterada para {Publicante.PubliNome} com sucesso!");
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
                var busca = service.BuscarPublicante(id);
                if (busca == null)
                {
                    return NotFound("Publicante não encontrada ou já apagada");
                }

                service.ApagarPublicante(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"A publicante {busca.PubliNome} foi apagada do Banco", "Nenhum erro encontrado");
                return Ok($"A publicante {busca.PubliNome} Foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }            
        }
    }
}
