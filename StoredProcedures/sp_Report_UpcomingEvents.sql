USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_Report_UpcomingEvents]    Script Date: 08/09/2016 09:39:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/09/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Report_UpcomingEvents]
	-- Add the parameters for the stored procedure here
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT OrganizationName
		, OrgEvent.Title
		, COALESCE(CONVERT(VARCHAR(10), OrgEvent.Date, 101),'') as ShortDate
		, OrgEvent.Location
		, OrgEvent.ContactName
		, OrgEvent.ContactPhone
		, OrgEvent.ContactEmail
	FROM OrgEvent
	INNER JOIN Organization ON OrgEvent.Organization_ID = Organization.Organization_ID
	WHERE Date BETWEEN @StartDate AND coalesce(@EndDate,'01/01/2999')
	ORDER BY Organization.OrganizationName, OrgEvent.Date
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

