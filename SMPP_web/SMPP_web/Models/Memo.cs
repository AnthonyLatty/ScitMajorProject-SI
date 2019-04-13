using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Memo
    {
        [Key, Display(Name = "Memo Id"), Editable(false)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int MemoId { get; set; }

        [Display(Name = "Date"), Required]
        public DateTime Date { get; set; }

        [Display(Name = "Description"), StringLength(150), Required]
        public string Description { get; set; }

        public ICollection<Lecturer> Lecturers { get; set; }
        public ICollection<Student> Students { get; set; }
    }
}