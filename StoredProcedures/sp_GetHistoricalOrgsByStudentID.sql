USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHistoricalOrgsByStudentID]    Script Date: 06/06/2016 19:17:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,6/6/2016>
-- Description:	<Description,,Return the list of Organizations that this user has been a member of>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetHistoricalOrgsByStudentID]
	-- Add the parameters for the stored procedure here
	@Carroll_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @results table(OrganizationName varchar(100), Session char(2), Year int, 
					MemberName varchar(20), BeginDate smalldatetime, Sort varchar(17));

	INSERT INTO @results (OrganizationName, Session, Year, MemberName, BeginDate, Sort)
    -- Insert statements for procedure here
	SELECT Organization.OrganizationName, StudentRoster.Session, StudentRoster.Year, MemberType.MemberName, StudentRoster.BeginDate, 
			rtrim(ltrim(Session))+convert(char(4),Year)+'1'
	FROM dbo.Student
	INNER JOIN dbo.StudentRoster on dbo.Student.Student_ID = dbo.StudentRoster.Student_ID
	INNER JOIN dbo.Organization on dbo.Organization.Organization_ID = dbo.StudentRoster.Organization_ID
	INNER JOIN dbo.MemberType on dbo.MemberType.Member_ID = dbo.StudentRoster.Member_ID
	WHERE Carroll_ID = @Carroll_ID
	AND BoardMember = 1;
	
	INSERT INTO @results (OrganizationName, Session, Year, MemberName, BeginDate, Sort)
    -- Insert statements for procedure here
	SELECT Organization.OrganizationName, StudentRoster.Session, StudentRoster.Year, MemberType.MemberName, StudentRoster.BeginDate, 
		rtrim(ltrim(Session))+convert(char(4),Year)+'2'
	FROM dbo.Student
	INNER JOIN dbo.StudentRoster on dbo.Student.Student_ID = dbo.StudentRoster.Student_ID
	INNER JOIN dbo.Organization on dbo.Organization.Organization_ID = dbo.StudentRoster.Organization_ID
	INNER JOIN dbo.MemberType on dbo.MemberType.Member_ID = dbo.StudentRoster.Member_ID
	WHERE Carroll_ID = @Carroll_ID
	AND BoardMember = 0
	AND NOT EXISTS(SELECT * FROM @results results WHERE Organization.OrganizationName = results.OrganizationName
					and StudentRoster.Session = results.Session AND StudentRoster.Year = results.Year);
	
	SELECT OrganizationName as Organization,
			MemberName as [Member Type],
			Session,
			Year
	FROM @results
	ORDER BY Sort, BeginDate DESC, MemberName, OrganizationName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

