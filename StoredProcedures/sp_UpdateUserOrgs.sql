USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateUserOrgs]    Script Date: 05/23/2016 14:23:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,05/23/2016>
-- Description:	<Description,,Updates an existing record in the UserOrgs table>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateUserOrgs]
	-- Add the parameters for the stored procedure here
	@UserID varchar(20),
	@OrganizationID varchar(20),
	@ActiveDate smalldatetime = NULL,
	@InActiveDate smalldatetime = NULL
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

	UPDATE UserOrgs 
	SET inactive_date = @InActiveDate --can't coalesce this, as blanking it out is the only way to remove it
	FROM UserOrgs 
	WHERE User_ID = @UserId
	AND Organization_ID = @OrganizationID
	
	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

