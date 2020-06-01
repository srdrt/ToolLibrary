using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using PrimeAppsDotNet;

namespace Sample.Controllers
{
    public class SampleController : BaseController
    {
        private IConfiguration _configuration;
        private IMemoryCache _memoryCache;

        public SampleController(IConfiguration configuration, IMemoryCache memoryCache)
        {
            _configuration = configuration;
            _memoryCache = memoryCache;
        }

        public async Task<IActionResult> GetAllUsers()
        {
            using (var primeapps = new PrimeApps(_configuration, _memoryCache))
            {
                primeapps.TenantId = TenantId;

                var record = await primeapps.GetAllUsers();

                return Ok(record);
            }
        }
    }
}