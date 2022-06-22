using Contracts.Interfaces;
using Entities.Models.RequestModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace NYCStationsAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserRepository userRepository;
        public UsersController(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }
        [HttpGet("{id}/favoriteStations")]
        public async Task<IActionResult> GetFavoriteStations(int id)
        {
            try
            {
                var favoriteStations = await userRepository.GetUsersFavoriteStations(id);
                return Ok(favoriteStations);
            }
            catch(Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        [HttpPost("create")]
        public async Task<IActionResult> Create([FromBody] UserCreationRequest userCreationRequest)
        {
            try
            {
                var result = await userRepository.CreateUser(userCreationRequest);
                if (result.Success == false)
                    return StatusCode(400, result);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
