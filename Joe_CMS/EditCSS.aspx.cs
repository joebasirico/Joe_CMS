using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

namespace Joe_CMS
{
    public partial class EditCSS : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (0 < userID)
            {
                if (!Page.IsPostBack)
                {
                    PageIO css = new PageIO("System_CSS");
                    if (!string.IsNullOrWhiteSpace(css.Body))
                    {
                        CSSValue.Text = css.Body;
                        Message.Text = @"note: You have edited this stylesheet. If you need to return to the default
just delete everything here and it'll pop back in (trust me).<br />";
                    }
                    else
                    {
                        Message.Text = @"note: this stylesheet is the default. Once you save it you will 
overwrite this. If you ever need to go back to this one, just delete everything and it'll come right back.<br />";
                        CSSValue.Text = File.ReadAllText(Server.MapPath("/SiteResources/ExampleStyleSheet.css"));
                    }
                }

                String scriptName = "EditArea";
                Type scriptType = this.GetType();

                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsStartupScriptRegistered(scriptType, scriptName))
                {
                    string editAreaScript = @"editAreaLoader.init({
			id: '" + CSSValue.ClientID + @"'	// id of the textarea to transform		
			,start_highlight: true	// if start with highlight
			,allow_resize: 'both'
			,allow_toggle: true
			,word_wrap: true
			,language: 'en'
			,syntax: 'css'	
		});";
                    cs.RegisterStartupScript(scriptType, scriptName, editAreaScript, true);
                }
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=" + Request.Path);

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            PageIO css = new PageIO("System_CSS", "", "System_CSS", CSSValue.Text, DateTime.Now, "HTML", 0, false, true);
            css.SavePage();
        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            PageIO css = new PageIO("System_CSS", "", "System_CSS", CSSValue.Text, DateTime.Now, "HTML", 0, false, true);
            css.SavePage();
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}