USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateIncident]    Script Date: 02/08/2013 09:55:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateIncident]
	-- Add the parameters for the stored procedure here
	@Incident_ID int,
	@Date varchar(20),
	@DateReported varchar(20),
	@Location varchar(50),
	@Incident varchar(MAX),
	@Result varchar(MAX),
	@Notes varchar(50),
	@FollowUp varchar(MAX),
	@ReportedBy varchar(50),
	@Time varchar(10),
	@Organization_ID int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Incident
   SET [Date] = Convert(DateTime,@Date)
      ,[DateReported] = Convert(DateTime,@DateReported)
      ,[Location] = @Location
      ,[Incident] = @Incident
      ,[Result] = @Result 
      ,[Notes] = @Notes
      ,[Organization_ID] = @Organization_ID
      ,[ReportedBy] = @ReportedBy
      ,[FollowUp] = @FollowUp
      ,[Time] = @Time
 WHERE Incident_ID = @Incident_ID
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

