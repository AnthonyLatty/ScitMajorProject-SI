namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveUnusedPropertyInGroup : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups");
            DropIndex("dbo.Groups", new[] { "Group_GroupId" });
            AddColumn("dbo.Students", "GroupId", c => c.Int(nullable: false));
            CreateIndex("dbo.Students", "GroupId");
            AddForeignKey("dbo.Students", "GroupId", "dbo.Groups", "GroupId", cascadeDelete: true);
            DropColumn("dbo.Groups", "Group_GroupId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Groups", "Group_GroupId", c => c.Int());
            DropForeignKey("dbo.Students", "GroupId", "dbo.Groups");
            DropIndex("dbo.Students", new[] { "GroupId" });
            DropColumn("dbo.Students", "GroupId");
            CreateIndex("dbo.Groups", "Group_GroupId");
            AddForeignKey("dbo.Groups", "Group_GroupId", "dbo.Groups", "GroupId");
        }
    }
}
