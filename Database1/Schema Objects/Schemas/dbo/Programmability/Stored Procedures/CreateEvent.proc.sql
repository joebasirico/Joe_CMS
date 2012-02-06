create PROCEDURE [dbo].[CreateEvent]
	@LogTitle as nvarchar(255),
	@EventTime as DateTime,
	@Source as nvarchar(50), 
	@LogBody as text
AS
	INSERT INTO EventLog (LogTitle, EventTime, Source, LogBody) 
	VALUES (@LogTitle, @EventTime, @Source, @LogBody)
	RETURN


