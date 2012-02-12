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
            if(!Page.IsPostBack)
                PopulateValues();
        }

        private void PopulateValues()
        {
            PopulateTriple("SiteName", SiteNameTitle, SiteNameDescription, SiteNameValue);
            PopulateTriple("NewsTitle", NewsTitleTitle, NewsTitleDescription, NewsTitleValue);
            PopulateTriple("NewsCountFront", NewsStoryItemsOnFrontTitle, NewsStoryItemsOnFrontDescription, NewsStoryItemsOnFrontValue);
            PopulateTriple("TruncatedNewsFront", NewsStoryLengthFrontPageTitle, NewsStoryLengthFrontPageDescription, NewsStoryLengthFrontPageValue);
            PopulateTriple("TruncatedNews", NewsStoryLengthNewsPageTitle, NewsStoryLengthNewsPageDescription, NewsStoryLengthNewsPageValue);
            PopulateTriple("NewsItemsPerPage", NewsStoryItemsPerPageTitle, NewsStoryItemsPerPageDescription, NewsStoryItemsPerPageValue);
            PopulateTriple("AuthCode", AuthorizationCodeTitle, AuthorizationCodeDescription, AuthorizationCodeValue);

            Tuple<string, string, string> addSocialSetting = SettingsIO.GetCompleteSetting("AddSocialLinks");
            AddSocialLinksCheckBox.Text = addSocialSetting.Item1;
            bool addSocial = false;
            bool.TryParse(addSocialSetting.Item3, out addSocial);
            AddSocialLinksCheckBox.Checked = addSocial;

            Tuple<string, string, string> socialHTML = SettingsIO.GetCompleteSetting("SocialHTMLCode");
            AddSocialLinksTitle.Text = socialHTML.Item1;
            AddSocialLinksDescription.Text = socialHTML.Item2;
            AddSocialLinksValue.Text = socialHTML.Item3;

        }

        private void PopulateTriple(string name, Label titleLbl, Label descriptionLbl, TextBox valueTextBox)
        {
            Tuple<string, string, string> value = SettingsIO.GetCompleteSetting(name);
            titleLbl.Text = value.Item1;
            descriptionLbl.Text = value.Item2;
            valueTextBox.Text = value.Item3;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            SettingsIO.SaveSetting("SiteName", SiteNameValue.Text);
            SettingsIO.SaveSetting("NewsTitle", NewsTitleValue.Text);
            SettingsIO.SaveSetting("TruncatedNewsFront", NewsStoryLengthFrontPageValue.Text);
            SettingsIO.SaveSetting("TruncatedNews", NewsStoryLengthNewsPageValue.Text);
            SettingsIO.SaveSetting("NewsItemsPerPage", NewsStoryItemsPerPageValue.Text);
            SettingsIO.SaveSetting("AuthCode", AuthorizationCodeValue.Text);
            SettingsIO.SaveSetting("AddSocialLinks", AddSocialLinksCheckBox.Checked.ToString());
            SettingsIO.SaveSetting("SocialHTMLCode", AddSocialLinksValue.Text);


        }
    }
}