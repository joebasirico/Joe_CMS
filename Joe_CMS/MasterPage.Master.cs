using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
	public partial class MasterPage : System.Web.UI.MasterPage
	{
        string template = "System_Master";
        string header = "System_Master_Header";
        string contentPlaceHolder = "&&SYSTEM_CONTENT&&";
        string loginPlaceHolder = "&&SYSTEM_LOGIN&&";

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

            //Header
            PageIO headerPage = new PageIO(header);
            MasterHeader.Text = headerPage.GetBodyAsHTML();

            //General Template
            PageIO page = new PageIO(template);
            if (-1 != page.ID && !string.IsNullOrWhiteSpace(page.Body))
            {
                string pageContent = page.GetBodyAsHTML();

                //if we can't find it unencoded try encoding is and try again
                if (pageContent.IndexOf(Server.HtmlEncode(loginPlaceHolder)) > -1)
                    loginPlaceHolder = Server.HtmlEncode(loginPlaceHolder);
                if (pageContent.IndexOf(loginPlaceHolder) > -1)
                    pageContent = pageContent.Replace(loginPlaceHolder, loginText);

                if (pageContent.IndexOf(Server.HtmlEncode(contentPlaceHolder)) > -1)
                    contentPlaceHolder = Server.HtmlEncode(contentPlaceHolder);
                if (pageContent.IndexOf(contentPlaceHolder) > -1)
                {
                    MasterPreBody.Text = pageContent.Substring(0, pageContent.IndexOf(contentPlaceHolder));
                    string postContent = pageContent.Substring(pageContent.IndexOf(contentPlaceHolder) + contentPlaceHolder.Length);
                    MasterPostBody.Text = postContent;
                }
                else
                {
                    MasterPreBody.Text = pageContent;
                    MasterPostBody.Text = "";
                }
            }
        }
	}
}