using Microsoft.AspNetCore.Mvc;
using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Interfaces.Consoles;

namespace GameDB.Controllers.Consoles
{
    [Route("api/Consoles/[controller]")]
    [ApiExplorerSettings(GroupName = "v1")]
    [ApiVersion("1.0")]
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

        [HttpPost("Cadastar-Jogo-PS3")]
        public IActionResult CadastarJogoPS3([FromForm] PS3 ps3)
        {
            try
            {
                _service.CadastrarJogoPS3(ps3);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 {ps3.Nome} foi adicionado ao banco, custo de R${ps3.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps3.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("Alterar-Parcialmente-Jogo-ps3")]
        public IActionResult AlterarParcialmenteJogoPS3(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                _service.AlterarParcialmenteJogoPS3(Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"O jogo de ID {BuscaValor} foi editado parcialmente no banco: O valor da Coluna {Coluna} foi editado para {ValorColuna}", "Nenhum erro encontrado");
                return Ok($"Você alterou o jogo de ID {BuscaValor} com a seguinte edição: {Coluna}: {ValorColuna}");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-PS3")]
        public IActionResult ListarJogosPS3()
        {
            var result = _service.ListarJogosPS3();
            return Ok(result);
        }

        [HttpGet("Buscar-jogo-ps3/{id}")]
        public IActionResult BuscarJogoPS3(int id)
        {
            try
            {
                var retrono = _service.BuscarJogoPS3(id);
                if (retrono == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Jogo-PS3/{id}")]
        public IActionResult AlterarJogoPS3(int id, [FromForm] PS3 ps3)
        {
            try
            {
                var result = _service.BuscarJogoPS3(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.AlterarJogoPS3(ps3);
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
        public IActionResult ApagarJogoPS3(int id)
        {
            try
            {
                var busca = _service.BuscarJogoPS3(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado ou já apagado");
                }
                _service.ApagarJogoPS3(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 {busca.Nome} foi apagado do banco", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi apagado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }
        }

    }

