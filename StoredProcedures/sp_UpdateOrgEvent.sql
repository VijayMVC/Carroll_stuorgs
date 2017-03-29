USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrgEvent]    Script Date: 02/08/2013 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrgEvent]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@Date varchar(20),
	@Time varchar(10),
	@Location varchar(50),
	@Title varchar(50),
	@Description varchar(MAX),
	@OrganizationWorkedWith varchar(50),
	@ContactPhone varchar(50),
	@ContactEmail varchar(50),
	@Attendence varchar(10),
	@VanRental varchar(10),
	@BusRental varchar(10),
	@ContactName varchar(10),
	@Driver1 varchar(20),
	@Driver2 varchar(20),
	@OnOffCampus bit,
	@HoursVolunteered varchar(10),
	@Organization_ID int,
	@Dollars varchar(10),
	@DollarsByPartner varchar(10),
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

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgEvent]
	SET [Organization_ID] = @Organization_ID
	  ,[Date] = Convert(Datetime,@Date)
	  ,[Time] = @Time
	  ,[Location] = @Location
	  ,[Description] = @Description
	  ,[OrganizationWorkedWith] = @OrganizationWorkedWith
	  ,[ContactPhone] = @ContactPhone
	  ,[ContactEmail] = @ContactEmail
	  ,[Attendance] = Convert(Int,@Attendence)
	  ,[HoursVolunteered] = Convert(decimal(5,2),@HoursVolunteered)
	  ,[DollarsSpentByOrg] = Convert(decimal(18,2),@Dollars)
	  ,[DollarsSpentByPartner]=Convert(decimal(18,2),@DollarsByPartner)
	  ,[Title] = @Title
	  ,[OnOffCampus] = @OnOffCampus
	  ,[VanRental] = Convert(Int,@VanRental)
	  ,[BusRental] = Convert(Int,@BusRental)
	  ,[ContactName] = @ContactName
	  ,[Driver1] = Convert(Int,@Driver1)
	  ,[Driver2] = Convert(Int,@Driver2)
	  ,[RoomReserved] = @RoomReserved
	  ,[Marketing] = @Marketing
	  ,[Catering] = @Catering
	  ,[SignupForm] = @SignupForm
	  ,[ActivityWaiver] = @ActivityWaiver
	  ,[CUNight] = @CUNight	  
	WHERE Event_ID = @Event_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

