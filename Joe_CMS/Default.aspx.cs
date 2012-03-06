using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Joe_CMS
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            pageName = "Default";
            Page.Title = SettingsIO.GetSetting("SiteName");

            if (0 < userID)
                EditButton2.Visible = true;

            int newsCount = 3;
            int.TryParse(SettingsIO.GetSetting("NewsCountFront"), out newsCount);
            PopulateNews(newsCount);

            PopulateTemplate();
        }

        private void PopulateTemplate()
        {
            //We can generate this login text early.
            string loginText = "<a href=\"/Login.aspx\">Login</a>";
            if (0 < userID)
                loginText = "You are currently logged in as: " + username + " <a href=\"/Logout.aspx\">click here to logout</a>";

            //Header Template 
            page = new PageIO(GetUniqueHeaderName());
            if (-1 != page.ID)
            {
                CustomHeader.Visible = true;
                CustomHeader.Text = page.Body;
            }

            Page.Title = SettingsIO.GetSetting("SiteName") + " - Home";

            //General Template
            page = new PageIO(GetUniqueTemplateName());
            if (-1 != page.ID)
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
                    PreContentHTML.Text = pageContent.Substring(0, pageContent.IndexOf(contentPlaceHolder));
                    string postContent = pageContent.Substring(pageContent.IndexOf(contentPlaceHolder) + contentPlaceHolder.Length);
                    PostContentHTML.Text = postContent;
                }
                else
                {
                    PreContentHTML.Text = pageContent;
                    PostContentHTML.Text = "";
                    SystemContent.Visible = false;
                }
            }
        }

        private void PopulateNews(int count)
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
                int truncatedNewsFront = 500;
                int.TryParse(SettingsIO.GetSetting("TruncatedNewsFront"), out truncatedNewsFront);
                bool wasTruncated = n.GetBodyAsHTML(truncatedNewsFront, out htmlBody);
                if (wasTruncated)
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">... read more.</a>";
                else
                    r["Body"] = htmlBody + "<a href=\"" + link + "\">Link to this article.</a>";

                dt.Rows.Add(r);
            }

            NewsList.DataSource = dt;
            NewsList.DataBind();
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditDefault.aspx");
        }
    }
}