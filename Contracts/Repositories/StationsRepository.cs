using Contracts.Interfaces;
using Dapper;
using Entities.Context;
using Entities.Models;
using Entities.Models.ResponseResults;
using Geolocation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contracts.Repositories
{
    public class StationsRepository: IStationsRepository
    {
        private readonly DapperContext context;
        
        public StationsRepository(DapperContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Station>> GetStations()
        {
            using (var connection = context.CreateConnection())
            {
                var stations = await connection.QueryAsync<Station>(GetStationsQueryString());
                return stations.ToList();
            }
        }
        public async Task<Station> GetStationById(int id)
        {
            using(var connection = context.CreateConnection())
            {
                var station = await connection.QuerySingleOrDefaultAsync<Station>(GetStationsByIdQueryStryng(), new { id });
                return station;
            }
        }

        public async Task<DistanceResponsesResult> GetDistanceBetweenStations(int stationA, int stationB)
        {
            var result = new DistanceResponsesResult();
            using(var connection = context.CreateConnection())
            {
                var station1 = await GetStationById(stationA);
                var station2 = await GetStationById(stationB);

                var station1Coordinates = new Coordinate(station1.Latitude, station1.Longitude);
                var station2Coordinates = new Coordinate(station2.Latitude, station2.Longitude);

                double distance = GeoCalculator.GetDistance(station1Coordinates, station2Coordinates, Convert.ToInt32(DistanceUnit.Meters));
                result.Success = true;
                result.Distance = distance;
                result.DistanceUnit = nameof(DistanceUnit.Meters);
                return result;
            }
        }
        public async Task LogDistanceRequest(int stationA, int stationB, int userId)
        {
            using (var connection = context.CreateConnection())
            {
                var procedureName = "LogDistanceRequest";
                var parameters = new DynamicParameters();
                parameters.Add(nameof(stationA), stationA);
                parameters.Add(nameof(stationB), stationB);
                parameters.Add(nameof(userId), userId);
                await connection.ExecuteAsync(procedureName, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        #region Queries

        public string GetStationsQueryString()
        {
            var query = $"SELECT [ID],[NAME],[LATITUDE],[LONGITUDE],[NOTES],[CREATIONDATE] FROM [dbo].[Stations]";
            return query;
        }

        public string GetStationsByIdQueryStryng()
        {
            var query = $"SELECT [ID],[NAME],[LATITUDE],[LONGITUDE],[NOTES],[CREATIONDATE] FROM [dbo].[Stations] WHERE [ID] = @ID";
            return query;
        }
        #endregion
    }
}
