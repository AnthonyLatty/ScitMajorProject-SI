﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ScitMajorProjectModelContainer : DbContext
    {
        public ScitMajorProjectModelContainer()
            : base("name=ScitMajorProjectModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<Lecturer> Lecturers { get; set; }
        public virtual DbSet<Libarian> Libarians { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<Memo> Memos { get; set; }
        public virtual DbSet<Coordinator> Coordinators { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<Syllabus> Syllabus { get; set; }
        public virtual DbSet<MarkScheme> MarkSchemes { get; set; }
    }
}