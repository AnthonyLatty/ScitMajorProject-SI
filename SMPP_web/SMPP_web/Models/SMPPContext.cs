using System.Data.Entity;

namespace SMPP_web.Models
{
    public class SMPPContext : DbContext
    {
        public SMPPContext() : base("name=SMPPContext")
        {
        }

        public DbSet<Libarian> Libarians { get; set; }

        public DbSet<Lecturer> Lecturers { get; set; }

        public DbSet<Student> Students { get; set; }

        public DbSet<Coordinator> Coordinators { get; set; }

        public DbSet<Faculty> Faculties { get; set; }

        public DbSet<Memo> Memos { get; set; }

        public DbSet<Project> Projects { get; set; }
    }
}