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
    
    public partial class Student
    {
        public string StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Faculty { get; set; }
        public string IDNumber { get; set; }
        public int LecturerLecturerId { get; set; }
    
        public virtual Lecturer Lecturer { get; set; }
        public virtual Project Project { get; set; }
    }
}
