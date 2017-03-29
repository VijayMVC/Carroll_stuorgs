USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNonExecutiveMembersForOrgID]    Script Date: 02/08/2013 09:47:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetNonExecutiveMembersForOrgID]
	-- Add the parameters for the stored procedure here
	@Organization_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Student.Student_ID,Student.LastName,Student.FirstName	
	FROM Student
	LEFT OUTER JOIN 
	(
		SELECT StudentRoster.Student_ID FROM StudentRoster 
		INNER JOIN MemberType
		ON StudentRoster.Member_ID = MemberType.Member_ID
		WHERE StudentRoster.Organization_ID = @Organization_ID AND MemberType.BoardMember = 1 AND StudentRoster.EndDate IS NULL
	) RESULTSET
	ON Student.Student_ID = RESULTSET.Student_ID
	WHERE RESULTSET.Student_ID IS NULL AND Student.Active != 0
	Order By Student.LastName

if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 



GO

