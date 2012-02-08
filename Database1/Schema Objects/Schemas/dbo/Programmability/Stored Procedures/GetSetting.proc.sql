CREATE PROCEDURE GetSetting 
	-- Add the parameters for the stored procedure here
	@SettingKey as nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SettingValue FROM Settings WHERE SettingKey = @SettingKey
END