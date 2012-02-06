CREATE PROCEDURE [dbo].[DeleteNews]
	@ID as int
AS
	DELETE FROM News
	WHERE ID = @ID
	RETURN


