using Entities.Models;
using Entities.Models.ResponseResults;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Contracts.Interfaces
{
    public interface IStationsRepository
    {
        Task<IEnumerable<Station>> GetStations();
        Task<Station> GetStationById(int id);
        Task<DistanceResponsesResult> GetDistanceBetweenStations(int stationA, int stationB);
        Task LogDistanceRequest(int stationA, int stationB, int userId);
    }
}
