USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetIncident]    Script Date: 02/08/2013 09:45:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetIncident]
	-- Add the parameters for the stored procedure here
	@Incident_ID int,
	@Organization_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Incident_ID, date, Time, Location, Incident, Result, Notes, Organization_ID, ReportedBy, Organization
	FROM Incident
	WHERE Organization_ID=@Organization_ID OR Incident=@Incident_ID

	if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

