USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetServiceProject]    Script Date: 08/05/2016 09:49:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetServiceProject] 
	-- Add the parameters for the stored procedure here
	@ServiceProject_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ServiceProject_ID, Organization_ID, CommunityPartner, ContactName, ContactPhone, ContactEmail,
			NoOfVolunteers, HoursVolunteered, Description, OnGoing, Location, StartDate, EndDate, 
			TimeFrom, TimeTo, MeetDay, MeetFrequency, Title, Funds, Planned_NoOfVolunteers, Planned_HoursVolunteered,
			Planned_Funds
	FROM ServiceProject
	WHERE ServiceProject_ID = @ServiceProject_ID
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

