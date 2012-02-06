CREATE PROCEDURE [dbo].[GetRecentPage]
	@URLTitle nvarchar(512)
AS
	SELECT TOP 1 * FROM [Pages]
	WHERE URLTitle = @URLTitle
	ORDER BY Updated DESC
	RETURN


