USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewMyOrgsEvent]    Script Date: 08/05/2016 09:54:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewMyOrgsEvent]
	-- Add the parameters for the stored procedure here	
	@Organization_ID int,
	@UserID varchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Event_ID int;
	
    -- Insert statements for procedure here
	--create a blank template for the student to fill out
	INSERT INTO OrgEvent (Organization_ID, OrgEvent.Date, Time, Location, Description, OrganizationWorkedWith, 
						ContactPhone, ContactEmail, Attendance, DollarsSpentByOrg,
						DollarsSpentByPartner, Title, EventType, OnOffCampus, VanRental, BusRental, 
						ContactName, Driver1, Driver2, CreatedByUser, RoomReserved, Marketing, Catering, 
						SignupForm, ActivityWaiver, CUNight)
	VALUES (@Organization_ID, getdate(), '', '', '', null, 
			null, null, null, null, null, 'Event Title', 1, 0, null, null, 
			null, null, null, @UserID, 0, 0, 0, 0, 0, 0)
	
	SELECT @Event_ID = SCOPE_IDENTITY()

	IF @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	else 
	BEGIN
		--return the Event ID for the event that was just created.
		return @Event_ID;
	END
END 

GO

