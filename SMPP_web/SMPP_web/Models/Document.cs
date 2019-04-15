using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SMPP_web.Models
{
    public class Document
    {
        [Key, Editable(false), Required]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DocumentId { get; set; }

        [StringLength(30), Required]
        public string Title { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        public string FilePath { get; set; }


        // Navigation property
        public ICollection<Libarian> Libarians { get; set; }
    }
}