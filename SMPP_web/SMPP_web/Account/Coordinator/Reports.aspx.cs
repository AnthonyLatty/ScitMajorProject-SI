using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMPP_web.Models;

namespace SMPP_web.Account.Coordinator
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LecturerStats();
            GradeStats();
            GroupSupervisors();
        }

        protected void LecturerStats()
        {
            DataTable dt = new DataTable();
            
            dt.Columns.Add("Lecturer Name", typeof(string));
            dt.Columns.Add("Meeting Count", typeof(int));
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            int meetingCount = 0;
            foreach (SMPP_web.Models.Lecturer lec in scitMajor.Lecturers)
            {
                meetingCount = (from memo in scitMajor.Memos
                                where memo.LecId == lec.Id
                                select memo).Count();
                dt.Rows.Add(lec.FirstName + " " + lec.LastName, meetingCount);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GradeStats()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Group Name", typeof(string));
            dt.Columns.Add("Grade", typeof(decimal));
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            
            foreach (SMPP_web.Models.Group grp in scitMajor.Groups)
            {
                
                dt.Rows.Add(grp.Name, grp.Grade);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void GroupSupervisors()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Group Name", typeof(string));
            dt.Columns.Add("Supervisor", typeof(string));
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();

            foreach (SMPP_web.Models.Group grp in scitMajor.Groups)
            {
                SMPP_web.Models.Lecturer lecturer = (from lec in scitMajor.Lecturers
                                                     where lec.Id == grp.Id
                                                     select lec).FirstOrDefault();

                dt.Rows.Add(grp.Name, lecturer.FirstName + " " + lecturer.LastName);
            }
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

    }
}