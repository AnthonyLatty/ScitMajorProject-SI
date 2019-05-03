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
            Document projectFile = new Document();
            DataTable dt = new DataTable();
            dt.Columns.Add("Title", typeof(string));
            dt.Columns.Add("Date", typeof(string));

            foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Uploads")))
            {
                FileInfo fi = new FileInfo(strfile);
                ScitMajorProjectDbContext db = new ScitMajorProjectDbContext();
                projectFile = (from proj in db.Documents
                               where proj.Title == fi.Name.Substring(0, fi.Name.IndexOf("."))
                               select proj).FirstOrDefault();
                if (projectFile != null)
                {
                    dt.Rows.Add(fi.Name, projectFile.Date.ToString().Substring(0, projectFile.Date.ToString().IndexOf(" ")));
                }
                

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        
    }
}