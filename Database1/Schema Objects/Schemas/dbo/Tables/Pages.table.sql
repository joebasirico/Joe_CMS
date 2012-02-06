﻿CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](512) NULL,
	[SubTitle] [nvarchar](512) NULL,
	[URLTitle] [nvarchar](512) NULL,
	[Body] [text] NULL,
	[Updated] [datetime] NULL,
	[ContentType] [nvarchar](50) NULL,
	[UpdatedBy] [int] NULL,
	[IsDraft] [bit] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


