USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgStatus]    Script Date: 02/08/2013 09:54:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgStatus]
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@Status_ID int, 
	@StartDate datetime,
	@EndDate datetime 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO OrgStatus (Organization_ID,Status_ID,StartDate,EndDate)
	VALUES (@Organization_ID,@Status_ID,@StartDate,@EndDate)
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 



GO

