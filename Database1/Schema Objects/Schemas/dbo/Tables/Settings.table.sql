CREATE TABLE [dbo].[Settings](
	[ID] [int] NOT NULL,
	[SettingKey] [nvarchar](255) NOT NULL,
	[SettingValue] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]