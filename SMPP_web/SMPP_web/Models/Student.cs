using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMPP_web.Models
{
    public class Student
    {
        [Key, Display(Name = "ID No."), Editable(false)]
        public string StudentId { get; set; }

        [Display(Name = "FirstName"), StringLength(50), Required]
        public string FirstName { get; set; }

        [Display(Name = "LastName"), StringLength(50), Required]
        public string LastName { get; set; }

        [Display(Name = "Address"), StringLength(100), Required]
        public string Address { get; set; }

        [Display(Name = "Faculty"), Required]
        public string Faculty { get; set; }

        // One to one link with Project table
        public virtual Project Project { get; set; }

        // One to many link with Memo table
        public int MemoId { get; set; }
        public Memo Memo { get; set; }
    }
}