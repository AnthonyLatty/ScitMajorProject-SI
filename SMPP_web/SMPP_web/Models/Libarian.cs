using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SMPP_web.Models
{
    public class Libarian
    {
        [Key, StringLength(128), Required]
        public string Id { get; set; }

        [StringLength(50), Required]
        public string FirstName { get; set; }

        [StringLength(50), Required]
        public string LastName { get; set; }

        // One to many link with Document
        public int DocumentId { get; set; }
        public Document Document { get; set; }
    }
}