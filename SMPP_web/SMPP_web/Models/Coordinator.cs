using System.ComponentModel.DataAnnotations;

namespace SMPP_web.Models
{
    public class Coordinator
    {
        [Key, StringLength(128), Required]
        public string Id { get; set; }

        [StringLength(50), Required]
        public string FirstName { get; set; }

        [StringLength(50), Required]
        public string LastName { get; set; }

        // One to many link with Syllabus
        public int SyllabusId { get; set; }
        public Syllabus Syllabus { get; set; }
    }
}