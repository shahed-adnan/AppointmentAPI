using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace WarenNummerApi.Data
{
    public class ApplicationUser: IdentityUser<int>
    {
        [Required]
        public string FirstName { get; set; }

        [Required]
        public string LastName { get; set; }
        public string MobileNumber { get; set; }

        [Required]
        public string EmailAddress { get; set; }
    }

    public class ApplicationRole : IdentityRole<int>
    {
        public ApplicationRole(): base()
        {   }

    }
}