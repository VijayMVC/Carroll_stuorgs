USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMeetingForOrgTOSignedUP]    Script Date: 02/08/2013 09:46:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMeetingForOrgTOSignedUP]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@Organization_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	SELECT RequiredEventMeetings.MeetingID,RequiredEventMeetings.RequiredEventID,RequiredEventMeetings.Session,RequiredEventMeetings.Year,
			RequiredEventMeetings.MeetingRoomNumber,RequiredEventMeetings.MeetingTime,RequiredEventMeetings.Notes,RequiredEventMeetings.MeetingBuilding,RequiredEventMeetings.MeetingDate
	
	FROM RequiredEventMeetings 
	LEFT OUTER JOIN (SELECT * FROM OrgRequiredEvents WHERE Organization_ID = @Organization_ID)	 ResultSet
	ON RequiredEventMeetings.MeetingID = ResultSet.MeetingID
	WHERE  ResultSet.MeetingID IS NULL
	AND RequiredEventID = @Event_ID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

