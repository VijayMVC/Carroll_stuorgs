USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgAdvisorRow]    Script Date: 02/08/2013 09:53:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgAdvisorRow]
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@Advisor_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		-- Insert statements for procedure here
		IF NOT EXISTS
        (
			SELECT 1
			FROM OrgAdvisor
			WHERE Organization_ID = @Organization_ID AND Advisor_ID = @Advisor_ID
        )

        BEGIN
        INSERT INTO OrgAdvisor (Advisor_ID,StartDate, EndDate,Organization_ID)
		VALUES (@Advisor_ID,CURRENT_TIMESTAMP,NULL,@Organization_ID)            
        END
    
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END


GO

