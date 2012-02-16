using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
	public partial class Edit : System.Web.UI.Page
	{
		int userID = -1;
		string currentURL = "";
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
							PageIO page = new PageIO(currentURL);
							if(-1 != page.ID)
								PopulatePage(page);
							else
							{
								TitleBox.Text = currentURL;
								Message.Visible = true;
								Message.Text = "This page doesn't exist, but because you are an admin you can create it.<br />";
							}
						}
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

		private void PopulatePage(PageIO page)
		{
			TitleBox.Text = page.Title;
			SubTitleBox.Text = page.SubTitle;
			URLBox.Text = page.URLTitle;
            IsDraftCheckBox.Checked = page.IsDraft;
            IsPrivateCheckBox.Checked = page.IsPrivate;
			BodyBox.Text = page.Body;
			ContentTypeDropDown.SelectedItem.Selected = false;
			ContentTypeDropDown.Items.FindByValue(page.ContentType).Selected = true;
		}

		protected void Save_Click(object sender, EventArgs e)
		{
			string url = "";
			if (!string.IsNullOrEmpty(currentURL))
				url = currentURL;
			else if(string.IsNullOrEmpty(URLBox.Text))
				url = PageIO.GetResolvedURLText(TitleBox.Text);
			else
				url = PageIO.GetResolvedURLText(URLBox.Text);

			PageIO page = new PageIO(TitleBox.Text, SubTitleBox.Text, url, BodyBox.Text, 
                System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, 
                IsDraftCheckBox.Checked, IsPrivateCheckBox.Checked);
			page.SavePage();

			Response.Redirect("Show.aspx?page="+page.URLTitle);
			
		}
	}
}