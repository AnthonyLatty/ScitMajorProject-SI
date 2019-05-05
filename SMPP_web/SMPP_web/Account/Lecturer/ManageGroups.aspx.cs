using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMPP_web.Models;

namespace SMPP_web.Account.Lecturer
{
    public partial class ManageGroups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            
            foreach (var grp in scitMajor.Groups)
            {
                if (ListBox1.Items.FindByText(grp.Name) == null)
                {
                    ListItem projGroup = new ListItem
                    {
                        Text = grp.Name,
                        Value = grp.GroupId.ToString()
                    };
                    ListBox1.Items.Add(projGroup);
                }
                


            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            Group group = new Group();

            group = (from grp in scitMajor.Groups
                     where grp.GroupId.ToString() == ListBox1.SelectedValue
                     select grp).FirstOrDefault();

            if (group.Id == Context.User.Identity.Name)
            {
                notSuperviseBtn.Visible = true;
            }
            else
            {
                superviseBtn.Visible = true;
            }

            foreach (var singleStudent in scitMajor.Students)
            {
                if (singleStudent.GroupId.ToString() == ListBox1.SelectedValue)
                {
                    ListItem groupStudent = new ListItem
                    {
                        Text = singleStudent.FirstName + " " + singleStudent.LastName + " " + singleStudent.UtechId
                    };
                    ListBox2.Items.Add(groupStudent);
                }
            }
        }

        protected void superviseBtn_Click(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            Group group = new Group();

            group = (from grp in scitMajor.Groups
                     where grp.GroupId.ToString() == ListBox1.SelectedValue
                     select grp).FirstOrDefault();
            var updatedGrp = scitMajor.Groups.Find(group.GroupId);
            updatedGrp.Id = Context.User.Identity.Name;
            scitMajor.SaveChanges();
            notSuperviseBtn.Visible = true;
            superviseBtn.Visible = false;
        }

        protected void notSuperviseBtn_Click(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            Group group = new Group();

            group = (from grp in scitMajor.Groups
                     where grp.GroupId.ToString() == ListBox1.SelectedValue
                     select grp).FirstOrDefault();
            var updatedGrp = scitMajor.Groups.Find(group.GroupId);
            updatedGrp.Id = null;
            scitMajor.SaveChanges();
            superviseBtn.Visible = true;
            notSuperviseBtn.Visible = false;
        }
    }
}