USE [StudentOrgs]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMyOrgsReportRoster]    Script Date: 7/17/2016 8:24:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5/23/2016>
-- Description:	<Description,,Return the list of Organizations that this user is limited to>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMyOrgsReportRoster]
	-- Add the parameters for the stored procedure here
	@OrgID varchar(20),
	@cl_filter varchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT StudentRoster.Organization_ID, 
			Student.Student_ID, 
			(select Session + convert(char(40),Year) from Term) Term,
			Organization.OrganizationName,
			MemberType.MemberName, 
			MemberType.Member_ID,
			Student.Carroll_ID, 
			Student.FirstName, 
			Student.LastName, 
			CASE WHEN MemberName = 'President' THEN '1'
				WHEN MemberName = 'Vice President' THEN '2'
				WHEN MemberName = 'Treasurer' THEN '3'
				WHEN MemberName = 'Secretary' THEN '4'
				WHEN MemberName <> 'Member' THEN '5'
				ELSE 999 
			END sort_order,
			CASE WHEN Student.ClassOf = 'SR' THEN 'Senior'
				WHEN Student.ClassOf = 'JR' THEN 'Junior'
				WHEN Student.ClassOf = 'SO' THEN 'Sophomore'
				WHEN Student.ClassOf IN ('FR','FF') THEN 'Freshman'
				WHEN Student.ClassOf = 'UN' THEN 'Transfer'
				WHEN Student.ClassOf = 'S' THEN 'Special'
				WHEN Student.ClassOf = 'GR' THEN 'Graduate'
				ELSE Student.ClassOf 
			END classification
	FROM Student
	INNER JOIN StudentRoster on Student.Student_ID = StudentRoster.Student_ID
	INNER JOIN Organization on StudentRoster.Organization_ID = Organization.Organization_ID
	INNER JOIN MemberType on StudentRoster.Member_ID = MemberType.Member_ID
	WHERE StudentRoster.Organization_ID = @OrgID
	AND StudentRoster.EndDate is null
	AND (Student.ClassOf = @cl_filter 
		OR (@cl_filter = 'FR' AND Student.ClassOf in ('FF','FR'))
		OR @cl_filter = '**')
	ORDER BY Organization_ID, sort_order, MemberType.MemberName, LastName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
