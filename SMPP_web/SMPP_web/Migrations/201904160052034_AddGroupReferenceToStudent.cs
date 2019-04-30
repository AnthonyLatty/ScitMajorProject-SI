namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddGroupReferenceToStudent : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Students", "Group_GroupId", "dbo.Groups");
            DropIndex("dbo.Students", new[] { "Group_GroupId" });
            RenameColumn(table: "dbo.Students", name: "Group_GroupId", newName: "GroupId");
            AlterColumn("dbo.Students", "GroupId", c => c.Int(nullable: false));
            CreateIndex("dbo.Students", "GroupId");
            AddForeignKey("dbo.Students", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Students", "GroupId", "dbo.Groups");
            DropIndex("dbo.Students", new[] { "GroupId" });
            AlterColumn("dbo.Students", "GroupId", c => c.Int());
            RenameColumn(table: "dbo.Students", name: "GroupId", newName: "Group_GroupId");
            CreateIndex("dbo.Students", "Group_GroupId");
            AddForeignKey("dbo.Students", "Group_GroupId", "dbo.Groups", "GroupId");
        }
    }
}
