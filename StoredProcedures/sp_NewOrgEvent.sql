USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgEvent]    Script Date: 02/08/2013 09:54:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgEvent]
	-- Add the parameters for the stored procedure here	
	@Organization_ID int, 
	@Date varchar(20),
	@Time varchar(10),
	@Location varchar(50),
	@Description varchar(MAX),
	@OrganizationWorkedWith varchar(50),
	@ContactPhone varchar(50),
	@ContactEmail varchar(50),
	@Attendance varchar(20), 
	@HoursVolunteered varchar(20), 
	@DollarsSpent varchar(50),
	@DollarsSpentByPartner varchar(50),
	@Title varchar(50),
	@EventType bit,
	@OnOffCampus bit,
	@VanRental varchar(20),
	@BusRental varchar(20),
	@ContactPerson  varchar(50),
	@Driver1 varchar(20),
	@Driver2 varchar(20),
	@CommentText varchar(MAX),
	@CommentDate varchar(20),
	@UserID varchar(20),
	@RoomReserved bit = 0,
	@Marketing bit = 0,
	@Catering bit = 0,
	@SignupForm bit = 0,
	@ActivityWaiver bit = 0,
	@CUNight bit = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Event_ID INT
	
	IF @RoomReserved IS NULL
		SELECT @RoomReserved = 0

	IF @Marketing IS NULL
		SELECT @Marketing = 0

	IF @Catering IS NULL
		SELECT @Catering = 0

	IF @SignupForm IS NULL
		SELECT @SignupForm = 0

	IF @ActivityWaiver IS NULL
		SELECT @ActivityWaiver = 0

	IF @CUNight IS NULL
		SELECT @CUNight = 0
	
    -- Insert statements for procedure here
	INSERT INTO OrgEvent (Organization_ID, OrgEvent.Date, Time, Location, Description, OrganizationWorkedWith, 
						ContactPhone, ContactEmail, Attendance, HoursVolunteered, DollarsSpentByOrg,
						DollarsSpentByPartner, Title, EventType, OnOffCampus, VanRental, BusRental, 
						ContactName, Driver1, Driver2, CreatedByUser, RoomReserved, Marketing, Catering, 
						SignupForm, ActivityWaiver, CUNight)
	VALUES (@Organization_ID, CONVERT(datetime,@Date), @Time, @Location, @Description, @OrganizationWorkedWith, 
			@ContactPhone, @ContactEmail, Convert(int,@Attendance),Convert(decimal(5,2),@HoursVolunteered), Convert(decimal(18,2),@DollarsSpent),
			Convert(decimal(18,2),@DollarsSpentByPartner), @Title, @EventType, @OnOffCampus, Convert(int,@VanRental),Convert(int, @BusRental), 
			@ContactPerson, Convert(Int,@Driver1), Convert(Int,@Driver2), @UserID, @RoomReserved, @Marketing, @Catering, 
			@SignupForm, @ActivityWaiver, @CUNight)
	
	SELECT @Event_ID = SCOPE_IDENTITY()
	
	INSERT INTO EventComments (Date,Text,Event_ID,UserID)
	VALUES (CONVERT(datetime,@CommentDate),@CommentText,@Event_ID,@UserID)

	IF @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	
	else return 0;
END 

GO

