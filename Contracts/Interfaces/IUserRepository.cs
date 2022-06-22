using Entities.Models;
using Entities.Models.RequestModels;
using Entities.Models.ResponseResults;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Contracts.Interfaces
{
    public interface IUserRepository
    {
        Task<LoginResponseResult> GetLoginInformation(LoginRequest loginRequest, string key, string issuer);
        Task<IEnumerable<UsersFavoriteStations>> GetUsersFavoriteStations(int id);
        Task<UserCreationResponseResult> CreateUser(UserCreationRequest userCreationRequest);
    }
}
