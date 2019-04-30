using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Memo
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        public string Description { get; set; }

        // Navigation property
        public ICollection<Lecturer> Lecturers { get; set; }
    }
}