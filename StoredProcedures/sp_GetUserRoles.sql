USE [StudentOrgs]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserRoles]    Script Date: 06/03/2016 14:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5/24/2016>
-- Description:	<Description,,Return the list of User Roles>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetUserRoles]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Roles
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

