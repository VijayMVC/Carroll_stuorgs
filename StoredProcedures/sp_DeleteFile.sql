USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteFile]    Script Date: 08/12/2016 15:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteFile]
	-- Add the parameters for the stored procedure here
	@file_number int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM Files
	WHERE file_number = @file_number

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN 0;
	
END

GO

