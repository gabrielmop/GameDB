using GameDB.Models;
using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {regiao.RegiaoNome} foi Adicionada ao banco", "");
                return Ok(result);
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
            catch (System.Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpPut("Editar-Regiao/{id}")]
        public IActionResult EditarRegiao(int id, [FromForm] Regiao regiao)
        {
            try
            {
                var result = Repositorio.ProcurarRegiao(id);
                if (result == null)
                {
                    return NotFound("Região não encontrada");
                }
                Repositorio.EdtiarRegiao(regiao);
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {regiao.RegiaoNome} foi editada no banco", "");
                return Ok(regiao);
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
                var busca = Repositorio.ProcurarRegiao(id);
                if (busca == null)
                {
                    return NotFound("Região não encontrada, tente novamente");
                }
                Repositorio.ApagarRegiao(busca);
                LogService.RegistrarLog(DateTime.Now, 2, $"A região {busca.RegiaoNome} foi Apagada do banco", "");
                return NoContent();
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }
    }
}
