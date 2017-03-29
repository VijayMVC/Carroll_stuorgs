USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMeetingForOrgSignedUPForDate]    Script Date: 02/08/2013 09:46:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMeetingForOrgSignedUPForDate]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@OrganizationID int,
	@Date varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM RequiredEventMeetings
	INNER JOIN 	OrgRequiredEvents 
	ON RequiredEventMeetings.MeetingID = OrgRequiredEvents.MeetingID
	WHERE RequiredEventID = @Event_ID AND Organization_ID = @OrganizationID AND Attended = 0
	AND MeetingDate = Convert(Datetime,@Date)
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

