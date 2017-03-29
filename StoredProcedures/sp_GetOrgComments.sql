USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgComments]    Script Date: 02/08/2013 09:48:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE  [dbo].[sp_GetOrgComments]
	-- Add the parameters for the stored procedure here
	@Organization_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Date, Text
	FROM OrgComments
	WHERE Organization_ID=@Organization_ID
	
	
	if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

