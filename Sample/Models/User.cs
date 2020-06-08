using Newtonsoft.Json;

namespace Sample.Models
{
    public class User
    {
        public int Id { get; set; }

        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("last_name")]
        public string LastName { get; set; }

        [JsonProperty("full_name")]
        public string FullName { get; set; }

        public string Email { get; set; }
    }
}