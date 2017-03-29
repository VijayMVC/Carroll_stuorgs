USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateAdvisor]    Script Date: 02/08/2013 09:55:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateAdvisor]
	-- Add the parameters for the stored procedure here
	@Advisor_ID int,
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
	UPDATE Advisor 
	SET LastName=@LastName, FirstName=@FirstName, Email=@Email, PhoneNumber=@PhoneNumber, OffCampus=@OffCampus,
	AdvisorTitle = @AdvisorTitle,ProfessionalTitle=@ProfessionalTitle
	FROM Advisor WHERE Advisor_ID=@Advisor_ID
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

