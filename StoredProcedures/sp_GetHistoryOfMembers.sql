USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHistoryOfMembers]    Script Date: 02/08/2013 09:45:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetHistoryOfMembers]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Organization.CX_Code,Student.Carroll_ID,MemberType.MemberName,StudentRoster.Session,StudentRoster.Year
	FROM Student
	INNER JOIN StudentRoster
	ON Student.Student_ID = StudentRoster.Student_ID	
	INNER JOIN MemberType
	ON StudentRoster.Member_ID	= MemberType.Member_ID	
	INNER JOIN Organization
	ON StudentRoster.Organization_ID  = Organization.Organization_ID
	WHERE Student.Active = 1 
	Order By Organization.CX_Code
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

