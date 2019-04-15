﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMPP_web.Models
{
    public class Student
    {
        [Key, StringLength(128), Required]
        public string Id { get; set; }

        [Required, Editable(false)]
        public string UtechId { get; set; }

        [StringLength(50), Required]
        public string FirstName { get; set; }

        [StringLength(50), Required]
        public string LastName { get; set; }

        [StringLength(150), Required]
        public string Address { get; set; }

        [StringLength(100), Required]
        public string Faculty { get; set; }
    }
}