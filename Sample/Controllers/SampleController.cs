using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Sample.Controllers
{
    public class SampleController : BaseController
    {
        public async Task<IActionResult> GetAllUsers()
        {
            var users = await PrimeApps.GetAllUsers();

            return Ok(users);
        }
    }
}