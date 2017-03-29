GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgServicePartner]    Script Date: 8/8/2016 5:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,8.5.2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgServicePartner]
	-- Add the parameters for the stored procedure here
	@Service_ID int,
	@CommunityPartner varchar(150),
	@ContactName varchar(50),
	@ContactEmail varchar(50),
	@ContactPhone varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.ServiceProject
	SET CommunityPartner = @CommunityPartner
	  ,ContactPhone = @ContactPhone
	  ,ContactEmail = @ContactEmail
	  ,ContactName = @ContactName  
	WHERE ServiceProject_ID = @Service_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
