USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetActiveOrgList]    Script Date: 05/24/2016 16:36:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5.24.2016>
-- Description:	<Description,,Return a list of active organizations>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetActiveOrgList] 
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OrgStatus.Organization_ID, OrganizationName 
	FROM Organization
	INNER JOIN OrgStatus ON Organization.Organization_ID = OrgStatus.Organization_ID
	WHERE OrgStatus.EndDate is null
	AND OrgStatus.Status_ID in (1,2,4) --Proposed, Active, Probation
	ORDER BY OrganizationName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO