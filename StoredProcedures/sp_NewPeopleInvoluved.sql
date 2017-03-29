USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewPeopleInvoluved]    Script Date: 02/08/2013 09:54:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewPeopleInvoluved]
	-- Add the parameters for the stored procedure here
	@StudentID int,
	@IncidentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO PeopleInvolved (Student_ID, incident_ID)
	VALUES (@StudentID, @IncidentID)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

