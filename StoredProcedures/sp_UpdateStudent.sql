USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateStudent]    Script Date: 02/08/2013 09:57:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateStudent]
	-- Add the parameters for the stored procedure here
	@Student_ID int,
	@CertifiedDriver bit,
	@ApprovedDriver bit,
	@GreekGPA bit
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Student 
	SET CertifiedDriver=@CertifiedDriver, ApprovedDriver=@ApprovedDriver,GreekGPA=@GreekGPA
	FROM Student WHERE Student_ID=@Student_ID
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

