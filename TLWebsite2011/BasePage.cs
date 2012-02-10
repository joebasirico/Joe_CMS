using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Joe_CMS
{
    public partial class BasePage : System.Web.UI.Page
    {
        protected int userID = 0;
        protected string username = "";
        protected string pageName = "";
        protected string contentDescription = "Content";
        protected PageIO page = null;
        protected string contentPlaceHolder = "&&SYSTEM_CONTENT&&";
        protected string loginPlaceHolder = "&&SYSTEM_LOGIN&&";

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckSession();
        }

        protected void CheckSession()
        {
            Guid session = new Guid();
            if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
            {
                userID = Auth.checkSession(session);
                username = Auth.LookupUserName(userID);
            }
        }

        protected string GetUniqueTemplateName()
        {
            return "System_" + pageName;
        }

        protected string GetUniqueStyleSheetName()
        {
            return "System_" + pageName + "_StyleSheet";
        }

        protected string GetUniqueHeaderName()
        {
            return "System_" + pageName + "_Header";
        }
    }
}