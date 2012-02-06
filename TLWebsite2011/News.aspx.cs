<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLWebsite2011.Properties;
using System.Data;

namespace TLWebsite2011
{
    public partial class News : System.Web.UI.Page
    {
        int userID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Guid session = new Guid();
            if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
            {
                userID = Auth.checkSession(session);
                if (userID != 0)
                {
                    AddNews.Visible = true;
                    AddNews.Text = "<a href=\"EditNews.aspx\">Add New Article</a>";
                }
            } 

        }

        protected void NewsPager_PreRender(object sender, EventArgs e)
        {
            NewsPager.PageSize = Settings.Default.NewsCount;
            NewsList.DataSource = PopulatePage(10000000);
            NewsList.DataBind();
        }

        private DataTable PopulatePage(int count)
        {
            List<NewsIO> posts = NewsIO.GetRecentNews(count, 0 != userID);

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
                if (n.Updated > DateTime.Now)
                    r["Title"] = "(Not Yet Published): " + n.Title;
                else
                    r["Title"] = n.Title;

                r["ID"] = n.ID;
                r["Link"] = link;
                r["Date"] = n.Updated.ToShortDateString();
                r["Author"] = Auth.LookupUserName(n.UpdatedBy);
                string htmlBody = "";
                bool wasTruncated = n.GetBodyAsHTML(Settings.Default.TruncateNews, out htmlBody);
                if (wasTruncated)
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">... read more.</a>";
                else
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">Link to this article.</a>";

                dt.Rows.Add(r);
            }

            return dt;
        }
    }
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLWebsite2011.Properties;
using System.Data;

namespace TLWebsite2011
{
	public partial class News : System.Web.UI.Page
	{
		int userID = 0;
		protected void Page_Load(object sender, EventArgs e)
		{
            Page.Title = "Latest News"; 
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				userID = Auth.checkSession(session);
				if (userID != 0)
				{
					AddNews.Visible = true;
					AddNews.Text = "<a href=\"EditNews.aspx\">Add New Article</a>";
				}
			}
			PopulatePage(Settings.Default.NewsCount);
		}

		private void PopulatePage(int count)
		{
			List<NewsIO> posts = NewsIO.GetRecentNews(count, 0 != userID);
			
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
				if (n.Updated > DateTime.Now)
					r["Title"] = "(Not Yet Published): " + n.Title;
				else
					r["Title"] = n.Title; 

				r["ID"] = n.ID;
				r["Link"] = link; 
				r["Date"] = n.Updated.ToShortDateString();
				r["Author"] = Auth.LookupUserName(n.UpdatedBy);
				string htmlBody = "";
				bool wasTruncated = n.GetBodyAsHTML(Settings.Default.TruncateNews, out htmlBody);
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
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}