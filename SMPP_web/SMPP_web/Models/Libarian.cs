using System.ComponentModel.DataAnnotations;

namespace SMPP_web.Models
{
    public class Libarian
    {
        [Key, Display(Name = "Libarian ID"), Editable(false)]
        public string LibarianId { get; set; }

        [Display(Name = "FirstName"), StringLength(50), Editable(false), Required]
        public string FirstName { get; set; }

        [Display(Name = "LastName"), StringLength(50), Editable(false), Required]
        public string LastName { get; set; }

        // One to many link to Document table
        public int DocumentId { get; set; }
        public Document Document { get; set; }
    }
}