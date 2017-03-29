USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetPeopleInvoluvedForIncident]    Script Date: 02/08/2013 09:49:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetPeopleInvoluvedForIncident]
	-- Add the parameters for the stored procedure here
	@IncidentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Org_ID int
    -- Insert statements for procedure here
	-- Insert statements for procedure here
	SET @Org_ID = (Select Organization_ID From Incident Where Incident_ID = @IncidentID)	
	SELECT Student.LastName, Student.FirstName,MemberType.MemberName
	FROM Student
	INNER JOIN StudentRoster
	ON Student.Student_ID = StudentRoster.Student_ID
	INNER JOIN MemberType
	ON MemberType.Member_ID = StudentRoster.Member_ID
	INNER JOIN PeopleInvolved
	ON Student.Student_ID = PeopleInvolved.Student_ID
	WHERE PeopleInvolved.Incident_ID = @IncidentID 	AND StudentRoster.EndDate IS NULL AND StudentRoster.Organization_ID = @Org_ID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

