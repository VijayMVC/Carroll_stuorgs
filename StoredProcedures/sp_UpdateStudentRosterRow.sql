USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateStudentRosterRow]    Script Date: 02/08/2013 09:57:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateStudentRosterRow]
	-- Add the parameters for the stored procedure here
	@Student_ID int,
	@Organization_ID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Session varchar(4),@Year varchar(4)
	
	Select @Session = Session From Term
	Select @Year = Year From Term 
    -- Insert statements for procedure here
   UPDATE StudentRoster
   SET EndDate = CURRENT_TIMESTAMP, Session = @Session, Year = @Year
   WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL AND Member_ID = 22
 
 
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 

GO

