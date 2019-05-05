using System.ComponentModel.DataAnnotations;

namespace SMPP_web.Models
{
    public class Lecturer
    {
        [Key, StringLength(128), Required]
        public string Id { get; set; }

        [StringLength(50), Required]
        public string FirstName { get; set; }

        [StringLength(50), Required]
        public string LastName { get; set; }

        [StringLength(100), Required]
        public string Faculty { get; set; }

        [StringLength(4), Required]
        public string Office { get; set; }

        [StringLength(4), Required]
        public string Extension { get; set; }

       
        

        // One to many link with Memo
        
    }
}