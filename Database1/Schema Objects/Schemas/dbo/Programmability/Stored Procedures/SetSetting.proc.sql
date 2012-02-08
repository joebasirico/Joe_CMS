CREATE PROCEDURE SetSetting 
	-- Add the parameters for the stored procedure here
	@SettingKey as nvarchar(255),
	@SettingValue as text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Settings SET SettingValue=@SettingValue WHERE SettingKey=@SettingKey
	IF @@ROWCOUNT=0
		INSERT INTO Settings (SettingKey, SettingValue) VALUES (@SettingKey, @SettingValue)
END