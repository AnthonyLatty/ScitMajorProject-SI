namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddNavigationPropertyToMarkScheme : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Coordinators",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        SyllabusId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Syllabus", t => t.SyllabusId, cascadeDelete: true)
                .Index(t => t.SyllabusId);
            
            CreateTable(
                "dbo.Syllabus",
                c => new
                    {
                        SyllabusId = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 30),
                        FilePath = c.String(nullable: false),
                        MarkSchemeId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.SyllabusId)
                .ForeignKey("dbo.MarkSchemes", t => t.MarkSchemeId, cascadeDelete: true)
                .Index(t => t.MarkSchemeId);
            
            CreateTable(
                "dbo.MarkSchemes",
                c => new
                    {
                        MarkSchemeId = c.Int(nullable: false, identity: true),
                        FilePath = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.MarkSchemeId);
            
            CreateTable(
                "dbo.Documents",
                c => new
                    {
                        DocumentId = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 30),
                        Date = c.DateTime(nullable: false),
                        FilePath = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.DocumentId);
            
            CreateTable(
                "dbo.Libarians",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        DocumentId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Documents", t => t.DocumentId, cascadeDelete: true)
                .Index(t => t.DocumentId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents");
            DropForeignKey("dbo.Syllabus", "MarkSchemeId", "dbo.MarkSchemes");
            DropForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus");
            DropIndex("dbo.Libarians", new[] { "DocumentId" });
            DropIndex("dbo.Syllabus", new[] { "MarkSchemeId" });
            DropIndex("dbo.Coordinators", new[] { "SyllabusId" });
            DropTable("dbo.Libarians");
            DropTable("dbo.Documents");
            DropTable("dbo.MarkSchemes");
            DropTable("dbo.Syllabus");
            DropTable("dbo.Coordinators");
        }
    }
}
