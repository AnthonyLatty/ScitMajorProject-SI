//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SMPP_web
{
    using System;
    using System.Collections.Generic;
    
    public partial class MarkScheme
    {
        public int MarkSchemeId { get; set; }
        public string FilePath { get; set; }
    
        public virtual Syllabus Syllabu { get; set; }
    }
}