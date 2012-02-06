using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLWebsite2011.Properties;

namespace TLWebsite2011
{
	public partial class NewsItem : System.Web.UI.Page
	{
		NewsIO news;
		protected void Page_Load(object sender, EventArgs e)
		{
			int newsID = -1;
			if (Request.QueryString.Keys.Count > 0
				&& !string.IsNullOrEmpty(Request.QueryString["id"])
				&& int.TryParse(Request.QueryString["id"], out newsID))
			{
				news = new NewsIO(newsID);
				if (-1 != news.ID)
				{
					PopulatePage(news);

					Guid session = new Guid();
					if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
					{
						int userID = Auth.checkSession(session);
						if (userID != 0)
						{
							DeleteNews.Visible = true;
							EditText.Visible = true;
							EditText.Text = "<a href=\"EditNews.aspx?id=" + news.ID + "\">Edit</a>";
						}
					}
				}
				else
					Response.Redirect("404.aspx");
			}
			else
				Response.Redirect("Default.aspx");
		}

		private void PopulatePage(NewsIO news)
		{
			Title = news.Title;
			TitleLabel.Text = news.Title;
			string htmlbody = "";
			news.GetBodyAsHTML(-1, out htmlbody);
			BodyLabel.Text = htmlbody;
			AuthorLabel.Text = Auth.LookupUserName(news.UpdatedBy);
			DateLabel.Text = news.Updated.ToShortDateString();
		}

		protected void DeleteNews_Click(object sender, EventArgs e)
		{
			NewsIO.DeleteNews(news.ID);
			View.Visible = false;
			Deleted.Visible = true;
			DeletedTitle.Text = news.Title;
			string body = "";
			news.GetBodyAsHTML(-1, out body);
			DeletedBody.Text = body;
		}
	}
}