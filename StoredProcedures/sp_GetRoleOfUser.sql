USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetRoleOfUser]    Script Date: 02/08/2013 09:49:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetRoleOfUser]
	-- Add the parameters for the stored procedure here
	@User_ID varchar(15),
	@Password varchar(15),
	@RoleName varchar(15) OUTPUT,
	@isActive bit OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @RoleName = Roles.Role_Name,
			@isActive = Is_Active
	FROM Roles
	INNER JOIN Users ON Roles.Role_ID = Users.Role_ID	
	WHERE Users.User_ID = @User_ID AND Users.Password = @Password

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 


GO

