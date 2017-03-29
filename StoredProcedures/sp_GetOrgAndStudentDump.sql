USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOrgAndStudentDump]    Script Date: 02/08/2013 09:47:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetOrgAndStudentDump]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Organization.OrganizationName,
			Organization.CX_Code,
			Organization.MeetingDay,
			Organization.MeetingFrequency,
			Organization.MeetingTime,
			Organization.MeetingBuilding,
			Organization.MeetingRoom,
			Organization.DateProposed,
			Organization.ProposalAccepted,
			Organization.ProposalDenied,
			Organization.ConstitutionSubmitted,
			Organization.ConstitutionAccepted,
			Organization.RegistrarApproval,
			Organization.RequirementsMet,
			Organization.RequirementsMetDate,
			Organization.ConstitutionDenied,
			Organization.ConstitutionUpdated,			
			OrgCategory.CategoryName,
			Status.StatusName,
			OrgStatus.StartDate,
			OrgStatus.EndDate,
			Student.Carroll_ID,
			Student.LastName,
			Student.FirstName,			
			MemberType.MemberName,
			StudentRoster.BeginDate,
			StudentRoster.EndDate,
			StudentRoster.Session,
			StudentRoster.Year,
			Student.ClassOF,
			Student.Address,
			Student.Email,
			Student.PreferredPhone,
			Student.Active,
			Student.Gender,
			Student.GPAOrg,
			Student.Major,
			Student.Major2,
			Student.CertifiedDriver,
			Student.ApprovedDriver,
			Student.GPABoard,
			Student.GreekGPA
			
	FROM Student
	INNER JOIN StudentRoster
	ON Student.Student_ID = StudentRoster.Student_ID	
	INNER JOIN MemberType
	ON StudentRoster.Member_ID	= MemberType.Member_ID	
	INNER JOIN Organization
	ON StudentRoster.Organization_ID  = Organization.Organization_ID
	INNER JOIN OrgCategory
	ON OrgCategory.Category_ID = Organization.Category_ID
	INNER JOIN OrgStatus
	ON OrgStatus.Organization_ID  = Organization.Organization_ID
	INNER JOIN Status
	ON Status.Status_ID = OrgStatus.Status_ID		
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

