USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateServiceProject]    Script Date: 02/08/2013 09:57:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateServiceProject]
	-- Add the parameters for the stored procedure here
	@ServiceProject_ID int,
	@Organization_ID int, 
	@CommunityPartner varchar(50),
	@ContactName varchar(50),
	@ContactPhone varchar(50),
	@ContactEmail varchar(50),
	@NoOfVolunteers varchar(10),
	@HoursVolunteered varchar(10),
	@Description varchar(MAX),
	@OnGoing bit,
	@Location varchar(50),
	@StartDate varchar(20),
	@EndDate varchar(20),
	@TimeFrom varchar(10),
	@TimeTo varchar(10),
	@MeetDay varchar(20),
	@MeetFrequency varchar(150),
	@Title varchar(150),
	@Funds varchar(250),
	@Planned_NoOfVolunteers int,
	@Planned_HoursVolunteered decimal(5,2),
	@Planned_Funds varchar(250)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[ServiceProject]
	SET [Organization_ID] = @Organization_ID
      ,[CommunityPartner] = @CommunityPartner
      ,[ContactName] = @ContactName
      ,[ContactPhone] = @ContactPhone
      ,[ContactEmail] = @ContactEmail
      ,[NoOfVolunteers] = Convert(int,@NoOfVolunteers)
      ,[HoursVolunteered] = Convert(decimal(5,2),@HoursVolunteered)
      ,[Description] = @Description
      ,[OnGoing] = @OnGoing
      ,[Location] = @Location
      ,[StartDate] = @StartDate
      ,[EndDate] = @EndDate
      ,[TimeFrom] = @TimeFrom
      ,[TimeTo] = @TimeTo
      ,[MeetDay] = @MeetDay
      ,[MeetFrequency] = @MeetFrequency
      ,[Title] = @Title
      ,[Funds] = @Funds
	  ,[Planned_NoOfVolunteers] = @Planned_NoOfVolunteers
	  ,[Planned_HoursVolunteered] = @Planned_HoursVolunteered
	  ,[Planned_Funds] = @Planned_Funds	  
	WHERE ServiceProject_ID = @ServiceProject_ID
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

