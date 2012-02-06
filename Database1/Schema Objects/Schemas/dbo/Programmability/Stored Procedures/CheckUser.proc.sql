Create PROCEDURE [dbo].[CheckUser]
	@UserName as nvarchar(50),
	@PasswordHash as char(128)
AS
	SELECT * FROM [User]
	WHERE @UserName = UserName AND @PasswordHash = PasswordHash AND Active = 1;
	RETURN


