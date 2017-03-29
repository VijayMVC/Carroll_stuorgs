USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCommentsByEventID]    Script Date: 02/08/2013 09:40:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetCommentsByEventID]
	-- Add the parameters for the stored procedure here
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Date, Text, UserID, COALESCE(CONVERT(VARCHAR(10), EventComments.Date, 101),'') ShortDate,
		EventComment_ID
	FROM EventComments
	WHERE Event_ID = @EventID 
	ORDER BY Date DESC
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

