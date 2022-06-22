﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Models
{
    public class Station
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string Notes { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
