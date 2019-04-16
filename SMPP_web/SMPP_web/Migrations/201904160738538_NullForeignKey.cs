namespace SMPP_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NullForeignKey : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents");
            DropIndex("dbo.Libarians", new[] { "DocumentId" });
            AlterColumn("dbo.Libarians", "DocumentId", c => c.Int());
            CreateIndex("dbo.Libarians", "DocumentId");
            AddForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents", "DocumentId");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents");
            DropIndex("dbo.Libarians", new[] { "DocumentId" });
            AlterColumn("dbo.Libarians", "DocumentId", c => c.Int(nullable: false));
            CreateIndex("dbo.Libarians", "DocumentId");
            AddForeignKey("dbo.Libarians", "DocumentId", "dbo.Documents", "DocumentId", cascadeDelete: true);
        }
    }
}
