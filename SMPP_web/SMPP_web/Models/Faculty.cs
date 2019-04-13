using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Faculty
    {
        [ForeignKey("Lecturer")]
        public string FacultyId { get; set; }

        [Display(Name = "Faculty Name"), Editable(false)]
        public string FacultyName { get; set; }

        public virtual Lecturer Lecturer { get; set; }
    }
}