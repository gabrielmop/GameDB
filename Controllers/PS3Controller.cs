using GameDB.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System.Globalization;
using GameDB.Services;
using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PS3Controller : ControllerBase
    {
       private readonly IPS3Service _service;
        private readonly IlogService LogService;
      
        public PS3Controller(IPS3Service service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Adicionar-Jogo-PS3")]
        public IActionResult AdicionarJogo([FromForm] Ps3 ps3)
        {
            try
            {
                _service.AdicionarJogo(ps3);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de Ps3 {ps3.Nome} foi adicionado ao banco, custo de R${ps3.Preco}", "");
                return Ok(ps3);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-PS3")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpPut("Editar-Jogo")]
        public IActionResult EditarJogo(int id, [FromForm] Ps3 ps3)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarJogo(result);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de ID {result.GameId} foi editado para {result.Nome}", "");
                return Ok(result);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo/{id}")]
        public IActionResult ApagarJogo(int id)
        {
            try
            {
                var busca =
               _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.ApagarJogo(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo {busca.Nome} foi Removido do banco", "");
                return Ok(busca);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch(("Editar-Jogo-Parcialmente/{id}"))]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo {busca.Nome} foi editado no banco", "");
                return Ok(busca);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }




        }

    }
}
