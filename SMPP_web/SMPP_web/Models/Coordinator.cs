using System.ComponentModel.DataAnnotations;

namespace SMPP_web.Models
{
    public class Coordinator
    {
        [Key, Display(Name = "Coordinator Id"), Editable(false)]
        public string CoordinatorId { get; set; }

        [Display(Name = "FirstName"), StringLength(50), Required]
        public string FirstName { get; set; }

        [Display(Name = "LastName"), StringLength(50), Required]
        public string LastName { get; set; }
    }
}