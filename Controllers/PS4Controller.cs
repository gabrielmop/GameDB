using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    public class PS4Controller : ControllerBase
    {
        private readonly IPS4Service _service;

        public PS4Controller(IPS4Service service)
        {
            _service = service;
        }

        [HttpPost("adicionar-Jogo-PS4")]
        public IActionResult AdiocionarJogo([FromForm]Ps4 ps4)
        {
            _service.AdicionarJogo(ps4);
            return Ok(ps4);
        }

        [HttpGet("Listar-Jogo-Ps4")]
        public IActionResult ListarJogos()
        {
           var result = _service.ListarJogo();
            return Ok(result);
        }
    }
}
