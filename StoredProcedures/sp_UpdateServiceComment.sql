USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateServiceComment]    Script Date: 08/08/2016 09:57:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateServiceComment]
	-- Add the parameters for the stored procedure here
	@ServiceComment_ID int, 
	@Text text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	UPDATE ServiceProjectComments
	SET Text=@Text
	WHERE ServiceComment_ID = @ServiceComment_ID

	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

