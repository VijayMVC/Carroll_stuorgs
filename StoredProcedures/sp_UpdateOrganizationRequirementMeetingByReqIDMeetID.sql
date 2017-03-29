USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrganizationRequirementMeetingByReqIDMeetID]    Script Date: 02/08/2013 09:56:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrganizationRequirementMeetingByReqIDMeetID]
	-- Add the parameters for the stored procedure here
	@RequiredEventID int,
	@MeetingID int,
	@Session varchar(50),
	@Year varchar(5),
	@MeetingDate varchar(20),
	@MeetingTime varchar(10),
	@MeetingBuilding  varchar(10),
	@MeetingRoomNumber varchar(10),
	@Notes varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here    
	UPDATE [StudentOrgs].[dbo].[RequiredEventMeetings]
	SET [Session] = @Session
      ,[Year] = @Year
      ,[MeetingDate] = Convert(Datetime,@MeetingDate)
      ,[MeetingTime] = @MeetingTime
      ,[MeetingBuilding] = @MeetingBuilding
      ,[MeetingRoomNumber] = @MeetingRoomNumber
      ,[Notes] = @Notes
	WHERE RequiredEventID=@RequiredEventID AND MeetingID =@MeetingID
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

