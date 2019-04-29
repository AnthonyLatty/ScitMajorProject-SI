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

namespace SMPP_web.Account.Admin
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterLibrarianBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var roleStore = new RoleStore<IdentityRole>();
                var roleManager = new RoleManager<IdentityRole>(roleStore);
                if (!roleManager.RoleExists("Librarian"))
                {
                    roleManager.Create(new IdentityRole("Librarian"));
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = EmailLibTxtbx.Text, Email = EmailLibTxtbx.Text };
                IdentityResult result = manager.Create(user, "Aa?123456");
                // Assign user to role
                if (!manager.IsInRole(manager.FindByEmail(user.Email).Id, "Librarian"))
                {
                    manager.AddToRole(manager.FindByEmail(user.Email).Id, "Librarian");
                }

                if (result.Succeeded)
                {
                    Libarian registeringLibrarian = new Libarian
                    {
                        Id = EmailLibTxtbx.Text,
                        FirstName = FirstNameLibTxtbx.Text,
                        LastName = LastNameLibTxtbx.Text
                    };

                    ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                    try
                    {
                        dbContext.Libarians.Add(registeringLibrarian);
                        dbContext.SaveChanges();
                        ClearLibarianResults();
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
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
        }

        private void ClearLibarianResults()
        {
            EmailLibTxtbx.Text = string.Empty;
            FirstNameLibTxtbx.Text = string.Empty;
            LastNameLibTxtbx.Text = string.Empty;
        }

        protected void RegisterLecturerBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var roleStore = new RoleStore<IdentityRole>();
                var roleManager = new RoleManager<IdentityRole>(roleStore);
                if (!roleManager.RoleExists("Lecturer"))
                {
                    roleManager.Create(new IdentityRole("Lecturer"));
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = EmailLecTxtbx.Text, Email = EmailLecTxtbx.Text };
                IdentityResult result = manager.Create(user, "Aa?123456");
                // Assign user to role
                if (!manager.IsInRole(manager.FindByEmail(user.Email).Id, "Lecturer"))
                {
                    manager.AddToRole(manager.FindByEmail(user.Email).Id, "Lecturer");
                }

                if (result.Succeeded)
                {
                    Lecturer registeringLecturer = new Lecturer
                    {
                        Id = EmailLecTxtbx.Text,
                        FirstName = FirstNameLectTxtbx.Text,
                        LastName = LastNameLectTxtbx.Text,
                        Faculty = ddlFaculty.SelectedItem.Text,
                        Office = OfficeLectTextbx.Text,
                        Extension = OfficeExtLectTextbx.Text
                    };

                    ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                    try
                    {
                        dbContext.Lecturers.Add(registeringLecturer);
                        dbContext.SaveChanges();
                        ClearLecturerResults();
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
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
        }

        private void ClearLecturerResults()
        {
            EmailLecTxtbx.Text = string.Empty;
            FirstNameLectTxtbx.Text = string.Empty;
            LastNameLectTxtbx.Text = string.Empty;
            ddlFaculty.SelectedItem.Text = string.Empty;
            OfficeLectTextbx.Text = string.Empty;
            OfficeExtLectTextbx.Text = string.Empty;
        }

        protected void RegisterCoorBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var roleStore = new RoleStore<IdentityRole>();
                var roleManager = new RoleManager<IdentityRole>(roleStore);
                if (!roleManager.RoleExists("Coordinator"))
                {
                    roleManager.Create(new IdentityRole("Coordinator"));
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = EmailCoordTxtbx.Text, Email = EmailCoordTxtbx.Text };
                IdentityResult result = manager.Create(user, "Aa?123456");
                // Assign user to role
                if (!manager.IsInRole(manager.FindByEmail(user.Email).Id, "Coordinator"))
                {
                    manager.AddToRole(manager.FindByEmail(user.Email).Id, "Coordinator");
                }

                if (result.Succeeded)
                {
                    Models.Coordinator registeringCoordinator = new Models.Coordinator
                    {
                        Id = EmailCoordTxtbx.Text,
                        FirstName = FirstNameCoorTxtbx.Text,
                        LastName = LastNameCoorTxtbx.Text
                    };

                    ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                    try
                    {
                        dbContext.Coordinators.Add(registeringCoordinator);
                        dbContext.SaveChanges();
                        ClearCoordinatorResults();
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

                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
        }

        private void ClearCoordinatorResults()
        {
            EmailCoordTxtbx.Text = string.Empty;
            FirstNameCoorTxtbx.Text = string.Empty;
            LastNameCoorTxtbx.Text = string.Empty;
        }
    }

}
