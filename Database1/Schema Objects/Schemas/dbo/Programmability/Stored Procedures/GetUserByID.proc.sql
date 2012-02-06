CREATE PROCEDURE [dbo].[GetUserByID]
	@UserID int
AS
	Select UserName from [User] 
	WHERE UserID = @UserID;
	RETURN


