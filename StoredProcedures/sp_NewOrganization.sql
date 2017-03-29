USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrganization]    Script Date: 02/08/2013 09:53:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrganization]
	-- Add the parameters for the stored procedure here
	@OrganizationName varchar(100),
	@Description varchar(MAX),
	@MeetingTime varchar(20),
	@MeetingDay varchar(20),
	@MeetingBuilding varchar(20),
	@MeetingRoom varchar(20),
	@DateProposed varchar(20),
	@ProposalAccepted varchar(20),
	@ProposalDenied varchar(20),
	@ProposalNotes varchar(MAX),
	@ConstitutionSubmitted varchar(20),
	@ConstitutionAccepted varchar(20),
	@ConstitutionNotes varchar(Max),
	@RegistrarApproval varchar(20),
	@CX_Code nchar(10),
	@Category_ID int, 
	@RequirementsMet bit,
	@RequirementsMetDate varchar(20),
	@CommentText varchar(Max),
	@Status_ID int,
	@CommentDate varchar(20),
	@StatusStartDate varchar(20),
	@StatusEndDate varchar(20),
	@UserName varchar(20),
	@MeetingFrequency varchar(150),
	@OAccount varchar(6),
	@ProjectCode varchar(4)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Organization_ID INT
	
    -- Insert statements for procedure here
	INSERT INTO Organization (OrganizationName, Description, MeetingTime, MeetingDay, MeetingBuilding, 
	MeetingRoom, DateProposed, ProposalAccepted, ProposalDenied, ProposalNotes, ConstitutionSubmitted,
	ConstitutionAccepted, ConstitutionNotes, RegistrarApproval, CX_Code, Category_ID, RequirementsMet, 
	RequirementsMetDate, MeetingFrequency, OAccount, ProjectCode)
	VALUES (@OrganizationName, @Description, @MeetingTime, @MeetingDay, @MeetingBuilding, 
	@MeetingRoom, @DateProposed, @ProposalAccepted, @ProposalDenied, @ProposalNotes, @ConstitutionSubmitted, 
	@ConstitutionAccepted, @ConstitutionNotes, @RegistrarApproval, @CX_Code, @Category_ID, @RequirementsMet,
	@RequirementsMetDate,@MeetingFrequency,coalesce(@OAccount,''),coalesce(@ProjectCode,''))
	
	SELECT @Organization_ID = SCOPE_IDENTITY()
	
	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	
	IF (@CommentText IS NOT NULL AND @CommentText!= '')
	BEGIN
		INSERT INTO OrgComments (Date,Text,Organization_ID,UserID)
		VALUES (@CommentDate,@CommentText,@Organization_ID,@UserName)
	END
	
	if @@ERROR<>0
	BEGIN 
		RaisError('200', 16, 1)
		RETURN -200;
	END
	
	--First the oraganization status is 'Proposed'
	INSERT INTO OrgStatus (Organization_ID,Status_ID,StartDate,EndDate)
	VALUES (@Organization_ID,1,@StatusStartDate,@StatusEndDate)
	
	if @@ERROR<>0
	BEGIN 
		RaisError('300', 16, 1)
		RETURN -300;
	END
		
	else return 0;
	
END

GO

