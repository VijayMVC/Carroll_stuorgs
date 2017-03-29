USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrgAdvisor]    Script Date: 02/08/2013 09:56:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrgAdvisor]
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
	UPDATE OrgAdvisor
	SET StartDate=@StartDate, EndDate=@EndDate, ProfessionalTitle=@ProfessionalTitle, AdvisorTitle=@AdvisorTitle
	FROM OrgAdvisor WHERE Organization_ID=@Organization_ID AND Advisor_ID=@Advisor_ID

	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

