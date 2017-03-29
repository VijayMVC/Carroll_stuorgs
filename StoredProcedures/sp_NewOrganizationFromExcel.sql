USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrganizationFromExcel]    Script Date: 02/08/2013 09:53:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrganizationFromExcel]
	-- Add the parameters for the stored procedure here
	@OrganizationName varchar(100),
	@Description varchar(MAX)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Organization_ID INT
    -- Insert statements for procedure here
	INSERT INTO Organization (OrganizationName, Description,Category_ID)
	Values (@OrganizationName, @Description,3)
	
	SELECT @Organization_ID = SCOPE_IDENTITY()
	
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 1;
	
END

GO

