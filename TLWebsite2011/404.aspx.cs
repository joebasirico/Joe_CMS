using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TLWebsite2011
{
    public partial class _404 : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulatePage();

            if (0 < userID)
                EditButton.Visible = true;
        }

        private void PopulatePage()
        {
            page = new PageIO(pageName);
            if (!Page.IsPostBack)
            {
                if (-1 != page.ID && !string.IsNullOrWhiteSpace(page.Body))
                {
                    DefaultBody.Visible = false;
                    CustomBody.Visible = true;
                    CustomBodyHTML.Text = page.GetBodyAsHTML();
                }
                if (!string.IsNullOrEmpty(SettingsIO.GetSetting("StyleSheet404")))
                    StyleSheet404.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\" />", SettingsIO.GetSetting("StyleSheet404"));
                else
                    StyleSheet404.Text = String.Format("<link href=\"{0}\" rel=\"stylesheet\" type=\"text/css\" />", SettingsIO.GetSetting("DefaultStyleSheet"));
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
                if (0 < userID)
            {
                DefaultBody.Visible = false;
                CustomBody.Visible = false;
                EditButton.Visible = false; 
                EditBody.Visible = true;

                if (!string.IsNullOrEmpty(SettingsIO.GetSetting("StyleSheet404")))
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting("StyleSheet404");
                else
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting("DefaultStyleSheet");

                if (-1 != page.ID)
                {
                    EditBodyTextBox.Text = page.Body;
                    ContentTypeDropDown.SelectedItem.Selected = false;
                    ContentTypeDropDown.Items.FindByValue(page.ContentType).Selected = true;
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            PageIO page = new PageIO("", "", pageName, EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false);
            page.SavePage();

            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}