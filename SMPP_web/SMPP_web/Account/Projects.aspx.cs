using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMPP_web.Models;

namespace SMPP_web.Account
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadFiles();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Uploads/Librarian/") + e.CommandArgument);
                Response.End();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            Document projectFile = new Document();
            DataTable dt = new DataTable();
            dt.Columns.Add("Title", typeof(string));
            dt.Columns.Add("Date", typeof(string));
            int foundFlag = 0;
            foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads/Librarian")))
            {
                FileInfo fi = new FileInfo(strfile);
                if (fi.Name.Contains(SearchTxtbx.Text))
                {
                    ScitMajorProjectDbContext db = new ScitMajorProjectDbContext();
                    projectFile = (from proj in db.Documents
                                   where proj.Title == fi.Name.Substring(0, fi.Name.IndexOf("."))
                                   select proj).FirstOrDefault();
                    if (projectFile != null)
                    {

                        dt.Rows.Add(fi.Name, projectFile.Date.ToString().Substring(0, projectFile.Date.ToString().IndexOf(" ")));
                        foundFlag++;
                    }
                    else
                    {
                        Label1.Text = "No projects found";
                    }
                }

            }
            if (foundFlag == 0)
            {
                Label1.Text = foundFlag + " results found!";
            }
            else
            {
                Label1.Text = foundFlag + " results found!";
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void LoadFiles()
        {
            Document projectFile = new Document();
            DataTable dt = new DataTable();
            dt.Columns.Add("Title", typeof(string));
            dt.Columns.Add("Date", typeof(string));

            foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads/Librarian")))
            {
                FileInfo fi = new FileInfo(strfile);
                ScitMajorProjectDbContext db = new ScitMajorProjectDbContext();

                projectFile = (from proj in db.Documents
                               where proj.Title == fi.Name.Substring(0, fi.Name.IndexOf("."))
                               select proj).FirstOrDefault();
                if (projectFile != null)
                {
                    Label1.Text = "Adding stuff";
                    dt.Rows.Add(fi.Name, projectFile.Date.ToString().Substring(0, projectFile.Date.ToString().IndexOf(" ")));
                }
                else
                {
                    Label1.Text = "No projects found";
                }


            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void ViewAll_Click(object sender, EventArgs e)
        {
            LoadFiles();
        }
    }
}