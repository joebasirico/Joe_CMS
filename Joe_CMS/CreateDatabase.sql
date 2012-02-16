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
	@Count int
AS
	SELECT TOP (@Count) * FROM News
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
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (30, N'Email Server', N'Your e-mail server', N'emailServer', N'pop.DEMO.ccc')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (31, N'News Items on Front Page', N'The number of news items to be displayed on the homepage (Default.aspx)', N'NewsCountFront', N'5')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (12, N'Default StyleSheet', N'This stylesheet will be applied to any page that doesn''t specify another stylesheet', N'DefaultStyleSheet', N'/SiteResources/stylesheet.css')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (13, N'Site Name', N'This is the site''s name, it will be used throughout the website any time there is a reference to the title of the site.', N'SiteName', N'Joe_CMS')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (14, N'News Title', N'This is the title of the News page (News.aspx).', N'NewsTitle', N'NewBlogName')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (15, N'Authorization Code', N'Users will be required to enter this authorization code when they register. If this is left blank no Authorization code will be required (to allow for open registration).', N'AuthCode', N'superman')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (16, N'Support e-mail address', N'This e-mail address will be displayed when an error occurs to allow users to contact you.', N'SupportMail', N'support@DEMO.CCC')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (17, N'NoReply e-mail address', N'This is the e-mail address that will show up on any automated e-mail from the syste (to reset password, register, etc.)', N'noReplyEmailUser', N'noreply@DEMO.CCC')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (18, N'NoReply e-mail password', N'This is the password to send e-mail from this account', N'noReplyEmailPass', N'DEMOPASS')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (19, N'Username Regular Expression', N'This Regular Expression will be used to validate usernames. Leave this blank for the default.', N'UsernameRegex', N'^[a-zA-Z0-9_\.\-]{3,}$')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (20, N'Invalid Username', N'This message will be displayed to users if their username is not valid based on the "Username Regular Expression"', N'UsernameFailedMatchMessage', N'Usernames must be greater than three characters and only contain only a-z 0-9, _, -, .')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (21, N'e-mail Regular Expression', N'This Regular Expression will be used to validate user''s e-mail addresses. Leave this blank for the default.', N'emailRegex', N'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (22, N'Invalid e-mail', N'This message will be displayed if their e-mail address is not valid based on the e-mail Regular Expression.', N'EmailFailedMatchMessage', N'The e-mail address you entered doesn''t seem to be valid.')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (23, N'Send Welcome e-mail', N'Whether or not the system should send an e-mail when new users register on the system', N'SendWelcomeMail', N'True')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (24, N'NoReply e-mail username', N'This is the e-mail username to send e-mail.', N'noReplyEmail', N'noreply')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (25, N'News Story Length on Front Page', N'The length in characters of the news story on the front page.', N'TruncatedNewsFront', N'500')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (26, N'News Items Per Page', N'The number of news items that will be displayed per page', N'NewsItemsPerPage', N'1')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (27, N'News Story Lengh on News Page', N'The length in characters of the news stories on the news page', N'TruncatedNews', N'1500')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (28, N'Add Social Links', N'Set to true to add social networking links to each page automatically', N'AddSocialLinks', N'True')
INSERT [dbo].[Settings] ([ID], [FriendlyName], [Description], [SettingKey], [SettingValue]) VALUES (29, N'Social HTML Code', N'This HTML Code will be added to each page if Add Social Links is true. Add <strong>{0}</strong> where the page''s URL should go.', N'SocialHTMLCode', N'<div class="fb-like" data-href="{0}" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>')
SET IDENTITY_INSERT [dbo].[Settings] OFF

