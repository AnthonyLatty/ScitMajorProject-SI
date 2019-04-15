using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SMPP_web.Models
{
    public class Group
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int GroupId { get; set; }

        [StringLength(20), Required]
        public string Name { get; set; }

        // Navigation properties
        public ICollection<Student> Students { get; set; }

        public ICollection<Lecturer> Lecturers { get; set; }

        public ICollection<Project> Projects { get; set; }

        public ICollection<Group> Groups { get; set; }
    }
}