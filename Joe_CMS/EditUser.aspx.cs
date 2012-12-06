using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class EditUser : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (0 < userID)
            {
                //if a userID is provided on the URL populate with that, 
                //otherwise use the userID of the logged in user
                int editUserID = -1;
                if (Request.QueryString.Keys.Count > 0
                    && !string.IsNullOrEmpty(Request.QueryString["id"])
                    && int.TryParse(Request.QueryString["id"], out editUserID))
                {
                    populateUser(editUserID);
                }
                else
                    populateUser(userID);
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);
        }

        private void populateUser(int userID)
        {
        }
    }
}