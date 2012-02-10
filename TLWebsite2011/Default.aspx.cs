using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TLWebsite2011.Properties;

namespace Joe_CMS
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            pageName = "Default";
            contentDescription = "News Items";
            Page.Title = SettingsIO.GetSetting("SiteName");

            if (0 < userID)
            {
                EditButton.Visible = true;
                EditButton2.Visible = true;
            }

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
            if (-1 != page.ID && !string.IsNullOrWhiteSpace(page.Body))
            {
                CustomHeader.Visible = true;
                CustomHeader.Text = page.Body;
                Page.Title = SettingsIO.GetSetting("SiteName") + page.Title;
            }
            else
                SiteName.Text = SettingsIO.GetSetting("SiteName");

            //General Template
            page = new PageIO(GetUniqueTemplateName());
            if (-1 != page.ID && !string.IsNullOrWhiteSpace(page.Body))
            {
                CustomPreContentPanel.Visible = true;
                CustomPostContentPanel.Visible = true;
                DefaultPostNewsPanel.Visible = false;
                DefaultPreContentPanel.Visible = false;

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
                }
            }
            else
                DefaultLoginText.Text = loginText;

            //Custom Stylesheet
            if (!string.IsNullOrEmpty(SettingsIO.GetSetting(GetUniqueStyleSheetName())))
                StyleSheet.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\" />", SettingsIO.GetSetting(GetUniqueStyleSheetName()));
            else
                StyleSheet.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\" />", SettingsIO.GetSetting("DefaultStyleSheet"));
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
            if (0 < userID)
            {
                CustomPreContentPanel.Visible = false;
                CustomPostContentPanel.Visible = false;
                DefaultPostNewsPanel.Visible = false;
                DefaultPreContentPanel.Visible = false;
                SystemContent.Visible = false;

                EditButton.Visible = false;
                EditButton2.Visible = false;
                EditBody.Visible = true;

                if (!string.IsNullOrEmpty(SettingsIO.GetSetting(GetUniqueStyleSheetName())))
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting(GetUniqueStyleSheetName());
                else
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting("DefaultStyleSheet");

                if (-1 != page.ID)
                {
                    EditTitleTextBox.Text = page.Title;
                    EditBodyTextBox.Text = page.Body;
                    ContentTypeDropDown.SelectedItem.Selected = false;
                    ContentTypeDropDown.Items.FindByValue(page.ContentType).Selected = true;
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            page = new PageIO(EditTitleTextBox.Text, "", GetUniqueTemplateName() , EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false);
            page.SavePage();

            EditButton_Click(sender, e);
        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            PageIO page = new PageIO(EditTitleTextBox.Text, "", GetUniqueTemplateName(), EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false);
            page.SavePage();

            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}