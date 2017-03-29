USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgAdvisor]    Script Date: 02/08/2013 09:47:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgAdvisor]
	-- Add the parameters for the stored procedure here
	@Organization_ID int, 
	@Advisor_ID int, 
	@StartDate datetime,
	@EndDate datetime, 
	@ProfessionalTitle varchar(500),
	@AdvisorTitle varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StartDate, EndDate, ProfessionalTitle, AdvisorTitle
	FROM OrgAdvisor
	WHERE Advisor_ID=@Advisor_ID AND Organization_ID=@Organization_ID

if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

