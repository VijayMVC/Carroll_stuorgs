USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMemberTypeByID]    Script Date: 02/08/2013 09:46:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMemberTypeByID]
	-- Add the parameters for the stored procedure here
	@Member_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MemberName, Description, AddDate, EndDate, BoardMember 
	FROM MemberType
	WHERE Member_ID=@Member_ID 
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

