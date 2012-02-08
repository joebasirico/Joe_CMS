CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SettingKey] [nvarchar](255) NOT NULL,
	[SettingValue] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]