USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateEventComment]    Script Date: 08/05/2016 09:57:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateEventComment]
	-- Add the parameters for the stored procedure here
	@EventComment_ID int, 
	@Text text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	UPDATE EventComments
	SET Text=@Text
	WHERE EventComment_ID = @EventComment_ID

	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

