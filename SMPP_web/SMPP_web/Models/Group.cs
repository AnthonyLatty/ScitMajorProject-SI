using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Group
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int GroupId { get; set; }

        [StringLength(20), Required]
        public string Name { get; set; }

        public decimal? Grade { get; set; }

        // Navigation properties
        public string Id { get; set; }
        public Lecturer Lecturer { get; set; }

    }
}