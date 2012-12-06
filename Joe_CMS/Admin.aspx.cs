using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class Admin : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (0 < userID)
            {
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);
        }
    }
}