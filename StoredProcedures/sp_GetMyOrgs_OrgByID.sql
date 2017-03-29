

USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMyOrgs_OrgByID]    Script Date: 07/22/2016 09:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,07/22/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMyOrgs_OrgByID] 
	-- Add the parameters for the stored procedure here
	@Organization_ID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Advisor varchar(60)
	
	--An Organization can have more than one advisor. If they do, just grab the first one
	--alphabetically
	IF (SELECT count(*) FROM OrgAdvisor 
			 INNER JOIN Advisor ON OrgAdvisor.Advisor_ID = Advisor.Advisor_ID
			 WHERE OrgAdvisor.Organization_ID = @Organization_ID
			 AND OrgAdvisor.EndDate is NULL) > 1
	BEGIN
		SELECT @Advisor = (SELECT min(Advisor.FirstName + ' ' + Advisor.LastName)
			 FROM OrgAdvisor 
			 INNER JOIN Advisor ON OrgAdvisor.Advisor_ID = Advisor.Advisor_ID
			 WHERE OrgAdvisor.Organization_ID = @Organization_ID
			 AND OrgAdvisor.EndDate is NULL)
	END
	ELSE
	BEGIN
		SELECT @Advisor = (SELECT Advisor.FirstName + ' ' + Advisor.LastName
			 FROM OrgAdvisor 
			 INNER JOIN Advisor ON OrgAdvisor.Advisor_ID = Advisor.Advisor_ID
			 WHERE OrgAdvisor.Organization_ID = @Organization_ID
			 AND OrgAdvisor.EndDate is NULL)
	END

    -- Insert statements for procedure here
	SELECT  OrganizationName, Organization.Description, MeetingTime, MeetingDay, 
			MeetingBuilding, MeetingRoom, MeetingFrequency,
			Organization.Category_ID, OAccount, ProjectCode, 
			@Advisor AdvisorName, GreekOrg
	FROM Organization
	INNER JOIN OrgCategory on Organization.Category_ID = OrgCategory.Category_ID
	WHERE Organization.Organization_ID = @Organization_ID 

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

