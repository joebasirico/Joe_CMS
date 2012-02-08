using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TLWebsite2011.Properties;

namespace TLWebsite2011
{
	public partial class Default : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			PopulatePage(Settings.Default.NewsCountFront);

			Guid session = new Guid();
            string loginText = "";
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
            DefaultHeader.Text = SettingsIO.GetSetting("DefaultHeader");
            DefaultPreNews.Text = SettingsIO.GetSetting("DefaultPreNews");
            DefaultPostNews.Text = String.Format(SettingsIO.GetSetting("DefaultPostNews"), loginText);
		}

		private void PopulatePage(int count)
		{
			List<NewsIO> posts = NewsIO.GetRecentNews(count, false);
			DataTable dt = new DataTable();
			dt.Columns.Add("ID");
			dt.Columns.Add("Link");
			dt.Columns.Add("Title");
			dt.Columns.Add("Date");
			dt.Columns.Add("Author");
			dt.Columns.Add("Body");

			foreach (NewsIO n in posts)
			{
				DataRow r = dt.NewRow();
				string link = "NewsItem.aspx?id=" + n.ID + "&title=" + Server.UrlEncode(n.Title);
				r["ID"] = n.ID;
				r["Link"] = link;
				r["Title"] = n.Title;
				r["Date"] = n.Updated.ToShortDateString();
				r["Author"] = Auth.LookupUserName(n.UpdatedBy);
				string htmlBody = "";
				bool wasTruncated = n.GetBodyAsHTML(Settings.Default.TruncateNewsFront, out htmlBody);
				if (wasTruncated)
					r["Body"] = htmlBody + "<a href=\"" + link + "\">... read more.</a>";
				else
					r["Body"] = htmlBody + "<a href=\"" + link + "\">Link to this article.</a>";

				dt.Rows.Add(r);
			}

			NewsList.DataSource = dt;
			NewsList.DataBind();
		}
	}
}