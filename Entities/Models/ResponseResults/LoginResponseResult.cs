using System;
using System.Collections.Generic;
using System.Text;

namespace Entities.Models.ResponseResults
{
    public class LoginResponseResult
    {
        public string Token { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
    }
}
