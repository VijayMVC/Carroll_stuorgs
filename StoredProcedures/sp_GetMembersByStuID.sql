USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMembersByStuID]    Script Date: 02/08/2013 09:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMembersByStuID]
	-- Add the parameters for the stored procedure here
	@Student_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Student.LastName, Student.FirstName, Student.Student_ID ,MemberType.MemberName,MemberType.Member_ID,Student.Carroll_ID,
			StudentRoster.BeginDate,StudentRoster.PrimaryContact
	FROM Student
	INNER JOIN StudentRoster
	ON Student.Student_ID = StudentRoster.Student_ID
	INNER JOIN MemberType
	ON MemberType.Member_ID = StudentRoster.Member_ID
	INNER JOIN Status
	ON StudentRoster.Status_ID  = Status.Status_ID
	WHERE Student.Student_ID = @Student_ID 	AND StudentRoster.EndDate IS NULL
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

