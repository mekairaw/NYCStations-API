using Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Services.Interfaces
{
    public interface ITokenService
    {
        string buildToken(string key, string issuer, User user);
        bool ValidateToken(string key, string issuer, string token);
    }
}
