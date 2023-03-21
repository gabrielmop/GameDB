﻿using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System.Globalization;
using GameDB.Services;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PS3Controller : ControllerBase
    {
       private readonly IPS3Service _service;
      
        public PS3Controller(IPS3Service service, IPs3Repository repositorio)
        {
            _service = service;            
        }

        [HttpPost("Adicionar-Jogo-PS3")]
        public IActionResult AdicionarJogo([FromForm] Ps3 ps3)
        {
            _service.AdicionarJogo(ps3);
            return Ok(ps3);

        }

        [HttpGet("Listar-Jogos-PS3")]
        public IActionResult ListarJogos()
        {
            var result = _service.ListarJogo();
            return Ok(result);
        }

        [HttpPut("Editar-Jogo")]
        public IActionResult EditarJogo(int id, [FromForm] Ps3 ps3)
        {
            var result = _service.ProcurarJogo(id);
            if (result == null)
            {
                return NotFound("Jogo não encontrado");
            }
            _service.EditarJogo(ps3);
            return Ok(ps3);
        }

        [HttpDelete("Apagar-Jogo/{id}")]
        public IActionResult ApagarJogo(int id)
        {
            var busca = 
                _service.ProcurarJogo(id);
            if (busca == null)
            {
                return NotFound("Jogo não encontrado");
            }
            _service.ApagarJogo(busca);
            return Ok(busca);
        }

        [HttpPatch(("Editar-Jogo-Parcialmente/{id}"))]
        public IActionResult EditarParcialmente(int id, [FromBody] JsonPatchDocument patch)
        {
            if (patch == null)
            {
                return BadRequest("Nenhuma edição encontrada");
            }
            var busca = _service.ProcurarJogo(id);
            if (busca == null)
            {
                return NotFound("Jogo não encontrado");
            }
            /* "operationType": 0,
             "path": "Insira a Coluna que voce vai alterar",
             "op": "o tipo de operação, geralmente é 'Replace'",
             "from": "não precisa se for Replace",
             "value": "O novo valor que precisa ser"*/
            _service.EditarParcialmente(patch, busca);
            return Ok(busca);

            
            
  
        }

    }
}