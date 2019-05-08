namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateModel : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups");
            DropForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos");
            DropForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos");
            DropIndex("dbo.Groups", new[] { "Group_GroupId" });
            DropIndex("dbo.Groups", new[] { "Memo_Id" });
            DropIndex("dbo.Lecturers", new[] { "GroupId" });
            DropIndex("dbo.Lecturers", new[] { "MemoId" });
            AddColumn("dbo.Groups", "Grade", c => c.Decimal(precision: 18, scale: 2));
            AddColumn("dbo.Groups", "Id", c => c.String(maxLength: 128));
            AddColumn("dbo.Memos", "LecId", c => c.String(maxLength: 128));
            AddColumn("dbo.Memos", "GroupId", c => c.Int(nullable: false));
            AddColumn("dbo.Students", "GroupId", c => c.Int(nullable: false));
            CreateIndex("dbo.Groups", "Id");
            CreateIndex("dbo.Memos", "LecId");
            CreateIndex("dbo.Memos", "GroupId");
            CreateIndex("dbo.Students", "GroupId");
            AddForeignKey("dbo.Groups", "Id", "dbo.Lecturers", "Id");
            AddForeignKey("dbo.Memos", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
            AddForeignKey("dbo.Memos", "LecId", "dbo.Lecturers", "Id");
            AddForeignKey("dbo.Students", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
            DropColumn("dbo.Groups", "Group_GroupId");
            DropColumn("dbo.Groups", "Memo_Id");
            DropColumn("dbo.Lecturers", "GroupId");
            DropColumn("dbo.Lecturers", "MemoId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Lecturers", "MemoId", c => c.Int());
            AddColumn("dbo.Lecturers", "GroupId", c => c.Int());
            AddColumn("dbo.Groups", "Memo_Id", c => c.Int());
            AddColumn("dbo.Groups", "Group_GroupId", c => c.Int());
            DropForeignKey("dbo.Students", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Memos", "LecId", "dbo.Lecturers");
            DropForeignKey("dbo.Memos", "GroupId", "dbo.Groups");
            DropForeignKey("dbo.Groups", "Id", "dbo.Lecturers");
            DropIndex("dbo.Students", new[] { "GroupId" });
            DropIndex("dbo.Memos", new[] { "GroupId" });
            DropIndex("dbo.Memos", new[] { "LecId" });
            DropIndex("dbo.Groups", new[] { "Id" });
            DropColumn("dbo.Students", "GroupId");
            DropColumn("dbo.Memos", "GroupId");
            DropColumn("dbo.Memos", "LecId");
            DropColumn("dbo.Groups", "Id");
            DropColumn("dbo.Groups", "Grade");
            CreateIndex("dbo.Lecturers", "MemoId");
            CreateIndex("dbo.Lecturers", "GroupId");
            CreateIndex("dbo.Groups", "Memo_Id");
            CreateIndex("dbo.Groups", "Group_GroupId");
            AddForeignKey("dbo.Lecturers", "MemoId", "dbo.Memos", "Id");
            AddForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos", "Id");
            AddForeignKey("dbo.Lecturers", "GroupId", "dbo.Groups", "GroupId");
            AddForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups", "GroupId");
        }
    }
}
