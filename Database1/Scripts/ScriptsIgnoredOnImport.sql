
/***
Note: This expects that the database you're populating already exists
This script will only create the tables and stored procedures in the database. 

So if you haven't done so already please go back and create the database, 
connect to it, and run this script on that database.

Once that's done don't forget to change the connection string in the web.config
(in your VS project or website)
***/

/****** Object:  Table [dbo].[Session]    Script Date: 07/14/2011 18:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 07/14/2011 18:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[News]    Script Date: 07/14/2011 18:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 07/14/2011 18:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/14/2011 18:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[UpdateNews]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[DestroySession]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[DeleteNews]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CreatePage]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CreateNews]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CheckUserExists]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CheckUser]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[CheckSession]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[LookupUsername]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetUserIDBySession]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetRecentPage]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetRecentNews]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetPageVersion]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetPageHistory]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetNewsByID]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetAllMostRecentPages]    Script Date: 07/14/2011 18:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
