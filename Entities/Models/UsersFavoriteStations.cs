using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Models
{
    public class UsersFavoriteStations
    {
        public int StationId { get; set; }
        public string Name { get; set; }
        public int UserId { get; set; }
        public int Visits { get; set; }
    }
}
