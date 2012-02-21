using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class EditDefault : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

            if (0 < userID)
            {
                pageName = "Default";
                contentDescription = "News Items";

                page = new PageIO(GetUniqueTemplateName());
                if (-1 != page.ID && !Page.IsPostBack)
                {
                    if (!string.IsNullOrWhiteSpace(page.Body))
                    {
                        EditTitleTextBox.Text = page.Title;
                        EditBodyTextBox.Text = page.Body;
                        ContentTypeDropDown.SelectedItem.Selected = false;
                        ContentTypeDropDown.Items.FindByValue(page.ContentType).Selected = true;
                    }
                    else
                    {
                        EditTitleTextBox.Text = SettingsIO.GetSetting("SiteName");
                        EditBodyTextBox.Text = defaultBody;
                        ContentTypeDropDown.SelectedItem.Selected = false;
                        ContentTypeDropDown.Items.FindByValue("HTML").Selected = true;
                    }
                }

                PageIO header = new PageIO(GetUniqueHeaderName());
                if (!string.IsNullOrWhiteSpace(header.Body) && !Page.IsPostBack)
                    EditHeaderTextBox.Text = header.Body;
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            page = new PageIO(EditTitleTextBox.Text, "", GetUniqueTemplateName(), EditBodyTextBox.Text,
                System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false, true);
            page.SavePage();

            PageIO header = new PageIO(GetUniqueHeaderName(), "", GetUniqueHeaderName(), EditHeaderTextBox.Text,
                System.DateTime.Now, "HTML", userID, false, true);
            header.SavePage();
        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            Save_Click(sender, e);

            Response.Redirect("Default.aspx");
        }

        string defaultBody = @"
            <div class=""BodyWrapper"">
                <h1>
                    " + SettingsIO.GetSetting("SiteName") +@"</h1>
                <div>
                    Welcome to your start page of Joe_CMS, the easiest CMS to administer. You can get
                    started by creating a user, logging in and clicking this
                    <asp:LinkButton ID=""EditButton"" runat=""server"" Visible=""false"" OnClick=""EditButton_Click"">Edit This Page</asp:LinkButton>
                    button or the one at the bottom of the page.</div>
                <h2>
                    News:
                </h2>
                <div>
                  &&SYSTEM_CONTENT&&
                </div>
                &&SYSTEM_LOGIN&&
            </div>
";
    }
}