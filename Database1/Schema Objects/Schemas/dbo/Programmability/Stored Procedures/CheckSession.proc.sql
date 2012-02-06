Create PROCEDURE [dbo].[CheckSession]
	@Session as UniqueIdentifier
AS
	SELECT * FROM Session
	WHERE  SessionID = @Session
	RETURN


