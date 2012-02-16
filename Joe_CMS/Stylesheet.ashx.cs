using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Joe_CMS
{
    /// <summary>
    /// Summary description for Stylesheet
    /// </summary>
    public class Stylesheet : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/css";
            PageIO defaultCSS = new PageIO("System_CSS");
            if (!string.IsNullOrWhiteSpace(defaultCSS.Body))
                context.Response.Write(defaultCSS.Body);
            else
            {
                context.Response.WriteFile("SiteResources/ExampleStyleSheet.css");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}