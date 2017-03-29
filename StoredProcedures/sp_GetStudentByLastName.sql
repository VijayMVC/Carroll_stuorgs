USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudentByLastName]    Script Date: 02/08/2013 09:50:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Sree>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetStudentByLastName]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT LastName,FirstName,Carroll_ID
	FROM Student	
	WHERE Student.LastName = @LastName
	
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 
GO

