CREATE TABLE [dbo].[Session](
	[SessionID] [uniqueidentifier] NOT NULL,
	[UserID] [int] NOT NULL,
	[TimeSignedIn] [datetime] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


