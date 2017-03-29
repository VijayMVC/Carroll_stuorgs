USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetActiveMembersInfoForAllOrganization]    Script Date: 02/08/2013 09:39:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetActiveMembersInfoForAllOrganization]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Organization.OrganizationName,
			Student.FirstName,
			Student.LastName,
			Student.Email,
			Student.Carroll_ID,
			Student.GPAOrg,
			Student.GPABoard,
			MemberType.MemberName,
			Status.StatusName
	FROM Student
	INNER JOIN StudentRoster ON Student.Student_ID = StudentRoster.Student_ID	
	INNER JOIN MemberType ON StudentRoster.Member_ID = MemberType.Member_ID
	INNER JOIN Status ON StudentRoster.Status_ID = Status.Status_ID
	INNER JOIN Organization	ON StudentRoster.Organization_ID = Organization.Organization_ID
	WHERE Student.Active = 1 
	AND StudentRoster.EndDate IS NULL
	ORDER BY Organization.OrganizationName, Student.LastName, Student.FirstName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

