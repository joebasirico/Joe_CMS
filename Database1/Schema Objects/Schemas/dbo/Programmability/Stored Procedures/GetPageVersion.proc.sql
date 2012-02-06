CREATE PROCEDURE [dbo].[GetPageVersion]
	@URLTitle as nvarchar(512),
	@Updated as datetime
AS
	SELECT * FROM Pages
	WHERE (URLTitle = @URLTitle) 
	AND (Updated > @Updated) 
	AND (Updated < DATEADD(ss, 1, @Updated))
	RETURN


