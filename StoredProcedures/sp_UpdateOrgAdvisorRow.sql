USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrgAdvisorRow]    Script Date: 02/08/2013 09:56:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrgAdvisorRow]
	-- Add the parameters for the stored procedure here
	@Advisor_ID int,
	@Organization_ID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   UPDATE OrgAdvisor
   SET EndDate = CURRENT_TIMESTAMP
   WHERE Advisor_ID = @Advisor_ID And Organization_ID = @Organization_ID
 
 
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

