using SMPP_web.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMPP_web.Account.Lecturer
{
    public partial class Memo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();

            foreach (var grp in scitMajor.Groups)
            {
                if (ListBox1.Items.FindByText(grp.Name) == null)
                {
                    if (grp.Id == Context.User.Identity.Name)
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
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            ScitMajorProjectDbContext scitMajor = new ScitMajorProjectDbContext();
            
            SMPP_web.Models.Memo memo = new SMPP_web.Models.Memo
            {
                Date = DateTime.Today,
                Description = MemoTxtBx.Text,
                GroupId = Convert.ToInt16(ListBox1.SelectedItem.Value),
                LecId = Context.User.Identity.Name
            };

            try
            {
                scitMajor.Memos.Add(memo);
                scitMajor.SaveChanges();
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