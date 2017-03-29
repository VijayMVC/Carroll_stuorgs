USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrgCategory]    Script Date: 02/08/2013 09:56:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrgCategory]
	-- Add the parameters for the stored procedure here
	@Category_ID int,
	@CategoryName varchar(20),
	@Description varchar(max),
	@AddDate nvarchar(20),
	@EndDate nvarchar(20),
	@GreekOrg bit
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here    
    /*VSHIELY - Passing and converting strings into dates for convenience*/
    
	UPDATE OrgCategory 
	SET CategoryName=@CategoryName, Description=@Description, AddDate=CONVERT(datetime,@AddDate), EndDate=CONVERT(datetime,@EndDate), GreekOrg=@GreekOrg
	FROM MemberType WHERE Category_ID=@Category_ID
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 
GO

