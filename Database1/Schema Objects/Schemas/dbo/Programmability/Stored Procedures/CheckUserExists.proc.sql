create PROCEDURE [dbo].[CheckUserExists]
	@UserName as nvarchar(50)
AS
	SELECT * FROM [User]
	WHERE UserName = @UserName;
	RETURN


