using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Models.ResponseResults
{
    public class DistanceResponsesResult
    {
        public bool Success { get; set; }
        public double Distance { get; set; }
        public string DistanceUnit { get; set; }
    }
}
