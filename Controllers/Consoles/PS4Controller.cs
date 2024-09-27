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
    public class PS4Controller : ControllerBase
    {
        private readonly IPS4Service _service;
        private readonly IlogService LogService;

        public PS4Controller(IPS4Service service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Cadastar-Jogo-PS4")]
        public IActionResult CadastarJogoPS4([FromForm] PS4 ps4)
        {
            try
            {
                _service.CadastrarJogoPS4(ps4);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS4 {ps4.Nome} foi adicionado ao banco, custo de R${ps4.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps4.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("Alterar-Parcialmente-Jogo-ps4")]
        public IActionResult AlterarParcialmenteJogoPS4(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                _service.AlterarParcialmenteJogoPS4(Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"O jogo de ID {BuscaValor} foi editado parcialmente no banco: O valor da Coluna {Coluna} foi editado para {ValorColuna}", "Nenhum erro encontrado");
                return Ok($"Você alterou o jogo de ID {BuscaValor} com a seguinte edição: {Coluna}: {ValorColuna}");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-PS4")]
        public IActionResult ListarJogosPS4()
        {
            var result = _service.ListarJogosPS4();
            return Ok(result);
        }

        [HttpGet("Buscar-jogo-ps4/{id}")]
        public IActionResult BuscarJogoPS4(int id)
        {
            try
            {
                var retrono = _service.BuscarJogoPS4(id);
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

        [HttpPut("Alterar-Jogo-PS4/{id}")]
        public IActionResult AlterarJogoPS4(int id, [FromForm] PS4 ps4)
        {
            try
            {
                var result = _service.BuscarJogoPS4(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.AlterarJogoPS4(ps4);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS3 de ID {result.GameId} foi editado para {ps4.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {result.Nome} foi alterado para {ps4.Nome} com sucesso!");
            }
            catch (InvalidCastException ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-PS4/{id}")]
        public IActionResult ApagarJogoPS4(int id)
        {
            try
            {
                var busca = _service.BuscarJogoPS4(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado ou já apagado");
                }
                _service.ApagarJogoPS4(busca);
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

