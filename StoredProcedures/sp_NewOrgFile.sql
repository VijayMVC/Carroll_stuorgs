USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgFile]    Script Date: 08/12/2016 15:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgFile]
	-- Add the parameters for the stored procedure here
	@org_ID INT,
	@name_of_file varchar(250),
	@uploaded_by varchar(20),
	@file_contents varbinary(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @out_filenumber INT;

	exec @out_filenumber = dbo.sp_NewFile @uploaded_by, @file_contents
	
	INSERT INTO OrgFiles (Organization_ID, file_number)
	VALUES (@org_ID, @out_filenumber)

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN 0;
		
END

GO

