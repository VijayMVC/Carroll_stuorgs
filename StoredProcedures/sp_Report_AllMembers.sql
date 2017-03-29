USE [StudentOrgs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Report_AllMembers]    Script Date: 8/10/2016 8:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,8/10/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Report_AllMembers]
	-- Add the parameters for the stored procedure here
	@ClassOf varchar(2),
	@OnCampus char(1),
	@Race varchar(50),
	@International char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--DECLARE @ClassOf varchar(2), @OnCampus char(1), @Race varchar(50), @International char(1)
	--baseline testing
	--SELECT @ClassOf = '**', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --1373
	--international testing
	--SELECT @ClassOf = '**', @OnCampus = 'B', @Race = '*ALL*', @International = 'Y' --31
	--SELECT @ClassOf = '**', @OnCampus = 'B', @Race = '*ALL*', @International = 'N' --1342
	--on campus testing
	--SELECT @ClassOf = '**', @OnCampus = 'Y', @Race = '*ALL*', @International = 'B' --1131
	--SELECT @ClassOf = '**', @OnCampus = 'N', @Race = '*ALL*', @International = 'B' --242
	--clasification testing
	--SELECT @ClassOf = 'FR', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --11
	--SELECT @ClassOf = 'FF', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --4
	--SELECT @ClassOf = 'S', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --9
	--SELECT @ClassOf = 'GR', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --12
	--SELECT @ClassOf = 'UN', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --2
	--SELECT @ClassOf = 'SO', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --377
	--SELECT @ClassOf = 'JR', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --446
	--SELECT @ClassOf = 'SR', @OnCampus = 'B', @Race = '*ALL*', @International = 'B' --512
	
    -- Insert statements for procedure here
	SELECT (SELECT ltrim(rtrim(Session)) + Year FROM Term) as Term
		, Organization.OrganizationName
		, MemberType.MemberName
		, Student.Carroll_ID
		, Student.FirstName
		, Student.LastName
		, Student.Email
		, CASE WHEN Student.ClassOf in ('FF') THEN 'First-Time Freshman'
				WHEN Student.ClassOf in ('FR') THEN 'Freshman'
				WHEN Student.ClassOf in ('SO') THEN 'Sophomore'
				WHEN Student.ClassOf in ('JR') THEN 'Junior'
				WHEN Student.ClassOf in ('SR') THEN 'Senior'
				WHEN Student.ClassOf in ('GN','GR') THEN 'Graduate Student'
				WHEN Student.ClassOf in ('S') THEN 'Special'
				WHEN Student.ClassOf in ('UN') THEN 'Unknown'
				END ClassOf
		, CASE WHEN Student.OnCampus = 'N' THEN 'No'
			ELSE 'Yes' END LivesOnCampus
		, Student.Race
		, CASE WHEN Student.International = 'N' THEN 'No'
			ELSE 'Yes' END IntlStudent
	FROM Student
	INNER JOIN StudentRoster ON StudentRoster.Student_ID = Student.Student_ID
	INNER JOIN MemberType ON MemberType.Member_ID = StudentRoster.Member_ID
	INNER JOIN Organization ON StudentRoster.Organization_ID = Organization.Organization_ID
	INNER JOIN OrgStatus ON OrgStatus.Organization_ID = Organization.Organization_ID
	WHERE StudentRoster.EndDate IS NULL --Active Members
	AND OrgStatus.EndDate IS NULL
	AND OrgStatus.Status_ID IN (1, 2, 4) --active Orgs
	AND ( (Student.ClassOf = @ClassOf OR (@ClassOf = 'GR' AND Student.ClassOf in ('GR','GN')) OR @ClassOf = '**')
		AND (Student.OnCampus = @OnCampus OR @OnCampus = 'B')
		AND (Student.Race = @Race OR @Race = '*ALL*')
		AND (Student.International = @International OR @International = 'B')
		)
	ORDER BY OrganizationName, Student.LastName, Student.FirstName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
