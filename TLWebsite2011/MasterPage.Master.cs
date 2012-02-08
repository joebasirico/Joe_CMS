using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TLWebsite2011
{
	public partial class MasterPage : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
            String loginText = "";
			if (Request.Cookies["session"] != null && !string.IsNullOrEmpty(Request.Cookies["session"].Value) && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				string username = Auth.LookupUserName(userID);
				if (!string.IsNullOrEmpty(username))
				{
                    loginText = "You are currently logged in as: " + username + " <a href=\"/Logout.aspx\">click here to logout</a>";
				}
				else
				{
                    loginText = "<a href=\"/Login.aspx\">Login</a>";
				}
			}
			else
			{
                loginText = "<a href=\"/Login.aspx\">Login</a>";
			}

            MasterHeader.Text = "";
            MasterStyleSheet.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\" />", "");
            MasterPreBody.Text = "";
            MasterPostBody.Text = String.Format("", loginText);
        }
	}
}