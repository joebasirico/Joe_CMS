using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class Show : BasePage
    {
        DateTime version = new DateTime();

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Request.QueryString.Keys.Count > 0
                && !string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                string pageName = Request.QueryString["page"];
                if (DateTime.TryParse(Request.QueryString["version"], out version))
                    page = new PageIO(pageName, version);
                else
                    page = new PageIO(pageName);
                //Page exists
                if (-1 != page.ID)
                {
                    //if that page is a draft or private show it only to Admins.
                    //if the page is neither private, nor draft then display it to anybody.
                    if (((page.IsDraft || page.IsPrivate) && 0 < userID) || (!page.IsPrivate && !page.IsDraft))
                        PopulatePage(page);
                    //page is either private or draft but the user isn't an admin
                    else
                        Response.Redirect("404.aspx");
                }
                //page doesn't exist, but user is an admin so they can create it.
                else if (0 < userID)
                    Response.Redirect("Edit.aspx?page=" + Server.UrlEncode(pageName));
                //page doesn't exist, and the user is not an admin
                else
                    Response.Redirect("404.aspx");
            }
            //this page was called without specifying a page, just redirect to Default instead of showing an error
            //also user is not logged in. If they're logged in redirect to the Edit page so the Admin can create a new page
            else if (0 < userID)
                Response.Redirect("Edit.aspx");
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