using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Interfaces.Consoles;

namespace GameDB.Controllers.Consoles
{
    [Route("api/[controller]")]
    [ApiController]
    public class PS2Controller : ControllerBase
    {
        private readonly IPS2Service _service;
        private readonly IlogService LogService;

        public PS2Controller(IPS2Service service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Adicionar-Jogo-PS2")]
        public IActionResult AdicionarJogo([FromForm] Ps2 ps2)
        {
            try
            {
                _service.AdicionarJogo(ps2);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS2 {ps2.Nome} foi adicionado ao banco, custo de R${ps2.Preco}", "Nenhum erro encontrado");
                return Ok($"O Jogo {ps2.Nome} foi adicionado com sucesso!" );
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-jogos-PS2")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpGet("buscar-jogo-por-id-ps2/{id}")]
        public IActionResult BuscarPorID(int id)
        {
            try
            {
                var retrono = _service.ProcurarJogo(id);
                if (retrono == null)
                {
                    return NotFound("");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Editar-Jogo-PS2")]
        public IActionResult EditarJogo(int id, [FromForm] Ps2 ps2)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarJogo(ps2);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS2 de ID {result.GameId} foi editado para {ps2.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps2.Nome} foi alterado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-PS2")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS2 {busca.Nome} foi Removido do banco", "Nenhum erro encontrado");
                return Ok($"O Jogo {busca.Nome} foi apagado do Banco");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("editar-parcialmente-jogo-ps2/{id}")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS2 {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
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
