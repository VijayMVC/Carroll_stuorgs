USE [StudentOrgs]
GO
/****** Object  StoredProcedure [dbo].[sp_GetMyOrgsRoster]    Script Date 7172016 82442 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author		Author,,Shannon
-- Create date Create Date,,5232016
-- Description	Description,,Return the list of Organizations that this user is limited to
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMyOrgsRoster]
	-- Add the parameters for the stored procedure here
	@OrgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  StudentRoster.Organization_ID
			, Student.Student_ID
			, Student.Carroll_ID
			, Student.FirstName
			, Student.LastName
			, MemberType.MemberName
			, MemberType.Member_ID
			, CASE WHEN MemberName = 'President' THEN '1'
				WHEN MemberName = 'Vice President' THEN '2'
				WHEN MemberName = 'Treasurer' THEN '3'
				WHEN MemberName = 'Secretary' THEN '4'
				WHEN MemberName = 'Member' THEN '5'
				ELSE '999' 
			END sort_order
	FROM Student
	INNER JOIN StudentRoster on Student.Student_ID = StudentRoster.Student_ID
	INNER JOIN MemberType on StudentRoster.Member_ID = MemberType.Member_ID
	WHERE Organization_ID = @OrgID
	AND StudentRoster.EndDate is null
	ORDER BY Organization_ID, sort_order, MemberType.MemberName, LastName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
