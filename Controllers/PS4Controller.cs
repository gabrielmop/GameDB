using GameDB.Models;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.JsonPatch;
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

        [HttpPut("Editar-Jogo-Ps4")]
        public IActionResult EditarJogo(Ps4 ps4)
        {
            _service.EditarJogo(ps4);
            return Ok(ps4);
        }

        [HttpDelete("Apagar-jogo-Ps4")]
        public IActionResult ApagarJogo(Ps4 ps4)
        {
            _service.ApagarJogo(ps4);
            return Ok(ps4);
        }

        [HttpPatch("Editar-Jogo-Ps4-Parcialmente")]
        public IActionResult EditarParcialmente(int id, [FromBody] JsonPatchDocument patch)
        {
            if (patch == null)
            {
                return BadRequest("Nenhuma alteração encontrada");
            }

            var busca = _service.ProcurarJogo(id);
            if (busca == null)
            {
                return NotFound("Jogo não encontrado");
            }

            _service.EditarParcialmente(patch, busca);
            return Ok(busca);
        }


    }
}
