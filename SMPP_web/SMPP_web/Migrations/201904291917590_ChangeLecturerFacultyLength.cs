namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeLecturerFacultyLength : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Lecturers", "Faculty", c => c.String(nullable: false, maxLength: 100));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Lecturers", "Faculty", c => c.String(nullable: false, maxLength: 30));
        }
    }
}
