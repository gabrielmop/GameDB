﻿using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
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

        [HttpGet("Listar-Jogo-Ps4")]
        public IActionResult ListarJogos(bool incluiPS5)
        {
           var result = _service.ListarJogo(incluiPS5);
            return Ok(result);
        }

        [HttpPut("Editar-Jogo-Ps4")]
        public IActionResult EditarJogo(int id, Ps4 ps4)
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

        [HttpDelete("Apagar-jogo-Ps4")]
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

        [HttpPatch("Editar-Jogo-Ps4-Parcialmente")]
        public IActionResult EditarParcialmente(int id, [FromBody] JsonPatchDocument patch)
        {
            try
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS4 {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi editado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }


    }
}
