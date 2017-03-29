USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgEventChecklist]    Script Date: 08/02/2016 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/02/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgEventChecklist]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@location bit,
	@marketing bit,
	@catering bit,
	@event_signup bit,
	@activity_waiver bit,
	@cu_night bit

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgEvent]
	SET  RoomReserved = @location
		,Marketing = @marketing
		,Catering = @catering
		,SignupForm = @event_signup
		,ActivityWaiver = @activity_waiver
		,CUNight = @cu_night
	WHERE Event_ID = @Event_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

