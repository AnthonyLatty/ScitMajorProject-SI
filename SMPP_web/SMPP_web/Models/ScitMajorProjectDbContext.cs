using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SMPP_web.Models
{
    public class ScitMajorProjectDbContext : DbContext
    {
        public ScitMajorProjectDbContext() : base("name=ScitMajorProjectDbContext")
        {
            Database.SetInitializer<ScitMajorProjectDbContext>(new CreateDatabaseIfNotExists<ScitMajorProjectDbContext>());
        }

        public DbSet<Student> Students { get; set; }

        public DbSet<Lecturer> Lecturers { get; set; }

        public DbSet<Group> Groups { get; set; }

        public DbSet<Project> Projects { get; set; }

        public DbSet<Memo> Memos { get; set; }
    }
}