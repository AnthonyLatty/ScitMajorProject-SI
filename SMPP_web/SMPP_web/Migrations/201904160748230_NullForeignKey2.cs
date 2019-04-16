namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NullForeignKey2 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus");
            DropIndex("dbo.Coordinators", new[] { "SyllabusId" });
            AlterColumn("dbo.Coordinators", "SyllabusId", c => c.Int());
            CreateIndex("dbo.Coordinators", "SyllabusId");
            AddForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus", "SyllabusId");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus");
            DropIndex("dbo.Coordinators", new[] { "SyllabusId" });
            AlterColumn("dbo.Coordinators", "SyllabusId", c => c.Int(nullable: false));
            CreateIndex("dbo.Coordinators", "SyllabusId");
            AddForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus", "SyllabusId", cascadeDelete: true);
        }
    }
}
