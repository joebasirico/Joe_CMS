create PROCEDURE [dbo].[DestroySession]
	@Session as UniqueIdentifier
AS
	DELETE FROM [Session]
	WHERE SessionID = @Session
	RETURN


