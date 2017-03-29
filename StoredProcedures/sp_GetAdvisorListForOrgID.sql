USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAdvisorListForOrgID]    Script Date: 02/08/2013 09:40:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetAdvisorListForOrgID]
	-- Add the parameters for the stored procedure here
	@OrganizationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LastName,FirstName, offCampus ,Advisor.Advisor_ID
	FROM OrgAdvisor
	INNER JOIN Advisor
	ON OrgAdvisor.Advisor_ID = Advisor.Advisor_ID
	WHERE OrgAdvisor.Organization_ID = @OrganizationID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

