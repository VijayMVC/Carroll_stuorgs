USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetServiceProjectByOrgIDDate]    Script Date: 02/08/2013 09:49:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetServiceProjectByOrgIDDate] 
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@Date varchar(20)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  *
	FROM ServiceProject
	WHERE Organization_ID = @Organization_ID 
	AND StartDate = CONVERT(datetime,@Date)
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

