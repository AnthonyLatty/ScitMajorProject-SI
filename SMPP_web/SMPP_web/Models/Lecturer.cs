using System.ComponentModel.DataAnnotations;

namespace SMPP_web.Models
{
    public class Lecturer
    {
        [Key, Display(Name = "Lecturer ID"), Editable(false)]
        public string LecturerId { get; set; }

        [Display(Name = "FirstName"), StringLength(50), Required]
        public string FirstName { get; set; }

        [Display(Name = "LastName"), StringLength(50), Required]
        public string LastName { get; set; }

        [Display(Name = "Office Extension"), StringLength(4), Required]
        public string OfficeExtension { get; set; }

        // One to one link with Faculty table
        public virtual Faculty Faculty { get; set; }

        // One to many link with Memo table
        public int MemoId { get; set; }
        public Memo Memo { get; set; }

        // One to many link with Project table
        public int ProjectId { get; set; }
        public Project Project { get; set; }
    }
}