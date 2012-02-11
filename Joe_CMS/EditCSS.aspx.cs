using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            PageIO css = new PageIO("System_CSS");
            css.Body = CSSValue.Text;
            css.SavePage();
        }
    }
}