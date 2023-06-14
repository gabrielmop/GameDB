using GameDB.Models;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class N3DSController : ControllerBase
    {
        private readonly IN3DSService _service;
        private readonly IlogService LogService;

        public N3DSController(IN3DSService service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }


        [HttpPost("Adicionar-Jogo-N3DS")]
        public IActionResult AdicionarJogo([FromForm] N3DS n3ds)
        {
            try
            {
                _service.AdicionarJogo(n3ds);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de 3DS {n3ds.Nome} foi adicionado ao banco, custo de R${n3ds.Preco}", "");
                return Ok(n3ds);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Jogos-N3ds")]
        public IActionResult ListarJogos()
        {
            try
            {
                var resultado = _service.ListarJogo();
                return Ok(resultado);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("Editar-Jogo-N3ds")]
        public IActionResult EditarJogo(int id, [FromForm] N3DS N3ds)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return BadRequest("Jogo não encontrado");
                }
                _service.EditarJogo(N3ds);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de 3DS de id {result.GameId} foi editado no banco para {N3ds.Nome}", "Nenhum erro encontrado");
                return Ok(N3ds);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-N3ds")]
        public IActionResult ApagarJogo(int id)
        {
            try
            {
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return BadRequest("Jogo não encontrado ou já apagado");
                }
                _service.ApagarJogo(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O jogo De 3DS {busca.Nome} de ID {busca.GameId} foi apagado do banco", "Nenhum erro foi encontrado");
                return Ok(busca);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("Editar-Jogo-N3ds-Parcialmente")]
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
                    return BadRequest("Jogo não encontrado");
                }

                /* "operationType": 0,
                 "path": "Insira a Coluna que voce vai alterar",
                 "op": "o tipo de operação, geralmente é 'Replace'",
                 "from": "não precisa se for Replace",
                 "value": "O novo valor que precisa ser"*/
                _service.EditarParcialmente(patch, busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O jogo de 3DS {busca.Nome} foi alterado no banco", "Nenhum erro encontrado");
                return Ok(busca);
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }


    }
}
