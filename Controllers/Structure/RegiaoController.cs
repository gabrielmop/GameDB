using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
    [ApiController]
    public class RegiaoController : ControllerBase
    {
        public IregiaoRepository Repositorio;
        private readonly IlogService LogService;

        public RegiaoController(IregiaoRepository _repositorio, IlogService _Log)
        {
            Repositorio = _repositorio;
            LogService = _Log;
        }

        [HttpPost("Cadastrar-Regiao")]
        public IActionResult CadastrarRegiao([FromForm] Regiao regiao)
        {
            try
            {
                var result = Repositorio.CadastrarRegiao(regiao);
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {regiao.RegiaoNome} (Sigla {regiao.Sigla}) foi cadastrada no banco", "Nenhum erro encontrado");
                return Ok($"A Região {regiao.RegiaoNome} foi cadastrada com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Regioes")]
        public IActionResult ListarRegioes()
        {
            try
            {
                var Result = Repositorio.ListarRegioes();
                return Ok(Result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Buscar-regiao/{id}")]
        public IActionResult BuscarRegiao(int id)
        {
            try
            {
                var retrono = Repositorio.BuscarRegiao(id);
                if (retrono == null)
                {
                    return NotFound("Região não encontrada");
                }
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Alterar-Regiao/{id}")]
        public IActionResult AlterarRegiao(int id, [FromForm] Regiao regiao)
        {
            try
            {
                var result = Repositorio.BuscarRegiao(id);
                if (result == null)
                {
                    return NotFound("Região não encontrada");
                }
                Repositorio.AlterarRegiao(regiao);
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {result.RegiaoNome} foi alterada para {regiao.RegiaoNome}", "Nenhum erro encontrado");
                return Ok($"A região {result.RegiaoNome} foi alterada para {regiao.RegiaoNome} com sucesso");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Regiao/{id}")]
        public IActionResult ApagarRegiao(int id)
        {
            try
            {
                var busca = Repositorio.BuscarRegiao(id);
                if (busca == null)
                {
                    return NotFound("Região não encontrada ou já apagada");
                }
                Repositorio.ApagarRegiao(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {busca.RegiaoNome} foi apagada do banco", "Nenhum erro encontrado");
                return Ok($"A Região {busca.RegiaoNome} foi apagada com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }
    }
}
