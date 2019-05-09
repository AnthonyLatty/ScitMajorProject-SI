using SMPP_web.Models;
using System;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.IO;
using System.Web.UI;

namespace SMPP_web.Account.Coordinator
{
    public partial class UploadMarkScheme : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnUploadMarkScheme_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Uploads/MarkScheme/");
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }


            if (MarkSchemeFileUpload.HasFile)
            {
                MarkSchemeFileUpload.PostedFile.SaveAs(folderPath + TitleTxtbx.Text + Path.GetExtension(MarkSchemeFileUpload.PostedFile.FileName));
                MarkScheme uploadingMarkscheme = new MarkScheme
                {
                    AcademicYear = TitleTxtbx.Text,
                    FilePath = Request.PhysicalApplicationPath + "Uploads\\"
                };

                ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                try
                {
                    dbContext.MarkSchemes.Add(uploadingMarkscheme);
                    dbContext.SaveChanges();
                    txtSuccess.Text = "Yay!! MarkScheme uploaded successfully.";
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