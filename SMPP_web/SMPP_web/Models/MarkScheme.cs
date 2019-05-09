using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class MarkScheme
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int MarkSchemeId { get; set; }

        [Required]
        public string AcademicYear { get; set; }

        [Required]
        public string FilePath { get; set; }

        // Navigation property
        public ICollection<Syllabus> Syllabi { get; set; }
    }
}