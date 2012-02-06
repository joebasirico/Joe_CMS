create PROCEDURE [dbo].[LookupUsername]
	@UserID as int
AS
	SELECT UserName from [User]
	WHERE UserID = @UserID
	RETURN


