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
            context.Response.Write(defaultCSS.Body);
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