USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetActiveMembersForAllOrganization]    Script Date: 02/08/2013 09:39:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetActiveMembersForAllOrganization]
	-- Add the parameters for the stored procedure here
	@BeginDate varchar(20),
	@EndDate varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	IF Convert(Date,@EndDate) >= CONVERT(VARCHAR(10),GETDATE(),111)
	Begin
		SELECT Organization.OrganizationName,
			Count(Distinct StudentRoster.Student_ID) as "Number of Members"
		FROM Student
		INNER JOIN StudentRoster ON Student.Student_ID = StudentRoster.Student_ID	
		INNER JOIN Organization ON StudentRoster.Organization_ID  = Organization.Organization_ID
		WHERE Student.Active = 1 
		AND StudentRoster.BeginDate >= @BeginDate 
		AND StudentRoster.EndDate IS null
		GROUP BY Organization.OrganizationName
		ORDER BY Organization.OrganizationName
	End
	Else
	Begin
		SELECT Organization.OrganizationName,
			Count(Distinct StudentRoster.Student_ID) as "Number of Members"
		FROM Student
		INNER JOIN StudentRoster ON Student.Student_ID = StudentRoster.Student_ID	
		INNER JOIN Organization ON StudentRoster.Organization_ID = Organization.Organization_ID
		WHERE Student.Active = 1 
		AND StudentRoster.BeginDate >= @BeginDate 
		AND StudentRoster.EndDate <= @EndDate
		GROUP BY Organization.OrganizationName
		ORDER BY Organization.OrganizationName
	End
	
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO

