USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgServiceDetails]    Script Date: 08/05/2016 09:57:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,08/05/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgServiceDetails]
	-- Add the parameters for the stored procedure here
	@ServiceProject_ID int,
	@Title varchar(150),
	@Description varchar(MAX),
	@OnGoing bit,
	@Location varchar(50),
	@StartDate varchar(20),
	@TimeFrom varchar(10),
	@TimeTo varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[ServiceProject]
	SET [Title] = @Title
      ,[Description] = @Description
      ,[OnGoing] = @OnGoing
      ,[Location] = @Location
      ,[StartDate] = @StartDate
      ,[TimeFrom] = @TimeFrom
      ,[TimeTo] = @TimeTo
	WHERE ServiceProject_ID = @ServiceProject_ID
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

