using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Joe_CMS
{
    public partial class EditCSS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageIO css = new PageIO("System_CSS");
                CSSValue.Text = css.Body;
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

        protected void Save_Click(object sender, EventArgs e)
        {
            PageIO css = new PageIO("System_CSS");
            css.Body = CSSValue.Text;
            css.SavePage();
        }

        protected void Finish_Click(object sender, EventArgs e)
        {
            PageIO css = new PageIO("System_CSS");
            css.Body = CSSValue.Text;
            css.SavePage();
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}