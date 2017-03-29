USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetUserOrgsByID]    Script Date: 06/03/2016 14:20:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5/23/2016>
-- Description:	<Description,,Return the list of Organizations that this user is limited to>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetUserOrgsByID]
	-- Add the parameters for the stored procedure here
	@UserID varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserOrgs.*, Organization.OrganizationName
	FROM UserOrgs
	INNER JOIN Users on Users.User_ID = UserOrgs.User_ID
	INNER JOIN Organization on Organization.Organization_ID = UserOrgs.Organization_ID
	WHERE UserOrgs.User_ID = @UserID 
	AND inactive_date is NULL
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

