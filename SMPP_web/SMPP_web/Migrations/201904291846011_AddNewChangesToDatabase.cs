namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddNewChangesToDatabase : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Students", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus");
            DropForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents");
            DropForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos");
            DropIndex("dbo.Coordinators", new[] { "SyllabusId" });
            DropIndex("dbo.Libarians", new[] { "DocumentId" });
            DropIndex("dbo.Lecturers", new[] { "GroupId" });
            DropIndex("dbo.Lecturers", new[] { "MemoId" });
            DropIndex("dbo.Students", new[] { "GroupId" });
            AddColumn("dbo.Groups", "Group_GroupId", c => c.Int());
            AddColumn("dbo.Groups", "Memo_Id", c => c.Int());
            AlterColumn("dbo.Coordinators", "SyllabusId", c => c.Int());
            AlterColumn("dbo.Libarians", "DocumentId", c => c.Int());
            AlterColumn("dbo.Lecturers", "GroupId", c => c.Int());
            AlterColumn("dbo.Lecturers", "MemoId", c => c.Int());
            CreateIndex("dbo.Coordinators", "SyllabusId");
            CreateIndex("dbo.Libarians", "DocumentId");
            CreateIndex("dbo.Groups", "Group_GroupId");
            CreateIndex("dbo.Groups", "Memo_Id");
            CreateIndex("dbo.Lecturers", "GroupId");
            CreateIndex("dbo.Lecturers", "MemoId");
            AddForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups", "GroupId");
            AddForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos", "Id");
            AddForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus", "SyllabusId");
            AddForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents", "DocumentId");
            AddForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups", "GroupId");
            AddForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos", "Id");
            DropColumn("dbo.Students", "GroupId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Students", "GroupId", c => c.Int(nullable: false));
            DropForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos");
            DropForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents");
            DropForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus");
            DropForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos");
            DropForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups");
            DropIndex("dbo.Lecturers", new[] { "MemoId" });
            DropIndex("dbo.Lecturers", new[] { "GroupId" });
            DropIndex("dbo.Groups", new[] { "Memo_Id" });
            DropIndex("dbo.Groups", new[] { "Group_GroupId" });
            DropIndex("dbo.Libarians", new[] { "DocumentId" });
            DropIndex("dbo.Coordinators", new[] { "SyllabusId" });
            AlterColumn("dbo.Lecturers", "MemoId", c => c.Int(nullable: false));
            AlterColumn("dbo.Lecturers", "GroupId", c => c.Int(nullable: false));
            AlterColumn("dbo.Libarians", "DocumentId", c => c.Int(nullable: false));
            AlterColumn("dbo.Coordinators", "SyllabusId", c => c.Int(nullable: false));
            DropColumn("dbo.Groups", "Memo_Id");
            DropColumn("dbo.Groups", "Group_GroupId");
            CreateIndex("dbo.Students", "GroupId");
            CreateIndex("dbo.Lecturers", "MemoId");
            CreateIndex("dbo.Lecturers", "GroupId");
            CreateIndex("dbo.Libarians", "DocumentId");
            CreateIndex("dbo.Coordinators", "SyllabusId");
            AddForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos", "Id", cascadeDelete: true);
            AddForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
            AddForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents", "DocumentId", cascadeDelete: true);
            AddForeignKey("dbo.Coordinators", "SyllabusId", "dbo.Syllabus", "SyllabusId", cascadeDelete: true);
            AddForeignKey("dbo.Students", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
        }
    }
}
