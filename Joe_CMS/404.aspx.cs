using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
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
            PageIO page = new PageIO("", "", pageName, EditBodyTextBox.Text, System.DateTime.Now, ContentTypeDropDown.SelectedValue, userID, false, true);
            page.SavePage();

            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}