using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SMPP_web.Models;

namespace SMPP_web.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Create role
            var roleStore = new RoleStore<IdentityRole>();
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            if (!roleManager.RoleExists("Student"))
            {
                roleManager.Create(new IdentityRole("Student"));
            }


            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            // Assign user to role
            if (!manager.IsInRole(manager.FindByEmail(user.Email).Id, "Student"))
            {
                manager.AddToRole(manager.FindByEmail(user.Email).Id, "Student");
            }

            if (result.Succeeded)
            {
                Student registeringStudent = new Student
                {
                    StudentId = Email.Text,
                    IDNumber = txtIDNumber.Text,
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    Address = txtAddress.Text,
                    Faculty = ddlFaculty.SelectedItem.Text
                };
                var scitMajorProjectModelContainer = new ScitMajorProjectModelContainer();
                scitMajorProjectModelContainer.Students.Add(registeringStudent);
                scitMajorProjectModelContainer.SaveChanges();

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}