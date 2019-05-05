using System;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
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
                Models.Student registeringStudent = new Models.Student
                {
                    Id = Email.Text,
                    UtechId = txtIDNumber.Text,
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    Address = txtAddress.Text,
                    Faculty = ddlFaculty.SelectedItem.Text
                };
                ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();

                Group studentGroup = new Group();
                int grpCount = (from grp in scitMajor.Groups
                                where grp.Name == txtGroupName.Text
                                select grp).Count();
                
                switch (grpCount)
                {
                    case 0:
                        studentGroup.Name = txtGroupName.Text;
                        break;
                    case 1:
                        registeringStudent.GroupId = (from grp in scitMajor.Groups
                                     where grp.Name == txtGroupName.Text
                                     select grp.GroupId).First();
                        break;
                    default:
                        break;
                }


                ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                try
                {
                    switch (grpCount)
                    {
                        case 0:
                            dbContext.Students.Add(registeringStudent);
                            dbContext.Groups.Add(studentGroup);
                            break;
                        case 1:
                            dbContext.Students.Add(registeringStudent);
                            break;
                        default:
                            break;
                    }
                    
                    dbContext.SaveChanges();
                }
                catch (DbEntityValidationException x)
                {
                    foreach (var eve in x.EntityValidationErrors)
                    {
                        Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:", eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }

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