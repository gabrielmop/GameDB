using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Interfaces.Consoles;

namespace GameDB.Controllers.Consoles
{
    [Route("api/[controller]")]
    [ApiController]
    public class WiiUController : ControllerBase
    {
        private readonly IWiiUService _service;
        private readonly IlogService LogService;

        public WiiUController(IWiiUService service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Adicionar-Jogo-WiiU")]
        public IActionResult AdicionarJogo([FromForm] WiiU wu)
        {
            try
            {
                _service.AdicionarJogo(wu);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de WiiU {wu.Nome} foi adicionado ao banco, custo de R${wu.Preco}", "Nenhum erro encontrado");
                return Ok($"O Jogo {wu.Nome} foi adicionado com sucesso!" );
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-WiiU")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpGet("buscar-jogo-por-id-WiiU/{id}")]
        public IActionResult BuscarPorID(int id)
        {
            try
            {
                var retrono = _service.ProcurarJogo(id);
                if (retrono == null)
                {
                    return NotFound("Jogo não encontrado no Banco de dados");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Editar-Jogo-WiiU/{id}")]
        public IActionResult EditarJogo(int id, [FromForm] WiiU wu)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarJogo(wu);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS2 de ID {result.GameId} foi editado para {wu.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {wu.Nome} foi alterado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-WiiU/{id}")]
        public IActionResult ApagarJogo(int id)
        {
            try
            {
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.ApagarJogo(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de WiiU {busca.Nome} foi Removido do banco", "Nenhum erro encontrado");
                return Ok($"O Jogo {busca.Nome} foi apagado do Banco");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("editar-parcialmente-jogo-WiiU/{id}")]
        public IActionResult EditarParcialmente(int id, [FromBody] JsonPatchDocument patch)
        {
            try
            {
                if (patch == null)
                {
                    return BadRequest("Nenhuma edição encontrada");
                }
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                /* "operationType": 0,
                 "path": "Insira a Coluna que voce vai alterar",
                 "op": "o tipo de operação, geralmente é 'Replace'",
                 "from": "não precisa se for Replace",
                 "value": "O novo valor que precisa ser"*/
                _service.EditarParcialmente(patch, busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de WiiU {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
                return Ok($"O Jogo {busca.Nome} Foi alterado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }




        }

    }
}
