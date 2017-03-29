USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateStudentRosterToDeleteMember]    Script Date: 02/08/2013 09:58:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateStudentRosterToDeleteMember]
	-- Add the parameters for the stored procedure here
	@Student_ID int,
	@Organization_ID int,
	@Member_ID int,
	@BeginDate varchar(20),
	@PrimaryContact bit	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
    IF EXISTS(SELECT Student_ID FROM StudentRoster WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL)
    BEGIN
		UPDATE StudentRoster SET ENDDATE = CURRENT_TIMESTAMP, PrimaryContact = @PrimaryContact
		WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL
    END

if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

