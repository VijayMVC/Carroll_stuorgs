USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgEventDetails]    Script Date: 07/27/2016 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,07/27/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgEventDetails]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@Title varchar(50),
	@Description varchar(MAX),
	@OnOffCampus bit,
	@Location varchar(50),
	@Date varchar(20),
	@Time varchar(10),
	@Attendence varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgEvent]
	SET [Title] = @Title
	  ,[Description] = @Description
	  ,[OnOffCampus] = @OnOffCampus
	  ,[Location] = @Location
	  ,[Date] = Convert(Datetime,@Date)
	  ,[Time] = @Time
	  ,[Attendance] = Convert(Int,@Attendence)
	WHERE Event_ID = @Event_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

