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
    public class JogosDigitaisController : ControllerBase
    {
        private readonly IJogosDigitaisService _service;
        private readonly IlogService LogService;

        public JogosDigitaisController(IJogosDigitaisService service, IlogService _log)
        {
            _service = service;
            LogService = _log;
        }

        [HttpPost("Cadastar-Jogo-Digital")]
        public IActionResult CadastarJogoDigital([FromForm] JogosDigitais jd)
        {
            try
            {
                _service.CadastrarJogoDigital(jd);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo digital {jd.Nome} foi adicionado ao banco, Backup feito em {jd.LocalBackup}", "Nenhum erro encontrado");
                return Ok($"O jogo {jd.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpPost("Alterar-Parcialmente-Jogo-Digital")]
        public IActionResult AlterarParcialmenteJogoDigital(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                _service.AlterarParcialmenteJogoDigital(Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"O jogo de ID {BuscaValor} foi editado parcialmente no banco: O valor da Coluna {Coluna} foi editado para {ValorColuna}", "Nenhum erro encontrado");
                return Ok($"Você alterou o jogo de ID {BuscaValor} com a seguinte edição: {Coluna}: {ValorColuna}");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }

        [HttpGet("Listar-Jogos-Digitais")]
        public IActionResult ListarJogosDigitais()
        {
            var result = _service.ListarJogosDigitais();
            return Ok(result);
        }

        [HttpGet("Buscar-jogo-Digital/{id}")]
        public IActionResult BuscarJogoDigital(int id)
        {
            try
            {
                var retrono = _service.BuscarJogoDigital(id);
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

        [HttpPut("Alterar-Jogo-Digital/{id}")]
        public IActionResult AlterarJogoDigital(int id, [FromForm] JogosDigitais jd)
        {
            try
            {
                var result = _service.BuscarJogoDigital(id);
                if (result == null)
                {
                    return NotFound("Jogo não encontrado");
                }
                _service.AlterarJogoDigital(jd);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo digital de ID {result.GameId} foi editado para {jd.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {result.Nome} foi alterado para {jd.Nome} com sucesso!");
            }
            catch (InvalidCastException ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Jogo-Digital/{id}")]
        public IActionResult ApagarJogoDigital(int id)
        {
            try
            {
                var busca = _service.BuscarJogoDigital(id);
                if (busca == null)
                {
                    return NotFound("Jogo não encontrado ou já apagado");
                }
                _service.ApagarJogoDigital(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo digital {busca.Nome} foi apagado do banco", "Nenhum erro encontrado");
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

