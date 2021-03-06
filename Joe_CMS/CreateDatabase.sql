/****** Object:  Table [dbo].[Session]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [uniqueidentifier] NOT NULL,
	[UserID] [int] NOT NULL,
	[TimeSignedIn] [datetime] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](512) NULL,
	[SubTitle] [nvarchar](512) NULL,
	[URLTitle] [nvarchar](512) NULL,
	[Body] [text] NULL,
	[Updated] [datetime] NULL,
	[ContentType] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[IsDraft] [bit] NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](512) NULL,
	[Body] [text] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[LogTitle] [nvarchar](255) NULL,
	[EventTime] [datetime] NOT NULL,
	[source] [nvarchar](50) NULL,
	[LogBody] [text] NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PasswordHash] [char](128) NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[email] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 02/15/2012 18:55:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](255) NOT NULL,
	[Description] [text] NOT NULL,
	[SettingKey] [nvarchar](255) NOT NULL,
	[SettingValue] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SetSetting]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetSetting] 
	-- Add the parameters for the stored procedure here
	@SettingKey as nvarchar(255),
	@SettingValue as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Settings SET SettingValue=@SettingValue WHERE SettingKey=@SettingKey
	IF @@ROWCOUNT=0
		INSERT INTO Settings (SettingKey, SettingValue) VALUES (@SettingKey, @SettingValue)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdatePassword]
	@UserID as int,
	@PasswordHash as nvarchar(128)
AS
	Update [user] set PasswordHash = @PasswordHash
	where UserID = @UserID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateNews]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNews] 
	@ID as int,
	@Title nvarchar(512),
	@Body text, 
	@Updated datetime, 
	@UpdatedBy int
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE News set
    Title = @Title, Body = @Body, Updated = @Updated, UpdatedBy = @UpdatedBy
    WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DestroySession]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DestroySession]
	@Session as UniqueIdentifier
AS
	DELETE FROM [Session]
	WHERE SessionID = @Session
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[DeleteNews]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteNews]
	@ID as int
AS
	DELETE FROM News
	WHERE ID = @ID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateUser]
	@UserName as nvarchar(50),
	@PasswordHash as char(128), 
	@TimeCreated as DateTime,
	@Active as bit, 
	@email as nvarchar(500)
AS
	Insert INTO [User] (UserName, PasswordHash, TimeCreated, Active, email)
	VALUES (@UserName, @Passwordhash, @TimeCreated, @Active, @email);
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CreateSession]
	@UserID as int,
	@Session as UniqueIdentifier,
	@TimeSignedIn as DateTime
AS
	INSERT INTO [Session] (SessionID, UserID, TimeSignedIn)
	VALUES (@Session, @UserID, @TimeSignedIn);
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreatePage]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePage]
	@Title nvarchar(512),
	@SubTitle nvarchar(512),
	@URLTitle nvarchar(512),
	@Body text, 
	@Updated datetime, 
	@ContentType nvarchar(50),
	@UpdatedBy int,
	@IsDraft bit,
	@IsPrivate bit
AS
	INSERT INTO [Pages] Values
	(@Title, @SubTitle, @URLTitle, @Body, @Updated, @ContentType, @UpdatedBy, @IsDraft, @IsPrivate)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreateNews]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNews]
	@Title nvarchar(512),
	@Body text, 
	@Updated datetime, 
	@UpdatedBy int
AS
	INSERT INTO News Values
	(@Title, @Body, @Updated, @UpdatedBy);
	
	SELECT SCOPE_IDENTITY();
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateEvent]
	@LogTitle as nvarchar(255),
	@EventTime as DateTime,
	@Source as nvarchar(50), 
	@LogBody as text
AS
	INSERT INTO EventLog (LogTitle, EventTime, Source, LogBody) 
	VALUES (@LogTitle, @EventTime, @Source, @LogBody)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CheckUserExists]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CheckUserExists]
	@UserName as nvarchar(50)
AS
	SELECT * FROM [User]
	WHERE UserName = @UserName;
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckUser]
	@UserName as nvarchar(50),
	@PasswordHash as char(128)
AS
	SELECT * FROM [User]
	WHERE @UserName = UserName AND @PasswordHash = PasswordHash AND Active = 1;
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CheckSession]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckSession]
	@Session as UniqueIdentifier
AS
	SELECT * FROM Session
	WHERE  SessionID = @Session
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[LookupUsername]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[LookupUsername]
	@UserID as int
AS
	SELECT UserName from [User]
	WHERE UserID = @UserID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetUserIDBySession]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIDBySession]
	@SessionID uniqueidentifier
AS
	SELECT UserID FROM Session
	WHERE @SessionID = SessionID
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByID]
	@UserID int
AS
	Select UserName from [User] 
	WHERE UserID = @UserID;
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetSetting]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSetting] 
	-- Add the parameters for the stored procedure here
	@SettingKey as nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SettingValue FROM Settings WHERE SettingKey = @SettingKey
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecentPage]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecentPage]
	@URLTitle nvarchar(512)
AS
	SELECT TOP 1 * FROM [Pages]
	WHERE URLTitle = @URLTitle
	ORDER BY Updated DESC
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetRecentNews]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecentNews]
	@Count int,
	@ShowFutureEvents bit
AS
	IF @ShowFutureEvents = 1
		SELECT TOP (@Count) * FROM News
		ORDER BY Updated DESC
	ELSE
		SELECT TOP (@Count) * FROM News
		WHERE News.Updated < CURRENT_TIMESTAMP
		ORDER BY Updated DESC	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetPageVersion]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPageVersion]
	@URLTitle as nvarchar(512),
	@Updated as datetime
AS
	SELECT * FROM Pages
	WHERE (URLTitle = @URLTitle) 
	AND (Updated > @Updated) 
	AND (Updated < DATEADD(ss, 1, @Updated))
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetPageHistory]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPageHistory]
	@URLTitle as nvarchar(512)
AS
	SELECT * FROM Pages
	WHERE URLTitle = @URLTitle
	ORDER BY Updated DESC
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetNewsByID]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNewsByID]
	@NewsID int
AS
	SELECT * FROM News
	WHERE News.ID = @NewsID;
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetCompleteSetting]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCompleteSetting]
	-- Add the parameters for the stored procedure here
	@SettingKey as nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Settings WHERE SettingKey = @SettingKey
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMostRecentPages]    Script Date: 02/15/2012 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMostRecentPages]
AS
	select t1.* from (select URLTitle, max(Updated) AS MaxUpdated
from  Pages
group by URLTitle) t2
join Pages t1 on t2.URLTitle = t1.URLTitle
and t2.MaxUpdated= t1.Updated
	RETURN
GO
/****** Object:  Default [DF_Pages_IsPrivate]    Script Date: 02/15/2012 18:55:37 ******/
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_Pages_IsPrivate]  DEFAULT ((0)) FOR [IsPrivate]
GO
/****** Object:  Default [DF_Settings_FriendlyName]    Script Date: 02/15/2012 18:55:37 ******/
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_FriendlyName]  DEFAULT (' ') FOR [FriendlyName]
GO
/****** Object:  Default [DF_Settings_Description]    Script Date: 02/15/2012 18:55:37 ******/
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_Description]  DEFAULT (' ') FOR [Description]
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 02/15/2012 19:04:30 ******/
SET IDENTITY_INSERT [dbo].[Settings] ON
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (1, N'Email Server', N'Your e-mail server', N'emailServer', N'pop.DEMO.ccc')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (2, N'News Items on Front Page', N'The number of news items to be displayed on the homepage (Default.aspx)', N'NewsCountFront', N'5')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (3, N'Default StyleSheet', N'This stylesheet will be applied to any page that doesn''t specify another stylesheet', N'DefaultStyleSheet', N'/SiteResources/stylesheet.css')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (4, N'Site Name', N'This is the site''s name, it will be used throughout the website any time there is a reference to the title of the site.', N'SiteName', N'Joe_CMS')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (5, N'News Title', N'This is the title of the News page (News.aspx).', N'NewsTitle', N'NewBlogName')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (6, N'Authorization Code', N'Users will be required to enter this authorization code when they register. If this is left blank no Authorization code will be required (to allow for open registration).', N'AuthCode', N'superman')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (7, N'Support e-mail address', N'This e-mail address will be displayed when an error occurs to allow users to contact you.', N'SupportMail', N'support@DEMO.CCC')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (8, N'NoReply e-mail address', N'This is the e-mail address that will show up on any automated e-mail from the syste (to reset password, register, etc.)', N'noReplyEmailUser', N'noreply@DEMO.CCC')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (9, N'NoReply e-mail password', N'This is the password to send e-mail from this account', N'noReplyEmailPass', N'DEMOPASS')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (10, N'Username Regular Expression', N'This Regular Expression will be used to validate usernames. Leave this blank for the default.', N'UsernameRegex', N'^[a-zA-Z0-9_\.\-]{3,}$')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (11, N'Invalid Username', N'This message will be displayed to users if their username is not valid based on the "Username Regular Expression"', N'UsernameFailedMatchMessage', N'Usernames must be greater than three characters and only contain only a-z 0-9, _, -, .')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (12, N'e-mail Regular Expression', N'This Regular Expression will be used to validate user''s e-mail addresses. Leave this blank for the default.', N'emailRegex', N'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (13, N'Invalid e-mail', N'This message will be displayed if their e-mail address is not valid based on the e-mail Regular Expression.', N'EmailFailedMatchMessage', N'The e-mail address you entered doesn''t seem to be valid.')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (14, N'Send Welcome e-mail', N'Whether or not the system should send an e-mail when new users register on the system', N'SendWelcomeMail', N'False')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (15, N'NoReply e-mail username', N'This is the e-mail username to send e-mail.', N'noReplyEmail', N'noreply')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (16, N'News Story Length on Front Page', N'The length in characters of the news story on the front page.', N'TruncatedNewsFront', N'500')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (17, N'News Items Per Page', N'The number of news items that will be displayed per page', N'NewsItemsPerPage', N'1')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (18, N'News Story Lengh on News Page', N'The length in characters of the news stories on the news page', N'TruncatedNews', N'1500')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (19, N'Add Social Links', N'Set to true to add social networking links to each page automatically', N'AddSocialLinks', N'True')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (20, N'Social HTML Code', N'This HTML Code will be added to each page if Add Social Links is true. Add <strong>{0}</strong> where the page''s URL should go.', N'SocialHTMLCode', N'<div class="fb-like" data-href="{0}" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>')
SET IDENTITY_INSERT [dbo].[Settings] OFF


/*Default Page*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           ('Home'
           ,''
           ,'System_Default'
           ,'<div class="BodyWrapper">
    <h1>Welcome</h1>
    <div>
        Welcome to your start page of Joe_CMS, the easiest CMS to administer. You can get started by creating a user, logging in and clicking this
        <a href="EditDefault.aspx">Edit This Page</a> button or the one at the bottom of the page.</div>

        <h2>News:</h2>
        <div>
            &&SYSTEM_CONTENT&&
        </div>
        &&SYSTEM_LOGIN&&
    </div> 
</div>'
           ,'2012-02-19 18:19:40.110'
           ,'HTML'
           ,0
           ,0
           ,1)
GO


/*Help*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           ('Help'
           ,'General Administrative Help'
           ,'help'
           ,'Nice work, you''ve registered yourself and it looks like everything went swimmingly! On this page you''ll find some help on how to modify Joe_CMS and make it yours. You can even edit this page! If you''d like you can bookmark this page to return to it at any time.

##Intro

Joe_CMS is split into three different major areas:

 * Default.aspx - This is the first page people will see when they arrive on your site. You can edit it and it will pull styles from the css file, but it''s a special page in that it can display your news or blog items in the middle.
 * News.aspx - I call this section ''News,'' but you may think of it as your blog. I like to use it to post chronological items like updates to the site, new insights or each time I meet The President.
 * All Other Pages - All the other pages are up to you to create. They all follow the pattern `Show.aspx?page=MyPageName`. The ''MyPageName'' bit tells the system which page you''re requesting. As an administrator you can create as many of these as you''d like. Please feel free to edit these as often as you''d like, Joe_CMS automatically keeps a history of every save, so if you make a mistake you can easily go back.

That''s about it. If you can remember those things everything else should be a breeze.

##Templates
I think the Joe_CMS templating system is pretty easy to understand, I''ve tried to reduce as much complexity as possible. First of all, if you like the way the site looks now, there''s nothing more for you to do. If you do want to change the theme, read on.

*note: for all of this stuff you''ll have to be logged in, so be sure to do that before proceeding*

###Default.aspx
As I mentioned earlier, Default.aspx is a bit of a special page. That means that it doesn''t follow the same template as the rest of the site. Just click the link at the very bottom of the page that says ''Edit This Page''

That will take you to another page that has three main sections: The Title, Body and Header.

####Title
The title is the title of this page. This title will show up just for this page. You might want to call it something like ''Welcome to My Website'' or something like that.

####Body
The Body section is for everything else on the page. If you use the drop-down menu you can put HTML or Markdown in this section. If you want something really fancy I suggest playing around with HTML. If you''re new to this whole thing or you want to get something up quickly, I suggest Markdown, since it''s easier to use and quicker to write.

In either case you should remember to put two special anchors in this document. One is `&&SYSTEM_CONTENT&&` and the other is `&&SYSTEM_LOGIN&&`. You have to type these exactly as they are here or they won''t work

#####&&SYSTEM_CONTENT&&
The `&&SYSTEM_CONTENT&&` anchor is where the content of the page will go.

On the `Default.aspx` page this is where the news posts will go. If you forget to put this in your template the news items won''t show up. This can be useful if you don''t want your news on the front page and you''re going to link to it. You can find it at on the [News Page](News.aspx).

#####&&SYSTEM_LOGIN&&
The `&&SYSTEM_LOGIN&&` anchor is where Joe_CMS will help you login or log out.

It will put a little text that will either say ''login'' if you haven''t logged in or ''You are currently logged in as: [your name] click here to logout.'' I usually put this at the bottom of the page, since most people won''t be logging into your site, but you can put it anywhere you''d like, or leave it off the site completely if you''ll remember the [Login Page Address](Login.aspx).

####Header
If there is something that you need to put into the <head> tags on each page you can put it in this text box. You probably don''t have to do this, but sometimes you''ll have to put analytics, css or rss stuff up there. If you don''t know what I''m talking about don''t worry about this section (that why I put the ''header'' at the bottom)


##News
As I mentioned above, the news section is for anything that you''ll be adding chronologically, like a blog. You can even call it your blog if you''d like.

###Creating a new News Post
To create a new news post just browse to the [News Page](News.aspx) and click the [Add New Article](EditNews.aspx) link. That will take you another page that contains three text boxes. The first one is the Title of the post, the second is the date it should be published and the third is the body of your post.

####Title
This will can be anything and will show at the top of the page.

####Date
If you leave this blank your post will be immediately visible, and this will default to the current date and time. 

If you''d like to back-date a post put in the date you''d like in the following format: **1/30/2012 11:30:00 AM** The post will be sorted chronologically when visitors view the [News.aspx](News.aspx) page.

If you put in a future date into this field the post will not be visible to normal users until that date. It will still be visible to you, but the title will be pre-pended with ''(Not Yet Published)'' so you''ll know you are the only person who can see it.

**A little on date formats** - If you just put a date in there (month/day/year) it''ll default to 12:00:00 AM. If you''re a fan of 24hr time you can use that instead of 2:00 PM. Oh and you don''t have to put seconds on if you don''t want to be that precise.


###Editing a News Post
To Edit a post just browse to the post by clicking on the ''read more'', ''link to this article'' or the title. Once you click that link you''ll be taken the same page you used to create the post, but the title, date and body will be populated for you. You can choose to change anything you''d like, including the date. Just like before if you delete the date field completely it will default to the current date and time.

##Pages
Kind of like a wiki you can create as many pages on your site as you''d like. There are a few ways to create and edit pages, and like anything you can only create and edit pages if you''re logged in.

###Creating a new Page
The easiest way to create a page is to browse to [Edit.aspx](Edit.aspx). On that page you can add a title, sub-title, url, and a body to your new page. You can also choose to make a page a draft (not yet visible to normal users) or private (only visible to logged in users).

####Title
This will be displayed at the top of the page.

If you''re thinking about styling your pages further, it will be wrapped in an &lt;h1&gt; and it will reference the ''PageTitle'' css class.

####Subtitle
This will be displayed right under the Title.

If you''re thinking about styling your pages further, it will be wrapped in an &lt;h2&gt; and it will reference the ''PageSubTitle'' css class.

####Url
If you want to specify a specific url you can override the default by putting something here. If you leave this blank it will automatically convert whatever you type in the Title field to a URL friendly value. If you''re unsure about this, I''d leave it blank.

####Body
Pages bodies can handle HTML or Markdown. You can specify what language you''re writing in using the drop down. As I mentioned above HTML is good for complex things, but [Markdown](markdown) is nice for quick pages, you can do almost all the important things in markdown (this page is written in markdown!)

**links in markdown** - usually a link in markdown looks like this `[text](url)` but I''ve made this a little easier so you don''t have to type the whole `[text](Show.aspx?page=MyPage)` every time, instead you can just type `[text](MyPage)` and Joe_CMS will look up the right page for you.

###Editing an existing Page
When you''re logged in you should see a couple of new links. If you click the one that says ''Edit this page'' you''ll be taken back to the page that you used to create the page with all the fields filled in. 

When you save the page again you will automatically create a new copy. You can view and revert to old copies at any time, so don''t worry about messing anything up, even if you accidentally delete everything you''ll still be able to get back what you had. Which leads me to:

###Viewing a Page''s History
If you click the other link that says ''See Previous Versions'' you''ll see a list of all the previous versions and when they were saved. If you click the title of one of the versions you can see the complete text and choose to revert to that version. When you ''revert'' to the previous version you''re actually just creating a copy of the old version and marking that as the newest version of the page. So if you accidentally overwrite a good version of your page, just go back to the version history and revert back to the page that you were just on.

##Other Settings
There are a few other settings that you may want to change such as the name of your site, the number of news items to display on the front page, and whether or not you''d like to display social networking links on the site. You can do all of that on the [Settings](Settings.aspx) page.'
           ,'2012-02-19 18:19:40.110'
           ,'Markdown'
           ,0
           ,0
           ,1)
GO


/*Markdown help*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           ('Markdown'
           ,'A Markdown Primer'
           ,'Markdown'
           ,'Markdown is an easy to learn way of styling text, instead of having to learn a bunch of HTML tags and remember syntax you can just write text in an intuitive way and the Markdown will make sure it is displayed properly on the page. Read on for a quickstart guide to the most commonly used Markdown Syntax, for more information you can check out the [Complete Markdown Syntax Guide, here](http://daringfireball.net/projects/markdown/syntax)

There are a few full featured Markdown editors that make creating Markdown super-easy just download one of these, then you can edit your styled text using the application :

 * [MarkdownPad](http://markdownpad.com/index.html) - An Editor for Windows
 * [Mou](http://mouapp.com/) - An Editor for Macs

**A list of [uploaded files can be found here](http://technicallylearning.org/UploadedFiles.aspx)**

---------------------------------------

Headings
======

You can easily create Headings and Subheadings by simply underlining the header text with either the equals sign (=) or minuses (-), respectively. It doesn''t matter how many equals or minuses you use.

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

Just start a line with either an asterisk or a number to create a list. If you use an asterisk you''ll get a bullet, if you use a number you''ll get a number. Don''t worry about the actual numbers, Markdown will figure that out for you.

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

    ![Snow, by Joe Basirico[http://farm8.staticflickr.com/7159/6608581857_ab49f2ff15.jpg)

Will Produce:

![Snow, by Joe Basirico](http://farm8.staticflickr.com/7159/6608581857_ab49f2ff15.jpg)


---------------------------------------

Blockquotes
--------------

If you need to quote somebody, or pull in content from another page, you may want to use a blockquote. Blockquotes look like replied e-mails, just start each line with a `>` and you''ll be all set.

    >This is a blockquote
    >with three lines
    >of text

>This is a blockquote
>with three lines
>of text

If you''re feeling lazy, you can have Markdown handle the wrapping for you

    > This is a very long string of text that will wrap, but I don''t
     have to worry about it because Markdown has my back! Thank you
     Markdown.

> This is a very long string of text that will wrap, but I don''t have  to worry about it because Markdown has my back! Thank you Markdown.

But what if you want to quote a large block of text, and you don''t want to put all the little less thans in there? Just start the text with one, and don''t put any lines between

    >This is a blockquote
    with three lines
    of text

>This is a blockquote
with three lines
of text'
           ,'2012-02-19 18:19:40.110'
           ,'Markdown'
           ,0
           ,0
           ,1)
GO

/*Default CSS*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           (''
           ,''
           ,'System_CSS'
           ,'/*=========================================
Site-wide Styles
http://kuler.adobe.com/#themeID/15325
=========================================*/
body
{
    background-color: #002F2F;
     font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;}

h1
{
    font-family: Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif;
    text-transform: capitalize;
}

h2
{
    font-family: Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif;
}

h3
{
    font-family: Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif;
}

h4
{
    font-family: Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif;
}

a
{
    color: #046380;
    text-decoration:none;
}

a :hover
{
    color: #012834;
}

div
{
}

p
{
}

.Message
{
    color: Red;
    font-weight: bold;
}

.BodyWrapper
{
    width: 800px;
    padding: 10px;
    padding-left: 100px;
    background-color: White;
    border: 2px solid #A7A37E;
    margin: 10px auto 10px auto;
}

/*=========================================
Default.aspx Styles
=========================================*/
/*-----------------------------------------
Default News Styles
-----------------------------------------*/
/*Wraps each news item on the front page*/
.DefaultNewsWrap
{
    padding-bottom: 20px;
    margin-bottom: 5px;
    border-bottom: 1px solid #046380
}

/*The Title of each news item on the front page*/
.DefaultNewsTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 18pt;
    font-weight: bold;
    text-transform: capitalize;
}

.DefaultNewsSubTitle
{
    font-style: italic;
    background-color: #EFECCA
}

/*The body of each news item on the front page*/
.DefaultNewsBody
{
    
}
/*-----------------------------------------
Default.aspx Styles for editing the page
-----------------------------------------*/
/*This wraps the Title Text box on the edit Default.aspx page*/
.DefaultEditTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 22px;
    font-weight: bold;
    border: 5px solid #ddd;
    padding: 10px;
    width: 80%;
}

/*This wraps the Body textbox on the edit Default.aspx page*/
.EditDefaultBody
{
    padding: 10px;
    border: 5px solid #ddd;
    width: 80%;
    height: 350px;
}

/*This wraps the Header textbox on the edit Default.aspx page*/
.EditDefaultHeader
{
    padding: 10px;
    border: 5px solid #ddd;
    width: 80%;
    height: 150px;
}

.EditDefaultUploadLinks
{

}

.EditDefaultAdminButtons
{

}

/*=========================================
News.aspx Styles
=========================================*/
/*The News Page''s Title at the top of the page*/
.NewsTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 22px;
}

.NewsAdminButtons
{
}

.NewsBody
{
}

.NewsDateAutor
{
}
/*=========================================
EditNews.aspx Styles
=========================================*/
/*The News Page''s Title at the top of the page*/
.EditNewsTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 22px;
    font-weight: bold;
    border: 5px solid #ddd;
    padding: 10px;
    width: 80%;
}

/*Things like the markdown links and upload files link*/
.EditNewsAdminButtons
{
}


.EditNewsUploadLinks
{
    width: 80%;
}

.EditNewsBody
{
    padding: 10px;
    border: 5px solid #ddd;
    width: 80%;
    height: 350px;
}


/*=========================================
Edit.aspx Styles
=========================================*/
.EditPageTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 22px;
    font-weight: bold;
    border: 5px solid #ddd;
    padding: 10px;
    width: 80%;
}

.EditPageSubtitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 18px;
    font-weight: bold;
    border: 5px solid #ddd;
    padding: 10px;
    width: 80%;
}

.EditPageURL
{
}

.EditUploadLinks
{
}

.EditPageBody
{
    padding: 10px;
    border: 5px solid #ddd;
    width: 80%;
    height: 350px;
}

/*=========================================
Show.aspx Styles
=========================================*/
.PageTitle
{
}

.PageSubTitle
{
    font-family: Cambria, "Hoefler Text", Utopia, "Liberation Serif", "Nimbus Roman No9 L Regular", Times, "Times New Roman", serif;
    font-size: 18px;
    font-weight: bold;
}

.PageBody
{
}

.PageFooter
{
}

/*=========================================
EditCSS.aspx
==========================================*/
.CSSTextBox
{
   font-family: "Anonymous Pro", Consolas, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", Monaco, "Courier New", Courier, monospace;
   width: 90%;
   height: 400px;
}

'
           ,'2012-02-19 18:19:40.110'
           ,'HTML'
           ,0
           ,0
           ,1)
GO

/*Default MasterPage*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           ('Home'
           ,''
           ,'System_Master'
           ,'<div class="BodyWrapper">
&&SYSTEM_CONTENT&& 
</div>'
           ,'2012-02-19 18:19:40.110'
           ,'HTML'
           ,0
           ,0
           ,1)
GO

/*Default Header*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           (''
           ,''
           ,'System_Default_Header'
           ,'<div id="fb-root"></div>
<script>(function(d, s, id) {
     var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, ''script'', ''facebook-jssdk''));</script>'
           ,'2012-02-19 18:19:40.110'
           ,'HTML'
           ,0
           ,0
           ,1)
GO

/*Default Header*/
INSERT INTO [dbo].[Pages]
           ([Title]
           ,[SubTitle]
           ,[URLTitle]
           ,[Body]
           ,[Updated]
           ,[ContentType]
           ,[UpdatedBy]
           ,[IsDraft]
           ,[IsPrivate])
     VALUES
           (''
           ,''
           ,'System_Master_Header'
           ,'<div id="fb-root"></div>
<script>(function(d, s, id) {
     var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, ''script'', ''facebook-jssdk''));</script>'
           ,'2012-02-19 18:19:40.110'
           ,'HTML'
           ,0
           ,0
           ,1)
GO