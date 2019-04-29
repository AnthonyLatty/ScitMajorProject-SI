using System;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.IO;
using System.Web.UI;
using SMPP_web.Models;

namespace SMPP_web.Account.Librarian
{
    public partial class LibrarianDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTxtbx.Text = DateTime.Today.ToString().Substring(0, 10);
        }

        protected void UploadBtn_Click(object sender, EventArgs e)
        {
            if (ProjectFileUpload.HasFile)
            {
                ProjectFileUpload.PostedFile.SaveAs(Request.PhysicalApplicationPath + "Uploads\\" + TitleTxtbx.Text + Path.GetExtension(ProjectFileUpload.PostedFile.FileName));
                Document uploadingDocument = new Document
                {
                    Date = DateTime.Today,
                    Title = TitleTxtbx.Text,
                    FilePath = Request.PhysicalApplicationPath + "Uploads\\"
                };

                ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                try
                {
                    dbContext.Documents.Add(uploadingDocument);
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
            }
        }
    }
}