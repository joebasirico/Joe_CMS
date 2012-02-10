using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLWebsite2011.Properties;
using System.Data;

namespace TLWebsite2011
{
    public partial class News : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            NewsTitle.Text = SettingsIO.GetSetting("NewsTitle");
            if (userID != 0)
            {
                EditTitle.Visible = true; 
                AddNews.Visible = true;
                AddNews.Text = "<a href=\"EditNews.aspx\">Add New Article</a>";
            }
        }

        protected void NewsPager_PreRender(object sender, EventArgs e)
        {
            int pageSize = 5;
            int.TryParse(SettingsIO.GetSetting("NewsItemsPerPage"), out pageSize);
            NewsPager.PageSize = pageSize;
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

                int newsLength = 2000;
                int.TryParse(SettingsIO.GetSetting("TruncatedNews"), out newsLength);
                bool wasTruncated = n.GetBodyAsHTML(newsLength, out htmlBody);
                if (wasTruncated)
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">... read more.</a>";
                else
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">Link to this article.</a>";

                dt.Rows.Add(r);
            }

            return dt;
        }

        protected void EditTitle_Click(object sender, EventArgs e)
        {
            NewsTitle.Visible = false;
            SaveTitle.Visible = true;
            EditTitle.Visible = false;
            EditNewsTitleTextBox.Visible = true;
            EditNewsTitleTextBox.Text = SettingsIO.GetSetting("NewsTitle");
        }

        protected void SaveTitle_Click(object sender, EventArgs e)
        {
            NewsTitle.Visible = true;
            NewsTitle.Text = EditNewsTitleTextBox.Text; 
            
            SaveTitle.Visible = false;
            EditTitle.Visible = true;
            EditNewsTitleTextBox.Visible = false;
            
            SettingsIO.SaveSetting("NewsTitle", EditNewsTitleTextBox.Text);
        }
    }
}