USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_Report_GPAFail]    Script Date: 08/09/2016 09:39:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/09/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Report_GPAFail]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT (SELECT ltrim(rtrim(Session))+Year FROM Term) as Term
		, Organization.OrganizationName
		, MemberType.MemberName
		, Student.Carroll_ID
		, Student.FirstName
		, Student.LastName
		, Student.Email
		, case when MemberType.BoardMember = 1 and Student.GPABoard = 0 
			then 'Fail' else null end GPABoard
		, case when Student.GPAOrg = 0 
			then 'Fail' else 'Pass' end GPAOrg
	FROM StudentRoster
	INNER JOIN Organization on StudentRoster.Organization_ID = Organization.Organization_ID
	INNER JOIN OrgStatus on Organization.Organization_ID = OrgStatus.Organization_ID
	INNER JOIN Student on Student.Student_ID = StudentRoster.Student_ID
	INNER JOIN MemberType on StudentRoster.Member_ID = MemberType.Member_ID
	WHERE StudentRoster.EndDate IS NULL
	AND ((Student.GPABoard = 0 AND MemberType.BoardMember = 1) OR Student.GPAOrg = 0)
	AND OrgStatus.EndDate IS NULL
	AND OrgStatus.Status_ID IN (1,2,4) --Active Org
	ORDER BY StudentRoster.Organization_ID, Student.LastName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

