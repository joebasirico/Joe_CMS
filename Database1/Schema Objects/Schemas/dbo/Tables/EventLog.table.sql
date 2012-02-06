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


