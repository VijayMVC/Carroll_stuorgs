USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteServiceProject]    Script Date: 08/12/2016 11:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteServiceProject]
	-- Add the parameters for the stored procedure here
	@Service_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM ServiceProjectFiles
	WHERE ServiceProject_ID = @Service_ID

	if @@ERROR<>0
	BEGIN 
		RaisError('120', 16, 1)
		RETURN -120;
	END	
	
	DELETE FROM ServiceProjectComments
	WHERE ServiceProject_ID = @Service_ID

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	
	DELETE FROM ServiceProject
	WHERE ServiceProject_ID = @Service_ID

	if @@ERROR<>0
	BEGIN 
		RaisError('200', 16, 1)
		RETURN -200;
	END
	else 
		RETURN 0;
	
END

GO

