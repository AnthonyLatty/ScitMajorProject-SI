using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Project
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProjectId { get; set; }

        [StringLength(30), Required]
        public string Topic { get; set; }

        [StringLength(20), Required]
        public string Title { get; set; }

        [StringLength(10), Required]
        public string AcademicYear { get; set; }

        [Required]
        public string FilePath { get; set; }


        // One to many link with Group
        public int GroupId { get; set; }
        public Group Group { get; set; }
    }
}