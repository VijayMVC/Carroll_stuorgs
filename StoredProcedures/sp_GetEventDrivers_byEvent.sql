USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetEventDrivers_byEvent]    Script Date: 08/02/2016 09:44:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/02/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetEventDrivers_byEvent]
	-- Add the parameters for the stored procedure here
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LastName, FirstName, Student_ID, 
		case when CertifiedDriver = 1 AND ApprovedDriver = 1 then 'Certified & Approved'
			 when CertifiedDriver = 1 then 'Certified'
			 when ApprovedDriver = 1 then 'Approved'
			 else ''
			 end DriverType
	FROM OrgEvent
	INNER JOIN Student firststu on OrgEvent.Driver1 = firststu.Student_ID
	WHERE Event_ID = @EventID
	AND OrgEvent.Driver1 is not null
	UNION
	SELECT LastName, FirstName, Student_ID, 
		case when CertifiedDriver = 1 AND ApprovedDriver = 1 then 'Certified & Approved'
			 when CertifiedDriver = 1 then 'Certified'
			 when ApprovedDriver = 1 then 'Approved'
			 else ''
			 end DriverType
	FROM OrgEvent
	INNER JOIN Student secondstu on OrgEvent.Driver2 = secondstu.Student_ID
	WHERE Event_ID = @EventID
	AND OrgEvent.Driver2 is not null
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 


GO

