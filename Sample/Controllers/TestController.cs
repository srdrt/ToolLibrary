using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using Sample.Jobs;
using PrimeAppsDotNet;
using PrimeAppsDotNet.Helpers;
using ICacheHelper = Sample.Helpers.ICacheHelper;

namespace Sample.Controllers
{
	public class TestController : BaseController
	{
		private IConfiguration _configuration;
		private ICacheHelper _cacheHelper;
		private IMemoryCache _memoryCache;

		public TestController(IConfiguration configuration, ICacheHelper cacheHelper, IMemoryCache memoryCache)
		{
			_configuration = configuration;
			_cacheHelper = cacheHelper;
			_memoryCache = memoryCache;

		}

		public async Task<IActionResult> TestAction()
		{
			using (var primeapps = new PrimeApps("Sample", _configuration, _memoryCache))
			{
				primeapps.TenantId = TenantId;

				var record = _cacheHelper.Get<JObject>("contact1");

				if (record.IsNullOrEmpty())
				{
					record = await primeapps.RecordGet("contacts", 1);

					if (!record.IsNullOrEmpty())
						_cacheHelper.Set("contact1", record);
				}

				return Ok(record);
			}
		}

		public IActionResult TestJobAction()
		{
			Hangfire.BackgroundJob.Enqueue<TestJob>(x => x.Process(TenantId));

			return Ok();
		}
	}
}