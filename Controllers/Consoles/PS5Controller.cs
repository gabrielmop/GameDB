﻿using GameDB.Models.Consoles;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers.Consoles
{
    [Route("api/[controller]")]
    [ApiController]
    public class PS5Controller : ControllerBase
    {
        private readonly IPS5Service _service;
        private readonly IlogService LogService;

        public PS5Controller(IPS5Service service, IlogService logService)
        {
            _service = service;
            LogService = logService;
        }

        [HttpPost("adicionar-Jogo-PS5")]
        public IActionResult AdiocionarJogo([FromForm] PS5 ps5)
        {
            try
            {
                _service.AdicionarJogo(ps5);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS5 {ps5.Nome} foi adicionado ao banco, custo de R${ps5.Preco}", "Nenhum erro encontrado");
                return Ok($"O jogo {ps5.Nome} foi adicionado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Jogos-Ps5")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpGet("buscar-jogo-por-id-ps5/{id}")]
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

        [HttpPut("Editar-Jogo-Ps5/{id}")]
        public IActionResult EditarJogo(int id, PS5 ps5)
        {
            try
            {
                var busca = _service.ProcurarJogo(id);
                if (busca == null)
                {
                    return BadRequest("Jogo não encontrado");
                }
                _service.EditarJogo(ps5);
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS5 {busca.Nome} foi editado para {ps5.Nome}", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi alterado para {ps5.Nome} com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-jogos-Ps5/{id}")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS5 {busca.Nome} foi apagado do banco", "Nenhum erro encontrado");
                return Ok($"O jogo {busca.Nome} foi apagado com sucesso");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }

        [HttpPatch("editar-parcialmente-jogo-ps5/{id}")]
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
                LogService.RegistrarLog(DateTime.Now, 2, $"O Jogo de PS5 {busca.Nome} foi editado no banco", "Nenhum erro encontrado");
                return Ok($"O Jogo de PS5 {busca.Nome} foi editado com sucesso!");
            }
            catch (Exception ex)
            {
                LogService.RegistrarLog(DateTime.Now, 1, "Um erro foi encontrado", ex.Message);
                return BadRequest(ex.Message);
            }
        }


    }
}
