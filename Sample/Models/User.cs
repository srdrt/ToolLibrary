using Newtonsoft.Json;
using System;


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

        public Profile Profile { get; set; }
    }

    public class Profile
    {
        public int Id { get; set; }

        [JsonProperty("name_en")]
        public string NameEn { get; set; }

        [JsonProperty("description_en")]
        public string DescriptionEn { get; set; }

        [JsonProperty("name_tr")]
        public string NameTr { get; set; }

        [JsonProperty("description_tr")]
        public string DescriptionTr { get; set; }

    }
}