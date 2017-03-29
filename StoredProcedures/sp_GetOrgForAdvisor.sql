USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgForAdvisor]    Script Date: 02/08/2013 09:49:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgForAdvisor]
	-- Add the parameters for the stored procedure here 
	@Advisor_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OrganizationName,StartDate, EndDate 
	FROM OrgAdvisor
	INNER JOIN Organization 
	ON OrgAdvisor.Organization_ID = Organization.Organization_ID
	WHERE Advisor_ID=@Advisor_ID ORDER BY StartDate DESC

if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

