USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrganization]    Script Date: 02/08/2013 09:47:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrganization] 
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@OrganizationName varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Organization_ID, OrganizationName, Description, MeetingTime, MeetingDay, MeetingBuilding, 
			MeetingRoom, DateProposed, ProposalAccepted, ProposalDenied, ProposalNotes, 
			ConstitutionSubmitted,ConstitutionAccepted, ConstitutionNotes, RegistrarApproval, 
			CX_Code, Category_ID, RequirementsMet, RequirementsMetDate, 
			OAccount,ProjectCode
	FROM Organization
	Where (Organization_ID = @Organization_ID OR OrganizationName = @OrganizationName)
	ORDER BY OrganizationName

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

