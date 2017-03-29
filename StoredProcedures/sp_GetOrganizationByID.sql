

USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrganizationByID]    Script Date: 02/08/2013 09:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrganizationByID] 
	-- Add the parameters for the stored procedure here
	@Organization_ID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  OrganizationName, Organization.Description, MeetingTime, MeetingDay, 
			MeetingBuilding, MeetingRoom, DateProposed, ProposalAccepted, ProposalDenied, ProposalNotes, 
			ConstitutionSubmitted,ConstitutionAccepted, ConstitutionNotes, RegistrarApproval, CX_Code,
			Category_ID,RequirementsMet,Status_ID,ConstitutionDenied,ConstitutionUpdated,MeetingFrequency,
			RequirementsMetDate, OAccount, ProjectCode
	FROM Organization
	INNER JOIN OrgStatus ON Organization.Organization_ID = OrgStatus.Organization_ID
	WHERE Organization.Organization_ID=@Organization_ID AND OrgStatus.EndDate IS NULL

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

