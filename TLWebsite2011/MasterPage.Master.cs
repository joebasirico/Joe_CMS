<<<<<<< HEAD
﻿using System;
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
			if (Request.Cookies["session"] != null && !string.IsNullOrEmpty(Request.Cookies["session"].Value) && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				string username = Auth.LookupUserName(userID);
				if (!string.IsNullOrEmpty(username))
				{
					loginlogout.Text = "You are currently logged in as: " + username + " <a href=\"/Logout.aspx\">click here to logout</a>";
				}
				else
				{
					loginlogout.Text = "<a href=\"/Login.aspx\">Login</a>";
				}
			}
			else
			{
				loginlogout.Text = "<a href=\"/Login.aspx\">Login</a>";
			}
		}
	}
=======
﻿using System;
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
			if (Request.Cookies["session"] != null && !string.IsNullOrEmpty(Request.Cookies["session"].Value) && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				string username = Auth.LookupUserName(userID);
				if (!string.IsNullOrEmpty(username))
				{
					loginlogout.Text = "You are currently logged in as: " + username + " <a href=\"/Logout.aspx\">click here to logout</a>";
				}
				else
				{
					loginlogout.Text = "<a href=\"/Login.aspx\">Login</a>";
				}
			}
			else
			{
				loginlogout.Text = "<a href=\"/Login.aspx\">Login</a>";
			}
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}