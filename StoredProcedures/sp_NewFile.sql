
USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewFile]    Script Date: 08/12/2016 15:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewFile]
	-- Add the parameters for the stored procedure here
	@uploaded_by varchar(20),
	@name_of_file varchar(250),
	@file_contents varbinary(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @out_filenumber INT;
	
	INSERT INTO Files (name_of_file, description_of_file, upload_date, uploaded_by, file_blob)
	VALUES (@name_of_file,'',getdate(), @uploaded_by, @file_contents)

	SELECT @out_filenumber = SCOPE_IDENTITY()

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN @out_filenumber;
	
END

GO

