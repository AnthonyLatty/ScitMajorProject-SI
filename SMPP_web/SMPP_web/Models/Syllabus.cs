using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Syllabus
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SyllabusId { get; set; }

        [StringLength(30), Required]
        public string Title { get; set; }

        [Required]
        public string FilePath { get; set; }

        // One to many link with MarkScheme
        public int MarkSchemeId { get; set; }
        public MarkScheme MarkScheme { get; set; }

        // Navigation property
        public ICollection<Coordinator> Coordinators { get; set; }
    }
}