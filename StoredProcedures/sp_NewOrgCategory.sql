USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewOrgCategory]    Script Date: 02/08/2013 09:54:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewOrgCategory]
	-- Add the parameters for the stored procedure here
	@CategoryName varchar(20),
	@Description varchar(Max),
	@AddDate nvarchar(20),
	@EndDate nvarchar(20),
	@GreekOrg bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    /*Sree - Passing and converting strings into dates for convenience*/
    
	INSERT INTO OrgCategory (CategoryName, Description,AddDate, EndDate, GreekOrg)
	VALUES (@CategoryName, @Description, CONVERT(datetime,@AddDate), CONVERT(datetime,@EndDate), @GreekOrg)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

