using SMPP_web.Models;
using System;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.IO;
using System.Web.UI;

namespace SMPP_web.Account.Coordinator
{
    public partial class UploadSyllabus : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Gets current date and populates Date textbox
            txtDate.Text = DateTime.Now.ToShortDateString();
        }

        protected void BtnUploadSyllabus_Click(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Uploads/Syllabus/");
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }


            if (SyllabusFileUpload.HasFile)
            {
                SyllabusFileUpload.PostedFile.SaveAs(folderPath + txtTitle.Text + Path.GetExtension(SyllabusFileUpload.PostedFile.FileName));
                Syllabus uploadingSyllabus = new Syllabus
                {
                    Title = txtTitle.Text,
                    FilePath = Request.PhysicalApplicationPath + "Uploads\\",
                    MarkSchemeId = Convert.ToInt16(ddlMarkScheme.SelectedItem.Text)
                };

                ScitMajorProjectDbContext dbContext = new ScitMajorProjectDbContext();
                try
                {
                    dbContext.Syllabi.Add(uploadingSyllabus);
                    dbContext.SaveChanges();
                    txtSuccess.Text = "Yay!! Syllabus uploaded successfully.";
                    CleartResults();
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

        private void CleartResults()
        {
            txtTitle.Text = string.Empty;
        }
    }
}