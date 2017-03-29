USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrganizationMainPage]    Script Date: 02/08/2013 09:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrganizationMainPage]
	-- Add the parameters for the stored procedure here
	@Organization_ID int, 
	@OrganizationName varchar(100),
	@Description varchar(MAX),
	@MeetingTime  varchar(20),
	@MeetingDay varchar(20),
	@MeetingBuilding varchar(20),
	@MeetingRoom varchar(20),
	@CX_Code nchar(10),
	@Category_ID int, 
	@RequirementsMet bit,
	@RequirementsMetDate  varchar(20),
	@RegistarApprovalDate varchar(20),
	@StatusID int,
	@MeetingFrequency varchar(150),
	@OAccount varchar(6),
	@ProjectCode varchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Status INT
	DECLARE @Today Datetime
	
    -- Insert statements for procedure here
	UPDATE Organization
	SET OrganizationName=@OrganizationName
	, Description=@Description
	, MeetingTime=@MeetingTime
	, MeetingDay=@MeetingDay
	, MeetingBuilding=@MeetingBuilding
	, MeetingRoom=@MeetingRoom
    , RegistrarApproval=Convert(Datetime,@RegistarApprovalDate)
    , Category_ID=@Category_ID
    , RequirementsMet=@RequirementsMet
    , RequirementsMetDate= Convert(Datetime,@RequirementsMetDate)
    , CX_Code = @CX_Code
    , MeetingFrequency = @MeetingFrequency
	, OAccount = @OAccount
	, ProjectCode = @ProjectCode
	FROM Organization 
	WHERE Organization_ID = @Organization_ID
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	
	SELECT @Today = CURRENT_TIMESTAMP
	 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	 
	SELECT @Status = Status_ID 
	FROM OrgStatus 
	WHERE Organization_ID = @Organization_ID 
	AND EndDate IS NULL
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	 
	IF(@Status != @StatusID)
	BEGIN
		UPDATE OrgStatus 
		SET EndDate = @Today
		WHERE Status_ID = @Status
		AND Organization_ID = @Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
		 
		INSERT INTO [StudentOrgs].[dbo].[OrgStatus]
			   ([Organization_ID]
			   ,[Status_ID]
			   ,[StartDate]
			   ,[EndDate])
		VALUES
			   (@Organization_ID
			   ,@StatusID
			   ,@Today
			   ,NULL)
    END
	

	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

