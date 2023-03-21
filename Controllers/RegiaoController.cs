using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegiaoController : ControllerBase
    {
        public IregiaoRepository Repositorio;

        public RegiaoController(IregiaoRepository _repositorio)
        {
            Repositorio = _repositorio;
        }

        [HttpPost("Cadastrar-Regiao")]
        public IActionResult CadastrarRegiao([FromForm] Regiao regiao)
        {
            var result = Repositorio.CadastrarRegiao(regiao);
            return Ok(result);
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
            var result = Repositorio.ProcurarRegiao(id);
            if (result == null)
            {
                return NotFound("Região não encontrada");
            }
            Repositorio.EdtiarRegiao(regiao);

            return Ok(regiao);
        }

        [HttpDelete("Apagar-Regiao/{id}")]
        public IActionResult ApagarRegiao(int id)
        {
            var busca = Repositorio.ProcurarRegiao(id);
            if (busca == null)
            {
                return NotFound("Região não encontrada, tente novamente");

            }
            Repositorio.ApagarRegiao(busca);
            return NoContent();
        }
    }
}
