CREATE PROCEDURE [dbo].[GetAllMostRecentPages]
AS
	select t1.* from (select URLTitle, max(Updated) AS MaxUpdated
from  Pages
group by URLTitle) t2
join Pages t1 on t2.URLTitle = t1.URLTitle
and t2.MaxUpdated= t1.Updated
	RETURN


