USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewMeetingForOrganizationRequirement]    Script Date: 02/08/2013 09:52:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewMeetingForOrganizationRequirement]
	-- Add the parameters for the stored procedure here
	@OrganizationID int,
	@MeetingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [StudentOrgs].[dbo].[OrgRequiredEvents]
           ([MeetingID]
           ,[Notes]
           ,[Organization_ID]
           ,[Student1]
           ,[Student2]
           ,[Attended])
     VALUES
           (@MeetingID
           ,NULL
           ,@OrganizationID
           ,NULL
           ,NULL
           ,0)
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

