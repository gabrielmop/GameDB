using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Interfaces.Consoles;
using Azure.Core.Serialization;
using Newtonsoft.Json;
using System.Data.Entity.Core.Common.CommandTrees;
using Microsoft.AspNetCore.Http;

namespace GameDB.Controllers.Consoles
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 {ps3.Nome} foi adicionado ao banco, custo de R${ps3.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps3.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("Editar-Jogo-PS3-Teste")]
        public IActionResult EditarJogo(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                _service.EdtiarParcialmenteTeste(Tabela, Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"Um Jogo foi editado parcialmente no banco", "Nenhum erro encontrado");
                return Ok($"Dados alterados com Sucesso!");
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

        [HttpGet("buscar-jogo-por-id-ps3/{id}")]
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

        [HttpPut("Editar-Jogo-PS3/{id}")]
        public IActionResult EditarJogo(int id, [FromForm] Ps3 ps3)
        {
            try
            {
                var result = _service.ProcurarJogo(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarJogo(ps3);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 de ID {result.GameId} foi editado para {ps3.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {result.Nome} foi alterado para {ps3.Nome} com sucesso!");
            }
            catch (InvalidCastException ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-PS3/{id}")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 {busca.Nome} foi Removido do banco", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi apagado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("editar-parcialmente-jogo-ps3/{id}")]
        public IActionResult EditarParcialmente(int id, [FromForm] JsonPatchDocument<Ps3> patch)
        {
            try
            {
                if (patch == null)
                {
                    //var error = JsonSerializer.Deserialize<JsonPatchDocument>(patch);
                    return BadRequest("Nenhuma edição encontrada");
                }
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.EditarParcialmente(patch, busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi editado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }




        }

    }
}
