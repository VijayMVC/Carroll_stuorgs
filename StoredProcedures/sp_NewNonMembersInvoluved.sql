USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewNonMembersInvoluved]    Script Date: 02/08/2013 09:53:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewNonMembersInvoluved]
	-- Add the parameters for the stored procedure here
	@ID varchar(10),
	@Name varchar(150),
	@Incident_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NonMembersInvolved (NonMemberName,ID, Incident_ID)
	VALUES (@Name,@ID, @Incident_ID)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

