using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample.Models;

namespace Sample.Controllers
{
    [Route("api/sample")]
    public class SampleController : BaseController
    {
        /// <summary>
        /// Get Users
        /// </summary>  
        ///<response code="200">Successful operation</response>
        ///<response code="400">Invalid request</response>
        ///<returns>List of Users</returns>
        [HttpPost, Route("get_users")]
        [ProducesResponseType(typeof(List<User>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> GetUsers([FromBody]User user)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var users = await PrimeApps.GetAllUsers();
            var userList = users.Select(usr => (User)usr.ToObject(typeof(User))).ToList();

            if (!string.IsNullOrWhiteSpace(user.Email))
                userList = userList.FindAll(x => x.Email == user.Email);

            return Ok(userList);
        }
    }
}