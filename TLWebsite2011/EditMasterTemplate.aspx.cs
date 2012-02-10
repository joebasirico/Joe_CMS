using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class EditMasterTemplate : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (0 > userID)
                Response.Redirect("Login.aspx");
            pageName = "Master";
            contentDescription = "Page's Content";
                
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(SettingsIO.GetSetting(GetUniqueStyleSheetName())))
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting(GetUniqueStyleSheetName());
                else
                    EditStyleSheetTextBox.Text = SettingsIO.GetSetting("DefaultStyleSheet");

                page = new PageIO(GetUniqueTemplateName());
                if (-1 != page.ID)
                {
                    EditBodyTextBox.Text = page.Body;
                    ContentTypeDropDown.SelectedItem.Selected = false;
                    ContentTypeDropDown.Items.FindByValue(page.ContentType).Selected = true;
                }

                //Header
                PageIO headerPage = new PageIO(GetUniqueHeaderName());
                if (-1 != headerPage.ID)
                    EditHeaderTextBox.Text = headerPage.GetBodyAsHTML();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            page = new PageIO("", "", GetUniqueTemplateName(), EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false);
            page.SavePage();


        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            PageIO page = new PageIO("", "", GetUniqueTemplateName(), EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false);
            page.SavePage();

            Response.Redirect("Default.aspx");
        }
    }
}