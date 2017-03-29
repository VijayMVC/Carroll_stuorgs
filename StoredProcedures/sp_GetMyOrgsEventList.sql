USE [StudentOrgs]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMyOrgsEventList]    Script Date: 9/2/2016 3:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5/23/2016>
-- Description:	<Description,,Return the list of Organizations that this user is limited to>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMyOrgsEventList]
	-- Add the parameters for the stored procedure here
	@OrgID varchar(20),
	@Incl_Old varchar(1) = 'N'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @Incl_Old IS NULL
		SELECT @Incl_Old = 'N'

    -- Insert statements for procedure here
	SELECT OrgEvent.Event_ID,
			OrgEvent.Organization_ID,
			COALESCE(CONVERT(VARCHAR(10), OrgEvent.Date, 101),'') EventDate, 
			OrgEvent.Time EventTime, 
			OrgEvent.Title, 
			OrgEvent.OrganizationWorkedWith
	FROM OrgEvent
	WHERE OrgEvent.Organization_ID = @OrgID
	AND (COALESCE(OrgEvent.Date,getdate()) >= convert(varchar(2),month(getdate())) + '-' + convert(varchar(2),day(getdate())) + '-' + convert(varchar(4),year(getdate()))
		OR @Incl_Old = 'Y')
	ORDER BY OrgEvent.Organization_ID, EventDate, EventTime
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
