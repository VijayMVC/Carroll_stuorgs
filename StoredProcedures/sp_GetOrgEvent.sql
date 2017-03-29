USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgEvent]    Script Date: 02/08/2013 09:49:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgEvent]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@Organization_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Event_ID, Organization_ID, Date, Time, Location, Description, 
			OrganizationWorkedWith, ContactPhone, ContactEmail, Attendance, 
			HoursVolunteered, DollarsSpentByOrg, Title, EventType, OnOffCampus, 
			VanRental, BusRental,
			ContactName, Driver1, Driver2, DollarsSpentByPartner, 
			0 NumberOfVolunteers, CreatedByUser, RoomReserved, Marketing, 
			Catering, SignupForm, ActivityWaiver, CUNight,
			(select firstname + ' ' + lastname
				from Student WHERE Driver1 = Student_ID) as Driver1Name,
			(select firstname + ' ' + lastname
				from Student WHERE Driver2 = Student_ID) as Driver2Name
	FROM OrgEvent 
	WHERE Organization_ID=@Organization_ID OR Event_ID=@Event_ID
	
	if @@ERROR <>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

