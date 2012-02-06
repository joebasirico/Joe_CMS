Create PROCEDURE [dbo].[CreateSession]
	@UserID as int,
	@Session as UniqueIdentifier,
	@TimeSignedIn as DateTime
AS
	INSERT INTO [Session] (SessionID, UserID, TimeSignedIn)
	VALUES (@Session, @UserID, @TimeSignedIn);
	RETURN


