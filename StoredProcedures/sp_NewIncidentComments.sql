USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewIncidentComments]    Script Date: 02/08/2013 09:52:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewIncidentComments]
	-- Add the parameters for the stored procedure here
	@Incident_ID int, 
	@Date varchar(20), 
	@Text text,
	@UserID varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO IncidentComments (Incident_ID, Date, text,UserID)
	VALUES (@Incident_ID,  CONVERT(datetime,@Date), @Text,@UserID)

	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

