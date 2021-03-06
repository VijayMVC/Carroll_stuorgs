USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetExecutiveMembersForOrganizationID]    Script Date: 02/08/2013 09:45:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetExecutiveMembersForOrganizationID]
	-- Add the parameters for the stored procedure here	
	@Organization_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT Organization.OrganizationName,
		Student.FirstName,
		Student.LastName,
		Student.Carroll_ID,
		MemberType.MemberName
	FROM Student 
	INNER JOIN StudentRoster ON Student.Student_ID = StudentRoster.Student_ID	
	INNER JOIN Organization	ON StudentRoster.Organization_ID  = Organization.Organization_ID
	INNER JOIN MemberType ON MemberType.Member_ID = StudentRoster.Member_ID
	WHERE Student.Active = 1 
	AND MemberType.BoardMember = 1 
	AND StudentRoster.EndDate IS NULL
	AND Organization.Organization_ID = @Organization_ID
	ORDER BY Student.LastName, Student.FirstName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

