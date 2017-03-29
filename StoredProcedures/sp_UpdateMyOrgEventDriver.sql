

USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgEventDriver]    Script Date: 08/02/2016 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,8.2.2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgEventDriver]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@Student_ID int,
	@mode varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @driver1 int,
			@driver2 int

	SELECT  @driver1 = Driver1,
			@driver2 = Driver2
	FROM OrgEvent
	WHERE Event_ID = @Event_ID

	if @@ERROR<>0
	BEGIN 
		raiserror('101',16,1)
		return -101;
	END

	--removing a driver
	IF @mode = 'D'
	BEGIN
		IF @driver1 = @Student_ID
		BEGIN
			UPDATE [StudentOrgs].[dbo].[OrgEvent]
			SET Driver1 = null
			WHERE Event_ID = @Event_ID
 
			if @@ERROR<>0
			BEGIN 
				raiserror('100',16,1)
				return -100;
			END
		END
		
		IF @driver2 = @Student_ID
		BEGIN
			UPDATE [StudentOrgs].[dbo].[OrgEvent]
			SET Driver2 = null
			WHERE Event_ID = @Event_ID
 
			if @@ERROR<>0
			BEGIN 
				raiserror('105',16,1)
				return -105;
			END
		END
	END

	IF @mode = 'A'
	BEGIN
		IF @driver1 is not null and @driver2 is not null
		BEGIN
			--error out. We shouldn't have gotten this far.
			if @@ERROR<>0
			BEGIN 
				raiserror('120',16,1)
				return -120;
			END
		END

		IF (@driver1 is null)
		AND (coalesce(@driver2,0) <> @Student_ID)
		BEGIN
			UPDATE [StudentOrgs].[dbo].[OrgEvent]
			SET Driver1 = @Student_ID
			WHERE Event_ID = @Event_ID
 
			if @@ERROR<>0
			BEGIN 
				raiserror('110',16,1)
				return -110;
			END
			
			SELECT @driver1 = @Student_ID
		END

		IF (@driver2 is null)
		AND (coalesce(@driver1,0) <> @Student_ID)
		BEGIN
			UPDATE [StudentOrgs].[dbo].[OrgEvent]
			SET Driver2 = @Student_ID
			WHERE Event_ID = @Event_ID
 
			if @@ERROR<>0
			BEGIN 
				raiserror('115',16,1)
				return -115;
			END
		END
	END
		
	else return 0;
END 

GO

