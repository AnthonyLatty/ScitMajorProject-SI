using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Project
    {
        [ForeignKey("Student")]
        public int ProjectId { get; set; }

        [Display(Name = "Title"), StringLength(20), Required]
        public string Title { get; set; }

        [Display(Name = "Topic"), StringLength(20), Required]
        public string Topic { get; set; }

        [Display(Name = "File Location"), Editable(true), Required]
        public string FilePath { get; set; }

        [Display(Name = "Academic Year"), StringLength(15), Required]
        public string AcademicYear { get; set; }

        public virtual Student Student { get; set; }
        public ICollection<Lecturer> Lecturers { get; set; }
    }
}