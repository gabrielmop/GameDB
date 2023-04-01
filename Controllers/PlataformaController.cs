using GameDB.Models;
using GameDB.Repository.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlataformaController : ControllerBase
    {
        private readonly IPlataformaRepository Repositorio;
        private readonly IlogRepository LogRepo;

        public PlataformaController(IPlataformaRepository _repositorio, IlogRepository _log)
        {
            Repositorio = _repositorio;
            LogRepo = _log;

        }


        [HttpPost("Registrar-Nova-Plataforma")]
        public IActionResult RegistrarPlataforma([FromForm] Plataforma plataforma)
        {
            try
            {
                var result = Repositorio.RegistrarPlataforma(plataforma);
               return Ok(result);
                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Listar-Plataforma")]
        public IActionResult ListarPlataforma()
        {
            try
            {
                var result = Repositorio.ListarPlataforma();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Buscar-Plataforma-Por-Id/{id}")]
        public IActionResult BuscarPorId(int id)
        {
            try
            {
                var resultado = Repositorio.ProcurarPlataforma(id);
                if (resultado == null)
                {
                    return NotFound();
                }
                return Ok(resultado);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("Editar-Plataforma/{id}")]
        public IActionResult EditarPlataforma(int id,[FromForm]Plataforma plataforma)
        {
            try
            {
                var busca = Repositorio.ProcurarPlataforma(id);
                if (busca == null)
                {
                    return NotFound();
                }
                Repositorio.EditarPlataforma(plataforma);
                return Ok(plataforma);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("Apagar-Plataforma/{id}")]
        public IActionResult ApagarPlataforma(int id)
        {
            var resultado = Repositorio.ProcurarPlataforma(id);
            if (resultado == null)
            {
                return NotFound();
            }
            Repositorio.ApagarPlataforma(resultado);
            return Ok(resultado);
        }
    }

    }

