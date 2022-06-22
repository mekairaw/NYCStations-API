using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Models.ResponseResults
{
    public class UserCreationResponseResult
    {
        public bool Success { get; set; }
        public int Id { get; set; }
        public string Message { get; set; }
    }
}
