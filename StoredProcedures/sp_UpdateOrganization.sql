USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrganization]    Script Date: 02/08/2013 09:56:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrganization]
	-- Add the parameters for the stored procedure here
	@Organization_ID int, 
	@OrganizationName varchar(100),
	@Description varchar(MAX),
	@MeetingTime datetime,
	@MeetingDay varchar(20),
	@MeetingBuilding varchar(20),
	@MeetingRoom varchar(20),
	@DateProposed datetime,
	@ProposalAccepted datetime,
	@ProposalDenied datetime,
	@ProposalNotes varchar(MAX),
	@ConstitutionSubmitted datetime,
	@ConstitutionApproved datetime,
	@ConstitutionNotes varchar(Max),
	@RegistrarApproval datetime,
	@CX_Code nchar(10),
	@Category_ID int, 
	@RequirementsMet bit,
	@RequirementsMetDate datetime, 
	@OAccount varchar(4),
	@ProjectCode varchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Organization
	SET OrganizationName=@OrganizationName, Description=@Description, MeetingTime=@MeetingTime, MeetingDay=@MeetingDay, 
		MeetingBuilding=@MeetingBuilding, MeetingRoom=@MeetingRoom, DateProposed=@DateProposed, 
		ProposalAccepted=@ProposalAccepted, ProposalDenied=@ProposalDenied, ProposalNotes=@ProposalNotes, 
		ConstitutionSubmitted=@ConstitutionSubmitted, ConstitutionAccepted=@ConstitutionApproved, 
		ConstitutionNotes=@ConstitutionNotes, RegistrarApproval=@RegistrarApproval, Category_ID=@Category_ID, 
		RequirementsMet=@RequirementsMet, RequirementsMetDate=@RequirementsMetDate, OAccount=@OAccount,
		ProjectCode=@ProjectCode
	FROM Organization 
	WHERE Organization_ID=@Organization_ID

	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

