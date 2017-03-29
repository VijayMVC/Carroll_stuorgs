USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewStudentRosterRow]    Script Date: 02/08/2013 09:55:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewStudentRosterRow]
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@Student_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Session varchar(4),@Year varchar(4)
	
	Select @Session = Session From Term
	Select @Year = Year From Term 
		-- Insert statements for procedure here
		IF NOT EXISTS
        (
			SELECT 1
			FROM StudentRoster
			WHERE Organization_ID = @Organization_ID AND Student_ID = @Student_ID AND ENDDATE IS NULL AND Member_ID = 22
        )

        BEGIN
        INSERT INTO StudentRoster (Student_ID,BeginDate, EndDate,Organization_ID,Member_ID,Session,Year)
		VALUES (@Student_ID,CURRENT_TIMESTAMP,NULL,@Organization_ID,22,@Session,@Year)            
        END
    
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END


GO

