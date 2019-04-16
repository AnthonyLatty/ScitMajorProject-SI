namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveGroupPropertyFromStudent : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos");
            DropForeignKey("dbo.Students", "GroupId", "dbo.Groups");
            DropIndex("dbo.Groups", new[] { "Memo_Id" });
            DropIndex("dbo.Students", new[] { "GroupId" });
            RenameColumn(table: "dbo.Students", name: "GroupId", newName: "Group_GroupId");
            AlterColumn("dbo.Students", "Group_GroupId", c => c.Int());
            CreateIndex("dbo.Students", "Group_GroupId");
            AddForeignKey("dbo.Students", "Group_GroupId", "dbo.Groups", "GroupId");
            DropColumn("dbo.Groups", "Memo_Id");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Groups", "Memo_Id", c => c.Int());
            DropForeignKey("dbo.Students", "Group_GroupId", "dbo.Groups");
            DropIndex("dbo.Students", new[] { "Group_GroupId" });
            AlterColumn("dbo.Students", "Group_GroupId", c => c.Int(nullable: false));
            RenameColumn(table: "dbo.Students", name: "Group_GroupId", newName: "GroupId");
            CreateIndex("dbo.Students", "GroupId");
            CreateIndex("dbo.Groups", "Memo_Id");
            AddForeignKey("dbo.Students", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
            AddForeignKey("dbo.Groups", "Memo_Id", "dbo.Memos", "Id");
        }
    }
}
