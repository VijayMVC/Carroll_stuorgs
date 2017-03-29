USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgs_Organization]    Script Date: 07/22/2016 07:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,07/22/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgs_Organization]
	-- Add the parameters for the stored procedure here
	@Organization_ID int, 
	@UpdateMode varchar(1),
	@Description varchar(MAX),
	@MeetingDay varchar(20),
	@MeetingTime varchar(20),
	@MeetingFrequency varchar(150),
	@MeetingBuilding varchar(20),
	@MeetingRoom varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @UpdateMode = '1'
	BEGIN
		UPDATE Organization
		SET Description=@Description
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @UpdateMode = '2'
	BEGIN
		UPDATE Organization
		SET MeetingDay=@MeetingDay
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @UpdateMode = '3'
	BEGIN
		UPDATE Organization
		SET MeetingTime=@MeetingTime
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @UpdateMode = '4'
	BEGIN
		UPDATE Organization
		SET MeetingFrequency = @MeetingFrequency
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @UpdateMode = '5'
	BEGIN
		UPDATE Organization
		SET MeetingBuilding=@MeetingBuilding
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	IF @UpdateMode = '6'
	BEGIN
		UPDATE Organization
		SET MeetingRoom=@MeetingRoom
		FROM Organization 
		WHERE Organization_ID=@Organization_ID
		
		if @@ERROR<>0
		BEGIN 
			raiserror('100',16,1)
			return -100;
		END
	END
	
	return 0;
END 

GO

