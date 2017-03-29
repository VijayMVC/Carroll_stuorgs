USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDriversForEvent]    Script Date: 02/08/2013 09:44:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetDriversForEvent]
	-- Add the parameters for the stored procedure here
	@Driver1 int,
	@Driver2 int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
-- Insert statements for procedure here
	SELECT LastName,FirstName, Student_ID, CertifiedDriver,ApprovedDriver
	FROM Student
	WHERE Student_ID = @Driver1 OR Student_ID = @Driver2
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

