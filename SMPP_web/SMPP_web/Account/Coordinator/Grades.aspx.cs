using SMPP_web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMPP_web.Account.Coordinator
{
    public partial class Grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGroups();
        }

        protected void LoadGroups()
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

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            var updatedGrp = scitMajor.Groups.Find(Convert.ToInt16(ListBox1.SelectedItem.Value));
            updatedGrp.Grade = Convert.ToDecimal(GradeTxtbx.Text);
            scitMajor.SaveChanges();
        }
    }
}