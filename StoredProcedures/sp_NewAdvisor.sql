USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewAdvisor]    Script Date: 02/08/2013 09:52:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewAdvisor]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20),
	@FirstName varchar(20),
	@Email varchar(50),
	@PhoneNumber varchar(20),
	@OffCampus bit,
	@AdvisorTitle varchar(500),
	@ProfessionalTitle varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Advisor (LastName, FirstName, Email, PhoneNumber, OffCampus,AdvisorTitle,ProfessionalTitle)
	VALUES (@LastName, @FirstName, @Email, @PhoneNumber, @OffCampus,@AdvisorTitle,@ProfessionalTitle)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

