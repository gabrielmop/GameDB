using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Interfaces.Consoles;

namespace GameDB.Controllers.Consoles
{
    [Route("api/[controller]")]
    [ApiController]
    public class Xbox360Controller : ControllerBase
    {
        private readonly IXbox360Service _service;
        private readonly IlogService LogService;

        public Xbox360Controller(IXbox360Service service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Adicionar-Jogo-Xbox360")]
        public IActionResult AdicionarJogo([FromForm] Xbox360 x360)
        {
            try
            {
                _service.AdicionarJogo(x360);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de Xbox 360 {x360.Nome} foi adicionado ao banco, custo de R${x360.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {x360.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-Xbox360")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpPut("Editar-Jogo-Xbox360")]
        public IActionResult EditarJogo(int id, [FromForm] Xbox360 x360)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarJogo(x360);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de Xbox 360 de ID {result.GameId} foi editado para {x360.Nome}", "Nenhum erro encontrado");
                return Ok($"O Jogo {result.Nome} foi editado para {x360.Nome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-Xbox360")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de Xbox 360 {busca.Nome} foi Removido do banco", "Nenhum erro encontrado");
                return Ok($"O Jogo {busca.Nome} foi apagado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("Editar-Jogo-Parcialmente/{id}")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de Xbox 360 {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
                return Ok($"O Jogo {busca.Nome} foi editado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }




        }

    }
}
