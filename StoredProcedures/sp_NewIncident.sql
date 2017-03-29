USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewIncident]    Script Date: 02/08/2013 09:52:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewIncident]
	-- Add the parameters for the stored procedure here
	@Date nvarchar(20), 
	@DateReported nvarchar(20), 
	@Time varchar(10), 
	@Location Varchar(50),
	@Incident varchar(MAX),
	@Result varchar(MAX),
	@Notes varchar(MAX),
	@FollowUp varchar(MAX),
	@Organization_ID int,
	@ReportedBy varchar(50),
	@CommentText varchar(MAX),
	@CommentDate varchar(20),
	@Incident_ID int OUT,
	@UserName varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
    -- Insert statements for procedure here
	INSERT INTO Incident (Incident.Date,DateReported, Incident.Time, Location, Incident, Result, Notes, Organization_ID, ReportedBy,FollowUp )
	VALUES (CONVERT(datetime,@Date),CONVERT(datetime,@DateReported), @Time, @Location, @Incident, @Result, @Notes, @Organization_ID, @ReportedBy, @FollowUp)
	
	SELECT @Incident_ID  = SCOPE_IDENTITY()
	
	INSERT INTO IncidentComments (Date,Text,Incident_ID,UserID)
	VALUES (CONVERT(datetime,@CommentDate),@CommentText,@Incident_ID,@UserName)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

