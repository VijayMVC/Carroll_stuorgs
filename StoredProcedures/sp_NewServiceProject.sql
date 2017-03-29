USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewServiceProject]    Script Date: 02/08/2013 09:54:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewServiceProject]
	-- Add the parameters for the stored procedure here	
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
	@CommentText varchar(MAX),
	@CommentDate varchar(20),
	@UserID varchar(20),
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
	DECLARE @ServiceProject_ID INT
	
    -- Insert statements for procedure here
	INSERT INTO ServiceProject (Organization_ID,CommunityPartner,ContactName,ContactPhone,ContactEmail,NoOfVolunteers,HoursVolunteered,Description,
	OnGoing,Location,StartDate,EndDate,TimeFrom,TimeTo,MeetDay,MeetFrequency,Title,Funds,Planned_NoOfVolunteers, Planned_HoursVolunteered, Planned_Funds)
	VALUES (@Organization_ID,@CommunityPartner,@ContactName,@ContactPhone,@ContactEmail,Convert(int,@NoOfVolunteers),Convert(decimal(5,2),@HoursVolunteered),@Description,
	@OnGoing,@Location,Convert(Date,@StartDate),Convert(Date,@EndDate),@TimeFrom,@TimeTo,@MeetDay,@MeetFrequency,@Title,@Funds,
	@Planned_NoOfVolunteers, @Planned_HoursVolunteered, @Planned_Funds)
	
	SELECT @ServiceProject_ID = SCOPE_IDENTITY()
	
	IF @CommentText !=''
	BEGIN
		INSERT INTO ServiceProjectComments (Date,Text,ServiceProject_ID,UserID)
		VALUES (Convert(Date,@CommentDate),@CommentText,@ServiceProject_ID,@UserID)
	END

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

