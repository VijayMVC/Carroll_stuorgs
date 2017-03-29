USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgFiles]    Script Date: 08/12/2016 15:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgFiles]
	-- Add the parameters for the stored procedure here
	@org_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  OrgFiles.file_number
			, name_of_file
			, description_of_file
			, upload_date
			, uploaded_by
	FROM OrgFiles
	INNER JOIN Files ON OrgFiles.file_number = Files.file_number
	WHERE OrgFiles.Organization_ID = @org_ID
	ORDER BY upload_date, name_of_file

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN 0;
		
END

GO

