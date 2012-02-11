using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Joe_CMS
{
	public partial class SiteMap : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            base.Page_Load(sender, e);

            SiteName.Text = SettingsIO.GetSetting("SiteName");
			DataTable dt = new DataTable();
			dt.Columns.Add("Title");
			dt.Columns.Add("SubTitle");
			dt.Columns.Add("Link");

            AddPage(dt, "Home", " - Main page of " + SettingsIO.GetSetting("SiteName"), "Default.aspx");
            AddPage(dt, "News", " - " + SettingsIO.GetSetting("NewsTitle") + " " + SettingsIO.GetSetting("SiteName"), "News.aspx");
			AddPage(dt, "SiteMap", " - This sitemap page", "Sitemap.aspx");

			foreach (PageIO page in PageIO.GetAllRecentPages())
			{
                string title = page.Title.Trim();
                if(page.IsDraft)
                    title = "<em>Draft, " + title + "</em>";
                if(page.IsPrivate)
                    title = "<strong>Private, " + title + "</strong>";

                if (((page.IsDraft || page.IsPrivate) && 0 < userID) || (!page.IsPrivate && !page.IsDraft))
                {
                    if (!page.URLTitle.StartsWith("System_"))
                    {
                        if (string.IsNullOrWhiteSpace(page.SubTitle))
                            AddPage(dt, page.Title.Trim(), page.SubTitle, "Show.aspx?page=" + Server.UrlEncode(page.URLTitle));
                        else
                            AddPage(dt, page.Title.Trim(), " - " + page.SubTitle, "Show.aspx?page=" + Server.UrlEncode(page.URLTitle));
                    }
                }
			}

			PageList.DataSource = dt;
			PageList.DataBind();

		}

		private void AddPage(DataTable dt, string title, string subtitle, string url)
		{
			DataRow r = dt.NewRow();
			r["Title"] = Server.HtmlEncode(title);
			r["SubTitle"] = Server.HtmlEncode(subtitle);
			r["Link"] = url;
			dt.Rows.Add(r);
		}
	}
}