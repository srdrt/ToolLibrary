using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using PrimeAppsDotNet;
using PrimeAppsDotNet.Helpers;

namespace Sample.Jobs
{
    public class TestJob
    {
        private IConfiguration _configuration;

        public TestJob(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<bool> Process(int tenantId)
        {
            using (var primeapps = new PrimeApps("Sample", _configuration))
            {
                primeapps.TenantId = tenantId;

                var record = await primeapps.RecordGet("contacts", 1);

                if (record.IsNullOrEmpty())
                    return false;

                var recordUpdate = new JObject();
                recordUpdate["id"] = (int)record["id"];
                recordUpdate["first_name"] = "Test";
                recordUpdate["last_name"] = "Test";

                await primeapps.RecordUpdate("contacts", recordUpdate);
            }

            return true;
        }
    }
}