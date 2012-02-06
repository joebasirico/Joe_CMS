CREATE PROCEDURE [dbo].[CreatePage]
	@Title nvarchar(512),
	@SubTitle nvarchar(512),
	@URLTitle nvarchar(512),
	@Body text, 
	@Updated datetime, 
	@ContentType nvarchar(50),
	@UpdatedBy int,
	@IsDraft bit
AS
	INSERT INTO [Pages] Values
	(@Title, @SubTitle, @URLTitle, @Body, @Updated, @ContentType, @UpdatedBy, @IsDraft)
	RETURN


