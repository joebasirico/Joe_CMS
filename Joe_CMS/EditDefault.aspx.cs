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
                    }
                }

                PageIO header = new PageIO(GetUniqueHeaderName());
                if (!string.IsNullOrWhiteSpace(header.Body) && !Page.IsPostBack)
                    EditHeaderTextBox.Text = header.Body;

                String scriptName = "EditArea";
                Type scriptType = this.GetType();

                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsStartupScriptRegistered(scriptType, scriptName))
                {
                    string editAreaScript = @"editAreaLoader.init({
			id: '" + EditBodyTextBox.ClientID + @"'	// id of the textarea to transform		
			,start_highlight: true	// if start with highlight
			,allow_resize: 'both'
			,allow_toggle: true
			,word_wrap: true
			,language: 'en'
			,syntax: 'html'	
		});
editAreaLoader.init({
			id: '" + EditHeaderTextBox.ClientID + @"'	// id of the textarea to transform		
			,start_highlight: true	// if start with highlight
			,allow_resize: 'both'
			,allow_toggle: true
			,word_wrap: true
			,language: 'en'
			,syntax: 'html'	
		});
";
                    cs.RegisterStartupScript(scriptType, scriptName, editAreaScript, true);
                }
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
    }
}