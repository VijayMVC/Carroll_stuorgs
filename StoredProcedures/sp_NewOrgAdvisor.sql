USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgAdvisor]    Script Date: 02/08/2013 09:53:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgAdvisor]
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
	INSERT INTO OrgAdvisor (StartDate, EndDate, ProfessionalTitle, AdvisorTitle,Organization_ID)
	VALUES (@StartDate, @EndDate, @ProfessionalTitle, @AdvisorTitle,@Organization_ID)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END


GO

