using GameDB.Models.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Structure;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
    [ApiController]
    public class DesenvolvedoraController : ControllerBase
    {
        private readonly IDesenvolvedoraService service;
        private readonly IlogService LogService;

        public DesenvolvedoraController(IDesenvolvedoraService _service, IlogService _Log)
        {
            service = _service;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Desenvolvedora")]
        public IActionResult CadastrarDesenvolvedora([FromForm] Desenvolvedora Desenvolvedora)
        {
            try
            {
                var result = service.CadastrarDesenvolvedora(Desenvolvedora);
                LogService.RegistrarLog(DateTime.Now, 2, $"A Desenvolvedora {Desenvolvedora.DevNome} Foi registrado no Banco", "Nenhum erro encontrado");
                return Ok($"A Desenvolvedora {Desenvolvedora.DevNome} Foi adicionado com sucesso");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Desenvolvedoras")]
        public IActionResult ListarDesenvolvedoras()
        {
            try
            {
                var result = service.ListarDesenvolvedoras();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-Desenvolvedora/{id}")]
        public IActionResult BuscarDesenvolvedora(int id)
        {
            try
            {
                var retrono = service.BuscarDesenvolvedora(id);
                if (retrono == null)
                {
                    return NotFound("Desenvolvedora não encontrada");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Desenvolvedora/{id}")]
        public IActionResult AlterarDesenvolvedora(int id, [FromForm] Desenvolvedora Desenvolvedora)
        {
            try
            {
                var busca = service.BuscarDesenvolvedora(id);
                if (busca == null)
                {
                    return NotFound("Desenvolvedora não encontrada");
                }
                service.AlterarDesenvolvedora(Desenvolvedora);
                LogService.RegistrarLog(DateTime.Now, 2, $"A desenvolvedora {busca.DevNome} foi Alterada para {Desenvolvedora.DevNome} no Banco", "Nenhum erro encontrado");
                return Ok($"A desenvolvedora {busca.DevNome} Foi alterado para {Desenvolvedora.DevNome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }


        [HttpDelete("Apagar-Desenvolvedora/{id}")]
        public IActionResult ApagarDesenvolvedora(int id)
        {
            try
            {
                var busca = service.BuscarDesenvolvedora(id);
                if (busca == null)
                {
                    return NotFound("Desenvolvedora não encontrada ou já apagada");
                }

                service.ApagarDesenvolvedora(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"A desenvolvedora {busca.DevNome} Foi apagado do Banco", "Nenhum erro encontrado");
                return Ok($"a desenvolvedora {busca.DevNome} Foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }            
        }
    }
}
