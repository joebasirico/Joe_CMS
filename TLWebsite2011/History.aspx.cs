<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TLWebsite2011
{
	public partial class History : System.Web.UI.Page
	{
		string currentURL = "";
		int userID = 0;

		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				userID = Auth.checkSession(session);
				if (userID != 0)
				{
					if (Request.QueryString.Keys.Count > 0 && !string.IsNullOrEmpty(Request.QueryString["page"]))
					{
						currentURL = Request.QueryString["page"];
						if (!Page.IsPostBack)
						{
							PopulatePage(currentURL);
						}
					}
					else
					{
						Response.Redirect("Default.aspx");
					}
				}
				else
				{
					Response.Redirect("Login.aspx");
				}
			}
			else
			{
				Response.Redirect("Login.aspx");
			}
		}

		private void PopulatePage(string page)
		{
			DataTable dt = new DataTable();
			dt.Columns.Add("Title");
			dt.Columns.Add("Link");
			dt.Columns.Add("Updated");
			dt.Columns.Add("UpdatedBy");
			dt.Columns.Add("Body");

			PageIO currentPage = new PageIO(page);

			List<PageIO> pages = currentPage.GetHistory();
			foreach (PageIO p in pages)
			{
				TitleLabel.Text = p.URLTitle;
				DataRow dr = dt.NewRow();
				dr["Title"] = p.Title;
				dr["Link"] = "Show.aspx?page=" + p.URLTitle + "&version=" + p.Updated;
				dr["Updated"] = p.Updated.ToString();
				dr["UpdatedBy"] = p.UpdatedBy;
				string body = p.GetBodyAsPlaintext();
				if (body.Length > 200)
					dr["Body"] = body.Substring(0, 200);
				else
					dr["Body"] = body;

				dt.Rows.Add(dr);
			}

			HistoryList.DataSource = dt;
			HistoryList.DataBind();
		}
	}
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TLWebsite2011
{
	public partial class History : System.Web.UI.Page
	{
		string currentURL = "";
		int userID = 0;

		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				userID = Auth.checkSession(session);
				if (userID != 0)
				{
					if (Request.QueryString.Keys.Count > 0 && !string.IsNullOrEmpty(Request.QueryString["page"]))
					{
						currentURL = Request.QueryString["page"];
						if (!Page.IsPostBack)
						{
							PopulatePage(currentURL);
						}
					}
					else
					{
						Response.Redirect("Default.aspx");
					}
				}
				else
				{
					Response.Redirect("Login.aspx");
				}
			}
			else
			{
				Response.Redirect("Login.aspx");
			}
		}

		private void PopulatePage(string page)
		{
			DataTable dt = new DataTable();
			dt.Columns.Add("Title");
			dt.Columns.Add("Link");
			dt.Columns.Add("Updated");
			dt.Columns.Add("UpdatedBy");
			dt.Columns.Add("Body");

			PageIO currentPage = new PageIO(page);

            PageTitle.Text = "History for: " + Server.HtmlEncode(currentPage.Title);
            Page.Title = "History for: " + Server.HtmlEncode(currentPage.Title);

			List<PageIO> pages = currentPage.GetHistory();
			foreach (PageIO p in pages)
			{
				TitleLabel.Text = p.URLTitle;
				DataRow dr = dt.NewRow();
				dr["Title"] = p.Title;
				dr["Link"] = "Show.aspx?page=" + p.URLTitle + "&version=" + p.Updated;
				dr["Updated"] = p.Updated.ToString();
				dr["UpdatedBy"] = p.UpdatedBy;
				string body = p.GetBodyAsPlaintext();
				if (body.Length > 200)
					dr["Body"] = body.Substring(0, 200);
				else
					dr["Body"] = body;

				dt.Rows.Add(dr);
			}

			HistoryList.DataSource = dt;
			HistoryList.DataBind();
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}