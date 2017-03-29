USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDeActivatedOrganizationList]    Script Date: 02/08/2013 09:43:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetDeActivatedOrganizationList]
	-- Add the parameters for the stored procedure here	
AS
BEGIN	
	SET NOCOUNT ON;	
    -- Insert statements for procedure here
	SELECT Organization.OrganizationName,Convert(varchar(11),Convert(Date,OrgStatus.StartDate)) As 'Deactivated'
	FROM Organization
	INNER JOIN OrgStatus ON Organization.Organization_ID = OrgStatus.Organization_ID	
	INNER JOIN Status ON Status.Status_ID  = OrgStatus.Status_ID	
	WHERE OrgStatus.Status_ID = 5
	ORDER BY OrganizationName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

