namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NullForeignKey1 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos");
            DropIndex("dbo.Lecturers", new[] { "GroupId" });
            DropIndex("dbo.Lecturers", new[] { "MemoId" });
            AlterColumn("dbo.Lecturers", "GroupId", c => c.Int());
            AlterColumn("dbo.Lecturers", "MemoId", c => c.Int());
            CreateIndex("dbo.Lecturers", "GroupId");
            CreateIndex("dbo.Lecturers", "MemoId");
            AddForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups", "GroupId");
            AddForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos");
            DropForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups");
            DropIndex("dbo.Lecturers", new[] { "MemoId" });
            DropIndex("dbo.Lecturers", new[] { "GroupId" });
            AlterColumn("dbo.Lecturers", "MemoId", c => c.Int(nullable: false));
            AlterColumn("dbo.Lecturers", "GroupId", c => c.Int(nullable: false));
            CreateIndex("dbo.Lecturers", "MemoId");
            CreateIndex("dbo.Lecturers", "GroupId");
            AddForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos", "Id", cascadeDelete: true);
            AddForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
        }
    }
}
