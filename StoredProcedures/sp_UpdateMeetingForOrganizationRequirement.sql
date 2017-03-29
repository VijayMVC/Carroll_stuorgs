USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMeetingForOrganizationRequirement]    Script Date: 02/08/2013 09:56:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMeetingForOrganizationRequirement]
	-- Add the parameters for the stored procedure here
	@OrganizationID int,
	@MeetingID int,
	@Student1 int,
	@Student2 int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgRequiredEvents]
   SET [Student1] = @Student1
      ,[Student2] = @Student2
      ,[Attended] = 1
 WHERE Organization_ID = @OrganizationID AND MeetingID = @MeetingID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

