USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudent]    Script Date: 02/08/2013 09:50:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetStudent]
	-- Add the parameters for the stored procedure here
	@Student_ID int,
	@Carroll_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Student_ID, LastName, FirstName, ClassOf, Address, Email, PreferredPhone, Active, Gender, 
			Carroll_ID, GPAOrg, Major, Major2, CertifiedDriver, ApprovedDriver, GPABoard, Ferpa, GreekGPA,
			OnCampus, Race, International
	FROM Student
	WHERE (Student_ID = @Student_ID OR Carroll_ID = @Carroll_ID)
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

