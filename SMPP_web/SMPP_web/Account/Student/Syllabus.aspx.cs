using SMPP_web.Models;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;

namespace SMPP_web.Account.Student
{
    public partial class Syllabus : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFiles();
        }

        protected void LoadFiles()
        {
            Document projectFile = new Document();
            DataTable dt = new DataTable();
            dt.Columns.Add("Syllabus", typeof(string));
            dt.Columns.Add("Mark Scheme", typeof(string));

            foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads/Syllabus/")))
            {
                FileInfo fi = new FileInfo(strfile);
                ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
                SMPP_web.Models.Syllabus syll = new SMPP_web.Models.Syllabus();
                syll = (from syl in scitMajor.Syllabi
                        where syl.Title == fi.Name.Substring(0, fi.Name.IndexOf("."))
                        select syl).FirstOrDefault();
                if (syll != null)
                {
                    foreach (string msFile in Directory.GetFiles(Server.MapPath("~/Uploads/MarkScheme/")))
                    {
                        FileInfo msFi = new FileInfo(msFile);
                        SMPP_web.Models.MarkScheme mScheme = new SMPP_web.Models.MarkScheme();
                        mScheme = (from sch in scitMajor.MarkSchemes
                                   from syls in scitMajor.Syllabi
                                   where sch.MarkSchemeId == syls.MarkSchemeId && msFi.Name.Substring(0, fi.Name.IndexOf(".")).Contains(sch.AcademicYear)
                                   select sch).FirstOrDefault();
                        if (mScheme != null)
                        {
                            dt.Rows.Add(fi.Name, msFi.Name);
                        }
                        else
                        {
                            Label1.Text = "Mark Scheme not found";
                        }
                    }

                }
                else
                {
                    Label1.Text = "No Syllabus found";
                }


            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SYLL")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Uploads/Syllabus/") + e.CommandArgument);
                Response.End();
            }
            else if (e.CommandName == "MS")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Uploads/MarkScheme/") + e.CommandArgument);
                Response.End();
            }
        }
    }
}