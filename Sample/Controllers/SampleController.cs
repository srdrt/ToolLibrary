using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample.Models;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace Sample.Controllers
{
    [Route("api/sample")]
    public class SampleController : BaseController
    {
        /// <summary>
        /// Get All Users
        /// </summary>  
        ///<response code="200">Successful operation</response>
        ///<response code="400">Invalid Request</response>
        ///<response code="404">User not found</response>
        ///<returns>List of Users</returns>
        [HttpPost, Route("get_all_users")]
        [ProducesResponseType(typeof(List<User>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetAllUsers([FromBody]User user)
        {

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var users = await PrimeApps.GetAllUsers();
            var listOfUsers = GenerateUserList(users);

            if (user.Id > 0)
            {

                var filteredUser = listOfUsers.SingleOrDefault(x => x.Id == user.Id);

                if (filteredUser != null)
                {
                    return Ok(filteredUser);
                }

                return NotFound();
            }



            return Ok(listOfUsers);
        }

        public static List<User> GenerateUserList(JArray users)
        {

            var newUsers = new List<User>();

            foreach (JToken user in users)
            {
                newUsers.Add(GenerateUser(user));
            }

            return newUsers;
        }

        public static User GenerateUser(JToken user)
        {
            return JsonConvert.DeserializeObject<User>(user.ToString());
        }
    }
}