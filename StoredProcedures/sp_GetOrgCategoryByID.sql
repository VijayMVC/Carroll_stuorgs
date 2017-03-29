USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgCategoryByID]    Script Date: 02/08/2013 09:48:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgCategoryByID]
	-- Add the parameters for the stored procedure here
	@Category_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryName, Description, AddDate, EndDate, GreekOrg 
	FROM OrgCategory
	WHERE Category_ID=@Category_ID 
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

