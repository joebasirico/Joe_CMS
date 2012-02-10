using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
	public partial class Show : System.Web.UI.Page
	{
		PageIO page = null;
		DateTime version = new DateTime();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString.Keys.Count > 0
				&& !string.IsNullOrEmpty(Request.QueryString["page"]))
			{
				string pageName = Request.QueryString["page"];
				if (DateTime.TryParse(Request.QueryString["version"], out version))
					page = new PageIO(pageName, version);
				else
					page = new PageIO(pageName);

				Guid session = new Guid();
				if (-1 != page.ID)
				{
					PopulatePage(page);
				}
				else if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
				{
					int userID = Auth.checkSession(session);
					if (userID != 0)
					{
						Response.Redirect("Edit.aspx?page=" + Server.UrlEncode(pageName));
					}
					else
						Response.Redirect("Default.aspx");
				}
				else
					Response.Redirect("404.aspx");
			}
			else
				Response.Redirect("Default.aspx");

            bool addSocial = false;
            bool.TryParse(SettingsIO.GetSetting("AddSocialLinks"), out addSocial);
            if (addSocial)
                SocialLinks.Text = String.Format(SettingsIO.GetSetting("SocialHTMLCode"), Request.Url);
		}

		private void PopulatePage(PageIO page)
		{
			TitleLabel.Text = page.Title;
            Page.Title = page.Title;
			SubTitleLabel.Text = page.SubTitle;
			BodyLiteral.Text = page.GetBodyAsHTML();
			UpdatedLabel.Text = page.Updated.ToShortDateString();
			UserLabel.Text = Auth.LookupUserName(page.UpdatedBy);

			Guid session = new Guid();
			if (Request.Cookies["session"] != null && !string.IsNullOrEmpty(Request.Cookies["session"].Value) && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				string username = Auth.LookupUserName(userID);
				if (!string.IsNullOrEmpty(username))
				{
					if (version != new DateTime())
					{
						Revert.Visible = true;
						HistoryText.Visible = true;
						HistoryText.Text = "<a href=\"History.aspx?page=" + page.URLTitle + "\">See Previous Versions</a>";
					}
					else
					{
						EditText.Visible = true;
						EditText.Text = "<a href=\"Edit.aspx?page=" + page.URLTitle + "\">Edit this page</a>";
						HistoryText.Visible = true;
						HistoryText.Text = "<a href=\"History.aspx?page=" + page.URLTitle + "\">See Previous Versions</a>";

					}
				}
			}
		}

		protected void Revert_Click(object sender, EventArgs e)
		{
			page.SavePage();
			Response.Redirect("Show.aspx?page=" + page.URLTitle);
		}
	}
}