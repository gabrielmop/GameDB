using GameDB.Models.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Interfaces.Struture;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Controllers
{
    [Route("api/Structure/[controller]")]
    [ApiExplorerSettings(GroupName = "v2")]
    [ApiVersion("2.0")]
    [ApiController]
    public class LogsController : ControllerBase
    {
        private readonly IlogService LogService;

        public LogsController(IlogService _service)
        {

            LogService = _service;
        }


        [HttpGet("Listar-Log")]
        public IActionResult ListarLog()
        {
            try
            {
                var result = LogService.ListarLog();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }

        [HttpGet("Listar-ultimos-Logs")]
        public IActionResult ListarUltimosLogs(int quantidade)
        {
            try
            {
                var retrono = LogService.ListarUltimosLogs(quantidade);
                return Ok(retrono);
            }
            catch (Exception ex)
            {
                return BadRequest($"{ex.Message}");

            }
        }
    }
}