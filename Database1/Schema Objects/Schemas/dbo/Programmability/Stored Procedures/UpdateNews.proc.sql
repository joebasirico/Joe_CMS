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


