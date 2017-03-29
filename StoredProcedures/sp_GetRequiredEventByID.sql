USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetRequiredEventByID]    Script Date: 02/08/2013 09:49:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetRequiredEventByID]
	-- Add the parameters for the stored procedure here
	@Event_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM RequiredEvents	
	WHERE RequiredEvent_ID = @Event_ID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

