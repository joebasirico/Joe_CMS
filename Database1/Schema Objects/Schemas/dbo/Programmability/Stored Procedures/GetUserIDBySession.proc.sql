CREATE PROCEDURE [dbo].[GetUserIDBySession]
	@SessionID uniqueidentifier
AS
	SELECT UserID FROM Session
	WHERE @SessionID = SessionID
	RETURN


