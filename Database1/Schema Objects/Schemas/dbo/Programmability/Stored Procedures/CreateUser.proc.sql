create PROCEDURE [dbo].[CreateUser]
	@UserName as nvarchar(50),
	@PasswordHash as char(128), 
	@TimeCreated as DateTime,
	@Active as bit, 
	@email as nvarchar(500)
AS
	Insert INTO [User] (UserName, PasswordHash, TimeCreated, Active, email)
	VALUES (@UserName, @Passwordhash, @TimeCreated, @Active, @email);
	RETURN


