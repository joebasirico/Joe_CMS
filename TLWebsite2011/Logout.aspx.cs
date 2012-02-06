<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TLWebsite2011
{
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				Guid session = new Guid();

				if (Guid.TryParse(Request.Cookies["session"].Value, out session))
					Auth.destroySession(session);
			}
			catch
			{
			}
			Response.Cookies["session"].Value = "";
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
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				Guid session = new Guid();

				if (Guid.TryParse(Request.Cookies["session"].Value, out session))
					Auth.destroySession(session);
			}
			catch
			{
			}
			Response.Cookies["session"].Value = "";
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}