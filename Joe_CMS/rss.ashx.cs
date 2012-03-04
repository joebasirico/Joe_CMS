using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RssToolkit.Rss;
using Microsoft.Security.Application;

namespace Joe_CMS
{
    /// <summary>
    /// Summary description for feed
    /// </summary>
    public class rss : RssDocumentHttpHandler
    {

        protected override void PopulateRss(string channelName, string userName)
        {
            Rss.Channel = new RssChannel();
            Rss.Version = "2.0";
            Rss.Channel.Title = SettingsIO.GetSetting("SiteName") + " - " + SettingsIO.GetSetting("NewsTitle");
            Rss.Channel.PubDate = DateTime.Now.ToUniversalTime().ToString();
            Rss.Channel.LastBuildDate = DateTime.Now.ToUniversalTime().ToString();
            Rss.Channel.WebMaster = SettingsIO.GetSetting("SupportMail");
            Rss.Channel.Description = "The RSS feed for" + SettingsIO.GetSetting("SiteName");
            Rss.Channel.Link = "~/feed.ashx";

            Rss.Channel.Items = new List<RssItem>();

            int pageSize = 5;
            int.TryParse(SettingsIO.GetSetting("NewsItemsPerPage"), out pageSize);
            List<NewsIO> posts = NewsIO.GetRecentNews(pageSize, false);

            foreach (NewsIO post in posts)
            {
                RssItem item = new RssItem();
                item.Title = post.Title;
                string body = "";
                int newsLength = 2000;
                int.TryParse(SettingsIO.GetSetting("TruncatedNews"), out newsLength);
                post.GetBodyAsHTML(newsLength, out body);
                item.Description = body;
                item.Link = "~/NewsItem.aspx?id=" + post.ID + "&title=" + Encoder.XmlEncode(Encoder.UrlEncode(post.Title));
                Rss.Channel.Items.Add(item);
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