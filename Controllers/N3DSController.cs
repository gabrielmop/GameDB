using GameDB.Models;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.Http;
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de N3DS {n3ds.Nome} foi adicionado ao banco, custo de R${n3ds.Preco}", "");
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


    }
}
