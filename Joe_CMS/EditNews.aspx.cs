using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
	public partial class EditNews : System.Web.UI.Page
	{
		int userID = -1;
		int currentID = -1;
		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				userID = Auth.checkSession(session);
				if (userID != 0)
				{
					if (Request.QueryString.Keys.Count > 0 
						&& !string.IsNullOrEmpty(Request.QueryString["id"]) 
						&& int.TryParse(Request.QueryString["id"], out currentID))
					{
						if (!Page.IsPostBack)
						{
							NewsIO news = new NewsIO(currentID);
							if (-1 != news.ID)
								PopulatePage(news);
						}
					}
				}
				else
				{
                    Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);
				}
			}
			else
			{
                Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);
			}
		}

		private void PopulatePage(NewsIO news)
		{
			TitleBox.Text = news.Title;
			DateBox.Text = news.Updated.ToString();
			BodyBox.Text = news.Body;
		}

		protected void Save_Click(object sender, EventArgs e)
		{
			DateTime published = DateTime.Now;
			if(!DateTime.TryParse(DateBox.Text, out published))
				published = DateTime.Now;
			NewsIO news = new NewsIO(TitleBox.Text, BodyBox.Text, published, userID);
			news.ID = currentID;
			news.Save();
			Response.Redirect("NewsItem.aspx?id=" + news.ID + "&title=" + Server.UrlEncode(news.Title));
		}
	}
}