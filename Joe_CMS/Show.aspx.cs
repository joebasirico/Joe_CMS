using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
    public partial class Show : BasePage
    {
        DateTime version = new DateTime();

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Request.QueryString.Keys.Count > 0
                && !string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                string pageName = Request.QueryString["page"];
                if (DateTime.TryParse(Request.QueryString["version"], out version))
                    page = new PageIO(pageName, version);
                else
                    page = new PageIO(pageName);
                //Page exists
                if (-1 != page.ID)
                {
                    //if that page is a draft or private show it only to Admins.
                    //if the page is neither private, nor draft then display it to anybody.
                    if (((page.IsDraft || page.IsPrivate) && 0 < userID) || (!page.IsPrivate && !page.IsDraft))
                        PopulatePage(page);
                    //page is either private or draft but the user isn't an admin
                    else
                        Response.Redirect("404.aspx");
                }
                //page doesn't exist, but user is an admin so they can create it.
                else if (0 < userID)
                {
                    if ("markdown" == pageName.ToLower())
                        CreateMarkdownPageAndRedirect();
                    else if ("registrationcomplete" == pageName.ToLower())
                        CreateRegistrationCompletePageAndRedirect();
                    else
                        Response.Redirect("Edit.aspx?page=" + Server.UrlEncode(pageName));
                }
                //page doesn't exist, and the user is not an admin
                else
                    Response.Redirect("404.aspx");
            }
            //this page was called without specifying a page, just redirect to Default instead of showing an error
            //also user is not logged in. If they're logged in redirect to the Edit page so the Admin can create a new page
            else if (0 < userID)
                Response.Redirect("Edit.aspx");
            else
                Response.Redirect("Default.aspx");

            bool addSocial = false;
            bool.TryParse(SettingsIO.GetSetting("AddSocialLinks"), out addSocial);
            if (addSocial)
                SocialLinks.Text = String.Format(SettingsIO.GetSetting("SocialHTMLCode"), Request.Url);
        }

        private void PopulatePage(PageIO page)
        {
            TitleLabel.Text = page.Title;
            Page.Title = page.Title;
            SubTitleLabel.Text = page.SubTitle;
            BodyLiteral.Text = page.GetBodyAsHTML();
            UpdatedLabel.Text = page.Updated.ToShortDateString();
            UserLabel.Text = Auth.LookupUserName(page.UpdatedBy);

            Guid session = new Guid();
            if (Request.Cookies["session"] != null && !string.IsNullOrEmpty(Request.Cookies["session"].Value) && Guid.TryParse(Request.Cookies["session"].Value, out session))
            {
                int userID = Auth.checkSession(session);
                string username = Auth.LookupUserName(userID);
                if (!string.IsNullOrEmpty(username))
                {
                    if (version != new DateTime())
                    {
                        Revert.Visible = true;
                        HistoryText.Visible = true;
                        HistoryText.Text = "<a href=\"History.aspx?page=" + page.URLTitle + "\">See Previous Versions</a>";
                    }
                    else
                    {
                        EditText.Visible = true;
                        EditText.Text = "<a href=\"Edit.aspx?page=" + page.URLTitle + "\">Edit this page</a>";
                        HistoryText.Visible = true;
                        HistoryText.Text = "<a href=\"History.aspx?page=" + page.URLTitle + "\">See Previous Versions</a>";

                    }
                }
            }
        }

        protected void Revert_Click(object sender, EventArgs e)
        {
            page.SavePage();
            Response.Redirect("Show.aspx?page=" + page.URLTitle);
        }

        private void CreateRegistrationCompletePageAndRedirect()
        {
            string body = @"Nice work, you've registered yourself and it looks like everything went swimmingly! On this page you'll find some help on how to modify Joe_CMS and make it yours. You can even edit this page! If you'd like you can bookmark this page to return to it at any time.

##Intro

Joe_CMS is split into three different major areas:

 * Default.aspx - This is the first page people will see when they arrive on your site. You can edit it and it will pull styles from the css file, but it's a special page in that it can display your news or blog items in the middle.
 * News.aspx - I call this section 'News,' but you may think of it as your blog. I like to use it to post chronological items like updates to the site, new insights or each time I meet The President.
 * All Other Pages - All the other pages are up to you to create. They all follow the pattern `Show.aspx?page=MyPageName`. The 'MyPageName' bit tells the system which page you're requesting. As an administrator you can create as many of these as you'd like. Please feel free to edit these as often as you'd like, Joe_CMS automatically keeps a history of every save, so if you make a mistake you can easily go back.

That's about it. If you can remember those things everything else should be a breeze.

##Templates
I think the Joe_CMS templating system is pretty easy to understand, I've tried to reduce as much complexity as possible. First of all, if you like the way the site looks now, there's nothing more for you to do. If you do want to change the theme, read on.

*note: for all of this stuff you'll have to be logged in, so be sure to do that before proceeding*

###Default.aspx
As I mentioned earlier, Default.aspx is a bit of a special page. That means that it doesn't follow the same template as the rest of the site. Just click the link at the very bottom of the page that says 'Edit This Page'

That will take you to another page that has three main sections: The Title, Body and Header.

####Title
The title is the title of this page. This title will show up just for this page. You might want to call it something like 'Welcome to My Website' or something like that.

####Body
The Body section is for everything else on the page. If you use the drop-down menu you can put HTML or Markdown in this section. If you want something really fancy I suggest playing around with HTML. If you're new to this whole thing or you want to get something up quickly, I suggest Markdown, since it's easier to use and quicker to write.

In either case you should remember to put two special anchors in this document. One is `&&SYSTEM_CONTENT&&` and the other is `&&SYSTEM_LOGIN&&`. You have to type these exactly as they are here or they won't work

#####&&SYSTEM_CONTENT&&
The `&&SYSTEM_CONTENT&&` anchor is where the content of the page will go.

On the `Default.aspx` page this is where the news posts will go. If you forget to put this in your template the news items won't show up. This can be useful if you don't want your news on the front page and you're going to link to it. You can find it at on the [News Page](News.aspx).

#####&&SYSTEM_LOGIN&&
The `&&SYSTEM_LOGIN&&` anchor is where Joe_CMS will help you login or log out.

It will put a little text that will either say 'login' if you haven't logged in or 'You are currently logged in as: [your name] click here to logout.' I usually put this at the bottom of the page, since most people won't be logging into your site, but you can put it anywhere you'd like, or leave it off the site completely if you'll remember the [Login Page Address](Login.aspx).

####Header
If there is something that you need to put into the <head> tags on each page you can put it in this text box. You probably don't have to do this, but sometimes you'll have to put analytics, css or rss stuff up there. If you don't know what I'm talking about don't worry about this section (that why I put the 'header' at the bottom)


##News
As I mentioned above, the news section is for anything that you'll be adding chronologically, like a blog. You can even call it your blog if you'd like.

###Creating a new News Post
To create a new news post just browse to the [News Page](News.aspx) and click the [Add New Article](EditNews.aspx) link. That will take you another page that contains three text boxes. The first one is the Title of the post, the second is the date it should be published and the third is the body of your post.

####Title
This will can be anything and will show at the top of the page.

####Date
If you leave this blank your post will be immediately visible, and this will default to the current date and time. 

If you'd like to back-date a post put in the date you'd like in the following format: **1/30/2012 11:30:00 AM** The post will be sorted chronologically when visitors view the [News.aspx](News.aspx) page.

If you put in a future date into this field the post will not be visible to normal users until that date. It will still be visible to you, but the title will be pre-pended with '(Not Yet Published)' so you'll know you are the only person who can see it.

**A little on date formats** - If you just put a date in there (month/day/year) it'll default to 12:00:00 AM. If you're a fan of 24hr time you can use that instead of 2:00 PM. Oh and you don't have to put seconds on if you don't want to be that precise.


###Editing a News Post
To Edit a post just browse to the post by clicking on the 'read more', 'link to this article' or the title. Once you click that link you'll be taken the same page you used to create the post, but the title, date and body will be populated for you. You can choose to change anything you'd like, including the date. Just like before if you delete the date field completely it will default to the current date and time.

##Pages
Kind of like a wiki you can create as many pages on your site as you'd like. There are a few ways to create and edit pages, and like anything you can only create and edit pages if you're logged in.

###Creating a new Page
The easiest way to create a page is to browse to [Edit.aspx](Edit.aspx). On that page you can add a title, sub-title, url, and a body to your new page. You can also choose to make a page a draft (not yet visible to normal users) or private (only visible to logged in users).

####Title
This will be displayed at the top of the page.

If you're thinking about styling your pages further, it will be wrapped in an &lt;h1&gt; and it will reference the 'PageTitle' css class.

####Subtitle
This will be displayed right under the Title.

If you're thinking about styling your pages further, it will be wrapped in an &lt;h2&gt; and it will reference the 'PageSubTitle' css class.

####Url
If you want to specify a specific url you can override the default by putting something here. If you leave this blank it will automatically convert whatever you type in the Title field to a URL friendly value. If you're unsure about this, I'd leave it blank.

####Body
Pages bodies can handle HTML or Markdown. You can specify what language you're writing in using the drop down. As I mentioned above HTML is good for complex things, but [Markdown](markdown) is nice for quick pages, you can do almost all the important things in markdown (this page is written in markdown!)

**links in markdown** - usually a link in markdown looks like this `[text](url)` but I've made this a little easier so you don't have to type the whole `[text](Show.aspx?page=MyPage)` every time, instead you can just type `[text](MyPage)` and Joe_CMS will look up the right page for you.

###Editing an existing Page
When you're logged in you should see a couple of new links. If you click the one that says 'Edit this page' you'll be taken back to the page that you used to create the page with all the fields filled in. 

When you save the page again you will automatically create a new copy. You can view and revert to old copies at any time, so don't worry about messing anything up, even if you accidentally delete everything you'll still be able to get back what you had. Which leads me to:

###Viewing a Page's History
If you click the other link that says 'See Previous Versions' you'll see a list of all the previous versions and when they were saved. If you click the title of one of the versions you can see the complete text and choose to revert to that version. When you 'revert' to the previous version you're actually just creating a copy of the old version and marking that as the newest version of the page. So if you accidentally overwrite a good version of your page, just go back to the version history and revert back to the page that you were just on.

##Other Settings
There are a few other settings that you may want to change such as the name of your site, the number of news items to display on the front page, and whether or not you'd like to display social networking links on the site. You can do all of that on the [Settings](Settings.aspx) page.";

            PageIO help = new PageIO("Help", "General Administrative Help", "help", body, DateTime.Now, "Markdown", 1, false, true);
            help.SavePage();
            Response.Redirect(Request.Url.AbsolutePath);
        }

        /// <summary>
        /// This will create a markdown page and redirect the user back to this page where it will be displayed.
        /// </summary>
        private void CreateMarkdownPageAndRedirect()
        {
            string body = @"Markdown is an easy to learn way of styling text, instead of having to learn a bunch of HTML tags and remember syntax you can just write text in an intuitive way and the Markdown will make sure it is displayed properly on the page. Read on for a quickstart guide to the most commonly used Markdown Syntax, for more information you can check out the [Complete Markdown Syntax Guide, here](http://daringfireball.net/projects/markdown/syntax)

There are a few full featured Markdown editors that make creating Markdown super-easy just download one of these, then you can edit your styled text using the application :

 * [MarkdownPad](http://markdownpad.com/index.html) - An Editor for Windows
 * [Mou](http://mouapp.com/) - An Editor for Macs

**A list of [uploaded files can be found here](http://technicallylearning.org/UploadedFiles.aspx)**

---------------------------------------

Headings
======

You can easily create Headings and Subheadings by simply underlining the header text with either the equals sign (=) or minuses (-), respectively. It doesn't matter how many equals or minuses you use.

For example:

    My Header
    ==========

Will produce:

My Header
==========

And

    My Subheader
    -----------

Will produce:

My Subheader
-----------

---------------------------------------

Bold and Italics
================

Just wrap your text with a single asterisk for italics or a double asterisk for bold. For example:

    *italics*

Will Produce: 

*italics*

And 

    **bold**

Will Produce: 

**bold**

---------------------------------------

Links
========

You can create links by wrapping the text you want to show up in square brackets `[ ]` and the link path in parenthesis `( )` directly after. Example:

    [My Text](http://www.mylink.com)

Will Produce: [My Text](http://www.mylink.com)

---------------------------------------

Bulleted and Numbered Lists
========

Just start a line with either an asterisk or a number to create a list. If you use an asterisk you'll get a bullet, if you use a number you'll get a number. Don't worry about the actual numbers, Markdown will figure that out for you.

Bullets Example:

    * One
    * Two
    * Three

Will Produce:
* One
* Two
* Three

Numbers Example:

    1. One
    1. Two
    3. Three

1. One
1. Two
3. Three

Nested Lists
--------------

You can also nest either list by indenting the list with any number of spaces. Example:

    1. One
    1. Two
      1. One
      1. Two
      3. Three
    3. Three

Will Produce:

1. One
1. Two
  1. One
  1. Two
  3. Three
3. Three

---------------------------------------

Images
--------------

Images are a lot like links. You might find the Markdown syntax too limiting for what you want to do. There is no way to manage wrapping or dimensions of images in markdown. If you need to do something complicated, you should use the HTML image tag `<img>`. Markdown allows you to inject HTML throughout our document.

    ![Our Logo!](/SiteResources/Images/Logo.jpg)

Will Produce:

![Our Logo!](/SiteResources/Images/Logo.jpg)


---------------------------------------

Blockquotes
--------------

If you need to quote somebody, or pull in content from another page, you may want to use a blockquote. Blockquotes look like replied e-mails, just start each line with a `>` and you'll be all set.

    >This is a blockquote
    >with three lines
    >of text

>This is a blockquote
>with three lines
>of text

If you're feeling lazy, you can have Markdown handle the wrapping for you

    > This is a very long string of text that will wrap, but I don't
     have to worry about it because Markdown has my back! Thank you
     Markdown.

> This is a very long string of text that will wrap, but I don't have  to worry about it because Markdown has my back! Thank you Markdown.

But what if you want to quote a large block of text, and you don't want to put all the little less thans in there? Just start the text with one, and don't put any lines between

    >This is a blockquote
    with three lines
    of text

>This is a blockquote
with three lines
of text";
            PageIO markdown = new PageIO("Markdown", "A Markdown Primer", "markdown", body, DateTime.Now, "Markdown", 1, false, true);
            markdown.SavePage();

            Response.Redirect(Request.Url.AbsolutePath);

        }
    }
}