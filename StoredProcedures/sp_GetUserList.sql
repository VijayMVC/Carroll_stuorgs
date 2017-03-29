USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetUserList]    Script Date: 02/08/2013 09:51:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetUserList]
	-- Add the parameters for the stored procedure here
	@select_mode varchar(6) = 'ALL'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--5.23.2016. Updated to add a mode to the procedure so that only active users can be retrieved.
	IF @select_mode is null
		SELECT @select_mode = 'ALL'
		
	IF @select_mode = 'ACTIVE'
	BEGIN
		SELECT User_ID
		FROM Users
		WHERE Is_Active = 1 --Only get the Active Users

		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @select_mode = 'ALL'
	BEGIN
		SELECT User_ID
		FROM Users

		if @@ERROR<>0
		BEGIN 
			raiserror('101',16,1)
			return -101;
		END
	END
		
	else return 0;
END 


GO

