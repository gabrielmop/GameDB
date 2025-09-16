using GameDB.Models.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Structure;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
    [ApiController]
    public class Digital_IndexController : ControllerBase
    {
        private readonly IDigital_IndexService service;
        private readonly IlogService LogService;

        public Digital_IndexController(IDigital_IndexService _service, IlogService _Log)
        {
            service = _service;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Digital-Index")]
        public IActionResult CadastrarDigital_Index([FromForm] Digital_Index index)
        {
            try
            {
                var result = service.CadastrarDigital_Index(index);
                LogService.RegistrarLog(DateTime.Now, 2, $"A O indice do jogo digital {index.Nome} Foi registrado no Banco", "Nenhum erro encontrado");
                return Ok($"A O indice do jogo digital {index.Nome} Foi registrado no Bancoo");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Digital-Index")]
        public IActionResult ListarDigital_Index()
        {
            try
            {
                var result = service.ListarDigital_Index();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-Digital-Index/{id}")]
        public IActionResult BuscarDigital_Index(int id)
        {
            try
            {
                var retrono = service.BuscarDigital_Index(id);
                if (retrono == null)
                {
                    return NotFound("Indice não encontrado");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Digital-Index/{id}")]
        public IActionResult AlterarDigital_Index(int id, [FromForm] Digital_Index index)
        {
            try
            {
                var busca = service.BuscarDigital_Index(id);
                if (busca == null)
                {
                    return NotFound("Indice não encontrado");
                }
                service.AlterarDigital_Index(index);
                LogService.RegistrarLog(DateTime.Now, 2, $"O indice do jogo digital {busca.Nome} foi Alterado para {index.Nome} no Banco", "Nenhum erro encontrado");
                return Ok($"O indice do jogo digital {busca.Nome} Foi alterado para {index.Nome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPost("Alterar-Parcialmente-Digital-Index")]
        public IActionResult AlterarParcialmenteJogoDigital(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
            try
            {
                service.AlterarParcialmenteDigital_Index(Coluna, ValorColuna, Busca, BuscaValor);
                LogService.RegistrarLog(DateTime.Now, 2, $"O indice do jogo digital de ID {BuscaValor} foi editado parcialmente no banco: O valor da Coluna {Coluna} foi editado para {ValorColuna}", "Nenhum erro encontrado");
                return Ok($"Você alterou o indice do jogo digital de ID {BuscaValor} com a seguinte edição: {Coluna}: {ValorColuna}");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }

        }


        [HttpDelete("Apagar-Digital-Index/{id}")]
        public IActionResult ApagarDigital_Index(int id)
        {
            try
            {
                var busca = service.BuscarDigital_Index(id);
                if (busca == null)
                {
                    return NotFound("Indice de jogo digital não encontrado ou já apagado");
                }

                service.ApagarDigital_Index(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Indice do jogo digital {busca.Nome} foi apagado do Banco", "Nenhum erro encontrado");
                return Ok($"O Indice {busca.Nome} foi apagado com sucesso!");

            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um Erro foi encontrado", ex.Message);
                return BadRequest($"{ex.Message}");

            }            
        }
    }
}
