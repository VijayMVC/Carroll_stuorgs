USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateIncidentComments]    Script Date: 02/08/2013 09:55:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateIncidentComments]
	-- Add the parameters for the stored procedure here
	@Incident_ID int, 
	@Date datetime, 
	@Text text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE IncidentComments
	SET Date=@Date, Text=@Text
	FROM OrgComments WHERE Incident_ID=@Incident_ID

	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

