USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteEventComment]    Script Date: 08/05/2016 09:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteEventComment]
	-- Add the parameters for the stored procedure here
	@EventComment_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM EventComments
	WHERE EventComment_ID = @EventComment_ID

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN 0;
	
END

GO

