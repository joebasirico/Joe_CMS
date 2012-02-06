CREATE PROCEDURE [dbo].[GetNewsByID]
	@NewsID int
AS
	SELECT * FROM News
	WHERE News.ID = @NewsID;
	RETURN


