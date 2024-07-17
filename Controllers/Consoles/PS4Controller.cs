using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PS4Controller : ControllerBase
    {
        private readonly IPS4Service _service;
        private readonly IlogService LogService;

        public PS4Controller(IPS4Service service, IlogService logService)
        {
            _service = service;
            LogService = logService;
        }

        [HttpPost("adicionar-Jogo-PS4")]
        public IActionResult AdiocionarJogo([FromForm]Ps4 ps4)
        {
            try
            {
                _service.AdicionarJogo(ps4);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS4 {ps4.Nome} foi adicionado ao banco, custo de R${ps4.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps4.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Jogos-Ps4")]
        public IActionResult ListarJogos()
        {
           var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpGet("buscar-jogo-por-id-ps4/{id}")]
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

        [HttpPut("Editar-Jogo-Ps4/{id}")]
        public IActionResult EditarJogo(int id, [FromForm]Ps4 ps4)
        {
            try
            {
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return BadRequest("Jogo não encontrado");
                }
                _service.EditarJogo(ps4);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS4 de ID {busca.GameId} foi editado para {ps4.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi editado para {ps4.Nome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-jogo-Ps4/{id}")]
        public IActionResult ApagarJogo(int id)
        {
            try
            {
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return BadRequest("Jogo não encontrado");
                }
                _service.ApagarJogo(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS4 {busca.Nome} foi apagado do banco","Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi apagado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("editar-parcialmente-jogo-ps4")]
        public IActionResult EditarParcialmente(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                _service.EdtiarParcialmente(Tabela, Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"Um Jogo foi editado parcialmente no banco", "Nenhum erro encontrado");
                return Ok($"Dados alterados com Sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }


    }
}
