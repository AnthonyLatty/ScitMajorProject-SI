using System.Data.Entity;

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

        public DbSet<Syllabus> Syllabi { get; set; }

        public DbSet<MarkScheme> MarkSchemes { get; set; }

        public DbSet<Coordinator> Coordinators { get; set; }

        public DbSet<Document> Documents { get; set; }

        public DbSet<Libarian> Libarians { get; set; }
    }
}