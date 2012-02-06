CREATE PROCEDURE [dbo].[CreateNews]
	@Title nvarchar(512),
	@Body text, 
	@Updated datetime, 
	@UpdatedBy int
AS
	INSERT INTO News Values
	(@Title, @Body, @Updated, @UpdatedBy);
	RETURN


