using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Document
    {
        [Key, Display(Name = "Document Id"), Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DocumentId { get; set; }

        [Display(Name = "Title"), StringLength(20), Required]
        public string Title { get; set; }

        [Display(Name = "Date Uploaded"), Required]
        public DateTime Date { get; set; }

        [Display(Name = "File Path"), Required]
        public string File { get; set; }

        [Display(Name = "Academic Year"), StringLength(15), Required]
        public string AcademicYear { get; set; }
    }
}