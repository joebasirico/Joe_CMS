CREATE PROCEDURE [dbo].[GetPageHistory]
	@URLTitle as nvarchar(512)
AS
	SELECT * FROM Pages
	WHERE URLTitle = @URLTitle
	ORDER BY Updated DESC
	RETURN


