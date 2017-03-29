USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewUserOrgs]    Script Date: 05/23/2016 16:21:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,05/23/2016>
-- Description:	<Description,,Add a new limiting Organization record for a user.>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewUserOrgs]
	-- Add the parameters for the stored procedure here
	@UserID varchar(20),
	@OrganizationID varchar(20),
	@ActiveDate smalldatetime = NULL
AS
BEGIN
    -- Insert statements for procedure here

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @OrganizationID is null OR NOT EXISTS(select * from dbo.Organization where Organization_ID = @OrganizationID)
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END

	IF @UserID is null OR NOT EXISTS(select * from dbo.Users where User_ID = @UserID)
	BEGIN 
		RaisError('101', 16, 1)
		RETURN -101;
	END
	
	IF @ActiveDate is null
		select @ActiveDate = getDate()

	INSERT INTO UserOrgs (User_ID, Organization_ID, Active_Date, Inactive_Date)
	VALUES (@UserID, @OrganizationID, @ActiveDate, null)
	
	if @@ERROR<>0
	BEGIN 
		RaisError('102', 16, 1)
		RETURN -102;
	END
		
	else return 0;
	
END

GO

