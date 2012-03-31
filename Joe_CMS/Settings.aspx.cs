using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                PopulateValues();
        }

        private void PopulateValues()
        {
            PopulateTriple("SiteName", SiteNameTitle, SiteNameDescription, SiteNameValue
                , "Site Name", "This is the site's name, it will be used throughout the website any time there is a reference to the title of the site.", "Joe_CMS");
            PopulateTriple("NewsTitle", NewsTitleTitle, NewsTitleDescription, NewsTitleValue
                , "News Title", "This is the title of the News page (News.aspx).", "News");
            PopulateTriple("NewsCountFront", NewsStoryItemsOnFrontTitle, NewsStoryItemsOnFrontDescription, NewsStoryItemsOnFrontValue
                , "News Items on Front Page", "The number of news items to be displayed on the homepage (Default.aspx)", "5");
            PopulateTriple("TruncatedNewsFront", NewsStoryLengthFrontPageTitle, NewsStoryLengthFrontPageDescription, NewsStoryLengthFrontPageValue
                , "News Story Length on Front Page", "The length in characters of the news story on the front page.", "500");
            PopulateTriple("TruncatedNews", NewsStoryLengthNewsPageTitle, NewsStoryLengthNewsPageDescription, NewsStoryLengthNewsPageValue
                , "News Story Lengh on News Page", "The length in characters of the news stories on the news page", "1500");
            PopulateTriple("NewsItemsPerPage", NewsStoryItemsPerPageTitle, NewsStoryItemsPerPageDescription, NewsStoryItemsPerPageValue
                , "News Items on News.aspx", "The number of news items that will be displayed per page", "10");
            PopulateTriple("AuthCode", AuthorizationCodeTitle, AuthorizationCodeDescription, AuthorizationCodeValue
                , "Authorization Code", "Users will be required to enter this authorization code when they register. If this is left blank no Authorization code will be required (to allow for open registration).", "superman");
            PopulateTriple("SupportMail", SupportMailTitle, SupportMailDescription, SupportMailValue
                , "Support e-mail address", "This e-mail address will be displayed when an error occurs to allow users to contact you.", "support@DEMO.CCC");
            PopulateTriple("emailServer", EmailServerTitle, EmailServerDescription, EmailServerValue
                , "Email Server", "Your Email Server", "smtp.DEMO.CCC");
            PopulateTriple("noReplyEmail", NoReplyEmailTitle, NoReplyEmailDescription, NoReplyEmailValue
                , "NoReply e-mail address", "This is the e-mail address that will show up on any automated e-mail from the system (to reset password, register, etc.)", "noreply@DEMO.CCC");
            PopulateTriple("noReplyEmailUser", NoReplyEmailUserTitle, NoReplyEmailUserDescription, NoReplyEmailUserValue
                , "Login Username for the NoReply User", "This is the username to authenticate the noreply user to the email system", "noreply@DEMO.CCC");
            PopulateTriple("noReplyEmailPass", NoReplyEmailPassTitle, NoReplyEmailPassDescription, NoReplyEmailPassValue
                , "Login Password for the NoReply User", "This is the password to authenticate the noreply user to the email system", "password");
            PopulateTriple("PreviousPagePagerValue", PreviousPageTitle, PreviousPageDescription, PreviousPageValue
                , "Previous Pager Text", "The text to display at the bottom of the news page to navigate one page previous.", "&lArr;");
            PopulateTriple("NextPagePagerValue", NextPageTitle, NextPageDescription, NextPageValue
                , "Next Pager Text", "The text to display at the bottom of the news page to navigate to the next page", "&rArr;");
            PopulateTriple("SocialHTMLCode", AddSocialLinksTitle, AddSocialLinksDescription, AddSocialLinksValue
                , "Social HTML Code", "This HTML Code will be added to each page if Add Social Links is true. If your social links require a "+
                "javascript file to be included in the header of each page be sure to do that by editing the <a href='EditDefaultTemplate.aspx'>" +
                "EditDefaultTemplate.aspx</a> and <a href='EditDefault.aspx'>EditDefault.aspx</a> pages. <br />Add <strong>{0}</strong> where " + 
                "the page''s URL should go.", 
                "<div class='fb-like' data-href='{0}' data-send='false' data-layout='button_count' data-width='450' data-show-faces='true'></div>");

            Tuple<string, string, string> addSocialSetting = SettingsIO.GetCompleteSetting("AddSocialLinks");
            if (null != addSocialSetting)
            {
                AddSocialLinksCheckBox.Text = addSocialSetting.Item1;
                bool addSocial = false;
                bool.TryParse(addSocialSetting.Item3, out addSocial);
                AddSocialLinksCheckBox.Checked = addSocial;
            }
            else
            {
                string description = "Set to true to add the HTML below to each page automatically. Use this to add social networking links to each page.";
                AddSocialLinksCheckBox.Text = description;
                AddSocialLinksCheckBox.Checked = false;
                SettingsIO.SaveSetting("AddSocialLinks", "Add Social Links", description, "False");
            }

            Tuple<string, string, string> sendWelcomeMail = SettingsIO.GetCompleteSetting("SendWelcomeMail");
            if (null != sendWelcomeMail)
            {
                SendWelcomeMailCheckBox.Text = sendWelcomeMail.Item1;
                bool sendMail = false;
                bool.TryParse(sendWelcomeMail.Item3, out sendMail);
                SendWelcomeMailCheckBox.Checked = sendMail;
            }
            else
            {
                string description = "Whether or not the system should send an e-mail when new users register on the system.";
                SendWelcomeMailCheckBox.Text = description;
                SendWelcomeMailCheckBox.Checked = false;
                SettingsIO.SaveSetting("SendWelcomeMail", "Send Welcome Mail", description, "False");
            }

        }

        private void PopulateTriple(string name, Label titleLbl, Label descriptionLbl, TextBox valueTextBox,
            string titleDefault, string descriptionDefault, string valueDefault)
        {
            Tuple<string, string, string> value = SettingsIO.GetCompleteSetting(name);
            if (null != value)
            {
                titleLbl.Text = value.Item1;
                descriptionLbl.Text = value.Item2;
                valueTextBox.Text = value.Item3;
            }
            else
            {
                titleLbl.Text = titleDefault;
                descriptionLbl.Text = descriptionDefault;
                valueTextBox.Text = valueDefault;
                SettingsIO.SaveSetting(name, titleDefault, descriptionDefault, valueDefault);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SettingsIO.SaveSetting("SiteName", SiteNameValue.Text);
            SettingsIO.SaveSetting("NewsTitle", NewsTitleValue.Text);
            SettingsIO.SaveSetting("NewsCountFront", NewsStoryItemsOnFrontValue.Text);
            SettingsIO.SaveSetting("TruncatedNewsFront", NewsStoryLengthFrontPageValue.Text);
            SettingsIO.SaveSetting("TruncatedNews", NewsStoryLengthNewsPageValue.Text);
            SettingsIO.SaveSetting("NewsItemsPerPage", NewsStoryItemsPerPageValue.Text);
            SettingsIO.SaveSetting("AuthCode", AuthorizationCodeValue.Text);
            SettingsIO.SaveSetting("AddSocialLinks", AddSocialLinksCheckBox.Checked.ToString());
            SettingsIO.SaveSetting("SocialHTMLCode", AddSocialLinksValue.Text);
            SettingsIO.SaveSetting("SupportMail", SupportMailValue.Text);
            SettingsIO.SaveSetting("emailServer", EmailServerValue.Text);
            SettingsIO.SaveSetting("noReplyEmail", NoReplyEmailValue.Text);
            SettingsIO.SaveSetting("noReplyEmailUser", NoReplyEmailUserValue.Text);
            SettingsIO.SaveSetting("noReplyEmailPass", NoReplyEmailPassValue.Text);
            SettingsIO.SaveSetting("SendWelcomeMail", SendWelcomeMailCheckBox.Checked.ToString());
            SettingsIO.SaveSetting("PreviousPagePagerValue", PreviousPageValue.Text);
            SettingsIO.SaveSetting("NextPagePagerValue", NextPageValue.Text);

            Message.Visible = true;
            Message.Text = "Your new settings have been saved.";

            PopulateValues();
        }
    }
}