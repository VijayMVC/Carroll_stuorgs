USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetDrivers]    Script Date: 02/08/2013 09:43:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetDrivers]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LastName,FirstName, Student_ID, CertifiedDriver, ApprovedDriver,
			FirstName + ' ' + LastName as Name
	FROM Student
	WHERE (CertifiedDriver = 1 OR ApprovedDriver = 1)
	ORDER BY LastName

	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 


GO

