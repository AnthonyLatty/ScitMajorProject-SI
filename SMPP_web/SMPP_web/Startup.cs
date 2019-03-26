using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using SMPP_web.Models;

[assembly: OwinStartupAttribute(typeof(SMPP_web.Startup))]
namespace SMPP_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            SeedAdmin();
        }

        private void SeedAdmin()
        {
            var context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            if (!roleManager.RoleExists("Coordinator"))
            {
                //Create admin role
                var CoordinatorRole = new IdentityRole
                {
                    Name = "Coordinator"
                };

                roleManager.Create(CoordinatorRole);

                // Create admin user
                var CoordinatorUser = new ApplicationUser
                {
                    UserName = "Coordinator@utechja.com",
                    Email = "Coordinator@utechja.com"
                };

                // Use random string for password
                string password = "KsemwQf765UO";

                // Create admin user with password
                var result = UserManager.Create(CoordinatorUser, password);

                // Add user to role
                UserManager.AddToRole(CoordinatorUser.Id, CoordinatorRole.Name);
            }
        }
    }
}
