using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Entities.Context
{
    public  class DapperContext
    {
        private readonly string connectionString;
        private readonly IConfiguration configuration;

        public DapperContext(IConfiguration configuration)
        {
            this.configuration = configuration;
            connectionString = this.configuration.GetConnectionString("StationsConnectionString");
        }

        public IDbConnection CreateConnection() => new SqlConnection(connectionString);
    }
}
