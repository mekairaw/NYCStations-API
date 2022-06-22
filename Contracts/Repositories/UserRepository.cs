using Contracts.Interfaces;
using Entities.Context;
using Entities.Models;
using Entities.Models.RequestModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using EasyEncryption;
using Entities.Models.ResponseResults;
using Services.Interfaces;
using System.Linq;
using System.Data;

namespace Contracts.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DapperContext context;
        private readonly ITokenService tokenService;

        public UserRepository(DapperContext context, ITokenService tokenService)
        {
            this.context = context;
            this.tokenService = tokenService;
        }
        private async Task<User> GetUser(LoginRequest loginRequest)
        {
            using (var connection = context.CreateConnection())
            {
                var encryptedPassword = SHA.ComputeSHA256Hash(loginRequest.Password);
                var parameters = new DynamicParameters();
                parameters.Add(nameof(loginRequest.UserName), loginRequest.UserName);
                parameters.Add(nameof(loginRequest.Password), encryptedPassword);
                var user = await connection.QuerySingleOrDefaultAsync<User>(GetUserQueryString(), parameters);
                return user;
            }
        }

        private async Task<User> GetUserByUserName(string userName)
        {
            using(var connection = context.CreateConnection())
            {
                return await connection.QueryFirstOrDefaultAsync<User>(GetUserByUserNameQueryString(), new { userName });
            }
        }

        public async Task<LoginResponseResult> GetLoginInformation(LoginRequest loginRequest, string key, string issuer)
        {
            var user = await GetUser(loginRequest);
            if(user == null)
                return new LoginResponseResult { Token = null, Success = false, Message = "Incorrect credentials, please try again." };
            var token = tokenService.buildToken(key, issuer, user);
            if (token == null)
                return new LoginResponseResult { Token = null, Success = false, Message = "Error creating token" };
            return new LoginResponseResult { Token = token, Success = true, Message = null };
        }


        public async Task<IEnumerable<UsersFavoriteStations>> GetUsersFavoriteStations(int id)
        {
            using(var connection = context.CreateConnection())
            {
                var stations = await connection.QueryAsync<UsersFavoriteStations>(GetUsersFavoriteStationsQueryString(), new { id });
                return stations.ToList();
            }
        }

        public async Task<UserCreationResponseResult> CreateUser(UserCreationRequest userCreationRequest)
        {
            if(string.IsNullOrEmpty(userCreationRequest.UserName) || string.IsNullOrEmpty(userCreationRequest.Name) || string.IsNullOrEmpty(userCreationRequest.LastName)
                || string.IsNullOrEmpty(userCreationRequest.Email) || string.IsNullOrEmpty(userCreationRequest.Password) || string.IsNullOrEmpty(userCreationRequest.ConfirmPassword))
            {
                return new UserCreationResponseResult { Success = false, Message = "Missing fields on object creation" };
            }
            if(userCreationRequest.Password != userCreationRequest.ConfirmPassword)
            {
                return new UserCreationResponseResult { Success = false, Message = "Passwords aren't matching" };
            }
            if(await GetUserByUserName(userCreationRequest.UserName) != null)
            {
                return new UserCreationResponseResult { Success = false, Message = "User Name already exists, please choose another one" };
            }
            var hashedPassword = SHA.ComputeSHA256Hash(userCreationRequest.Password);
            using (var connection = context.CreateConnection())
            {
                var procedureName = "CreateUser";
                var parameters = new DynamicParameters();
                parameters.Add(nameof(userCreationRequest.Name), userCreationRequest.Name);
                parameters.Add(nameof(userCreationRequest.LastName), userCreationRequest.LastName);
                parameters.Add(nameof(userCreationRequest.UserName), userCreationRequest.UserName);
                parameters.Add(nameof(userCreationRequest.Email), userCreationRequest.Email);
                parameters.Add(nameof(userCreationRequest.Password), hashedPassword);
                await connection.ExecuteAsync(procedureName, parameters, commandType: CommandType.StoredProcedure);

                var newUser = await GetUserByUserName(userCreationRequest.UserName);

                return new UserCreationResponseResult { Success = true, Message = "User created successfully", Id = newUser.Id };
            }

        }

        #region Queries
        private string GetUserQueryString()
        {
            var query = @"SELECT [Id], [UserName], [Name], [LastName], [Email], [Password], [CreationDate] 
                            FROM [dbo].[Users] WHERE [UserName] = @UserName AND [Password] = @Password";
            return query;
        }
        private string GetUsersFavoriteStationsQueryString()
        {
            var query = @"SELECT TOP 5 [s].[ID] StationId, [s].[Name], [FS].[UserId], COUNT([FS].[ID]) Visits
                            FROM[dbo].[Stations][s]
                            LEFT JOIN[FavoriteStations] [FS] ON[s].[ID] = [FS].[FirstStationID] OR[s].[ID] = [FS].[SecondStationID]
                            INNER JOIN[Users] [u] ON[u].[ID] = [FS].[UserId]
                            WHERE[u].[ID] = @Id
                            GROUP BY[S].[ID], [S].[Name], [FS].[UserId] ORDER BY Visits DESC";
            return query;
        }
        private string GetUserByUserNameQueryString()
        {
            var query = @"SELECT [Id], [UserName], [Name], [LastName], [Email], [Password], [CreationDate] 
                            FROM [dbo].[Users] WHERE [UserName] = @userName";
            return query;
        }
        #endregion
    }
}
