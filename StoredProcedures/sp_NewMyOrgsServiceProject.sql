USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewMyOrgsServiceProject]    Script Date: 08/05/2016 09:54:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewMyOrgsServiceProject]
	-- Add the parameters for the stored procedure here	
	@Organization_ID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Service_ID int;
	
    -- Insert statements for procedure here
	--create a blank template for the student to fill out
	INSERT INTO ServiceProject (Organization_ID,CommunityPartner,ContactName,ContactPhone,ContactEmail,
								NoOfVolunteers,HoursVolunteered,Description,
								OnGoing,Location,StartDate,EndDate,TimeFrom,
								TimeTo,MeetDay,MeetFrequency,Title,Funds)

	VALUES (@Organization_ID,NULL,NULL,NULL,NULL,
			0, 0,'',
			0,null,getdate(),null,null,
			null,null,null,'Service Project Title',null)
	
	SELECT @Service_ID = SCOPE_IDENTITY()

	IF @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
	else 
	BEGIN
		--return the Event ID for the event that was just created.
		return @Service_ID;
	END
END 

GO

