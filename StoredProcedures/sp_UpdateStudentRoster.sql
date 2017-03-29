USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateStudentRoster]    Script Date: 02/08/2013 09:57:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateStudentRoster]
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
	DECLARE @Member int,@Session varchar(4),@Year varchar(4)
	
	Select @Session = Session From Term
	Select @Year = Year From Term 
	
    -- Insert statements for procedure here
    IF EXISTS(SELECT Student_ID FROM StudentRoster WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL)
    BEGIN
		SELECT @Member =  Member_ID FROM StudentRoster WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID
		IF (@Member != @Member_ID)
		BEGIN
			UPDATE StudentRoster SET ENDDATE = CURRENT_TIMESTAMP, PrimaryContact = @PrimaryContact, Session = @Session, Year = @Year
			WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL
			
			INSERT INTO [StudentOrgs].[dbo].[StudentRoster]
           ([Organization_ID]
           ,[Student_ID]
           ,[BeginDate]
           ,[EndDate]
           ,[Member_ID]
           ,[Session]
           ,[Year]
           ,[Status_ID]
           ,[PrimaryContact])
     VALUES
           (@Organization_ID
           ,@Student_ID
           ,CURRENT_TIMESTAMP
           ,NULL
           ,@Member_ID
           ,NULL
           ,NULL
           ,1
           ,@PrimaryContact)
		END
		ELSE
		BEGIN
		UPDATE StudentRoster SET PrimaryContact = @PrimaryContact, Session = @Session, Year = @Year
			WHERE Student_ID = @Student_ID AND Organization_ID = @Organization_ID AND ENDDATE IS NULL
			
		END
    END
    ELSE
        BEGIN
    		INSERT INTO [StudentOrgs].[dbo].[StudentRoster]
           ([Organization_ID]
           ,[Student_ID]
           ,[BeginDate]
           ,[EndDate]
           ,[Member_ID]
           ,[Session]
           ,[Year]
           ,[Status_ID]
           ,[PrimaryContact])
     VALUES
           (@Organization_ID
           ,@Student_ID
           ,CURRENT_TIMESTAMP
           ,NULL
           ,@Member_ID
           ,@Session
           ,@Year
           ,1
           ,@PrimaryContact)
    END

if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

