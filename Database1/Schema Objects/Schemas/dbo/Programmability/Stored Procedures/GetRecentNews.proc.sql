CREATE PROCEDURE [dbo].[GetRecentNews]
	@Count int
AS
	SELECT TOP (@Count) * FROM News
	ORDER BY Updated DESC
	RETURN


