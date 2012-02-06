create PROCEDURE [dbo].[UpdatePassword]
	@UserID as int,
	@PasswordHash as nvarchar(128)
AS
	Update [user] set PasswordHash = @PasswordHash
	where UserID = @UserID
	RETURN


