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

            if (0 < userID)
            {
                pageName = "Master";
                contentDescription = "Page's Content";

                if (!Page.IsPostBack)
                {
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
            page = new PageIO("", "", GetUniqueTemplateName(), EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false, true);
            page.SavePage();

            PageIO header = new PageIO("", "", GetUniqueHeaderName(), EditHeaderTextBox.Text, System.DateTime.Now, "HTML", userID, false, true);
            header.SavePage();
        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            PageIO page = new PageIO("", "", GetUniqueTemplateName(), EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false, true);
            page.SavePage();

            PageIO header = new PageIO("", "", GetUniqueHeaderName(), EditHeaderTextBox.Text, System.DateTime.Now, "HTML", userID, false, true);
            header.SavePage();

            Response.Redirect("Default.aspx");
        }
    }
}