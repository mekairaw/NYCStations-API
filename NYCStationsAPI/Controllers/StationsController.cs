using Contracts.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace NYCStationsAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StationsController : Controller
    {
        private readonly IStationsRepository stationsRepository;
        public StationsController(IStationsRepository stationsRepository)
        {
            this.stationsRepository = stationsRepository;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllStations()
        {
            try
            {
                var stations = await stationsRepository.GetStations();
                return Ok(stations);
            }
            catch(Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        [Authorize]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetStation(int id)
        {
            try
            {
                var station = await stationsRepository.GetStationById(id);
                return Ok(station);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        [Authorize]
        [HttpGet("distance")]
        public async Task<IActionResult> GetDistanceBetweenStations([FromQuery]string firstId, [FromQuery]string secondId)
        {
            var user = HttpContext.User;
            try
            {
                var distance = await stationsRepository.GetDistanceBetweenStations(Convert.ToInt32(firstId), Convert.ToInt32(secondId));
                await stationsRepository.LogDistanceRequest(Convert.ToInt32(firstId), Convert.ToInt32(secondId), Convert.ToInt32(user.Claims.First(c => c.Type == ClaimTypes.NameIdentifier).Value.ToString()));
                return Ok(distance);
            }
            catch(Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
