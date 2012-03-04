using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Microsoft.Security.Application;

namespace Joe_CMS
{
    /// <summary>
    /// Summary description for SEOSitemap
    /// </summary>
    public class SEOSitemap : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            StringWriter sitemap = new StringWriter();

            sitemap.WriteLine("Default.aspx");
            sitemap.WriteLine("News.aspx");

            sitemap.WriteLine("");

            int pageCount = 2;

            foreach (PageIO page in PageIO.GetAllRecentPages())
            {
                if (!page.IsDraft && !page.IsPrivate)
                    sitemap.WriteLine("Show.aspx?page={0}", Encoder.UrlEncode(page.URLTitle));
                pageCount++;
            }

            sitemap.WriteLine("");

            foreach (NewsIO news in NewsIO.GetRecentNews(50000-pageCount, false))
            {
                sitemap.WriteLine("NewsItem.aspx?id={0}&title={1}", news.ID, Encoder.UrlEncode(news.Title));
            }

            context.Response.Write(sitemap.ToString());
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